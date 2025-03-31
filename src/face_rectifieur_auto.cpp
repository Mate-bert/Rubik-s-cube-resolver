
#include "face_rectifieur_auto.hpp"
#include <opencv2/opencv.hpp>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <filesystem>
#include <tuple>
#include <map>
#include <algorithm>

namespace fs = std::filesystem;

std::vector<cv::Point2f> parseCoords(const std::string& coord_str) {
    std::vector<cv::Point2f> points;
    std::stringstream ss(coord_str);
    std::string token;
    while (std::getline(ss, token, ',')) {
        float x, y;
        std::stringstream pair(token);
        pair >> x >> y;
        points.emplace_back(x, y);
    }
    return points;
}

bool loadCoords(const std::string& filename,
                std::vector<std::tuple<std::string, std::string, std::vector<cv::Point2f>>>& coord_entries) {
    std::ifstream file(filename);
    if (!file.is_open()) return false;

    std::string line;
    while (std::getline(file, line)) {
        size_t colon_pos = line.find(':');
        if (colon_pos == std::string::npos) continue;

        std::string left = line.substr(0, colon_pos);
        std::string coords = line.substr(colon_pos + 1);

        size_t comma_pos = left.find(',');
        if (comma_pos == std::string::npos) continue;

        std::string source = left.substr(0, comma_pos);
        std::string output = left.substr(comma_pos + 1);
        output.erase(0, output.find_first_not_of(" "));

        auto pts = parseCoords(coords);
        if (pts.size() == 4) {
            coord_entries.emplace_back(source, output, pts);
        }
    }
    return true;
}

std::vector<fs::path> getMostRecentImages(size_t count = 2) {
    std::vector<fs::directory_entry> entries;
    for (const auto& f : fs::directory_iterator("data/raw")) {
        if (f.path().extension() == ".jpg") {
            entries.push_back(f);
        }
    }
    std::sort(entries.begin(), entries.end(), [](const auto& a, const auto& b) {
        return fs::last_write_time(a) > fs::last_write_time(b);
    });

    std::vector<fs::path> recent;
    for (size_t i = 0; i < std::min(count, entries.size()); ++i) {
        recent.push_back(entries[i].path());
    }
    return recent;
}

void rectifierFacesAutomatically() {
    bool face1_exists = fs::exists("data/raw/3face_1.jpg");
    bool face2_exists = fs::exists("data/raw/3face_2.jpg");

    std::vector<std::string> used_names;
    if (!face1_exists || !face2_exists) {
        auto images = getMostRecentImages(2);
        if (images.size() < 2) return;

        if (!face1_exists) {
            std::string temp1 = "data/raw/3face_1.jpg";
if (!fs::exists(temp1)) {
    fs::copy(images[0], temp1, fs::copy_options::overwrite_existing);
    used_names.push_back(temp1);
}
            used_names.push_back("data/raw/3face_1.jpg");
        }
        if (!face2_exists) {
            std::string temp2 = "data/raw/3face_2.jpg";
if (!fs::exists(temp2)) {
    fs::copy(images[1], temp2, fs::copy_options::overwrite_existing);
    used_names.push_back(temp2);
}
            used_names.push_back("data/raw/3face_2.jpg");
        }
    }

    std::vector<std::tuple<std::string, std::string, std::vector<cv::Point2f>>> coord_entries;
    if (!loadCoords("data/config/faces_coords.txt", coord_entries)) return;
    if (coord_entries.size() < 6) return;

    std::map<std::string, cv::Mat> resized_images;
    const int target_height = 800;

    for (int i = 0; i < 6; ++i) {
        auto& [src_img, out_img_raw, pts] = coord_entries[i];
        std::string out_img = "data/output/face_decouper/" + out_img_raw;
        std::string actual_img = (i < 3) ? "data/raw/3face_1.jpg" : "data/raw/3face_2.jpg";

        if (resized_images.find(actual_img) == resized_images.end()) {
            cv::Mat original = cv::imread(actual_img);
            if (original.empty()) continue;

            double scale = static_cast<double>(target_height) / original.rows;
            cv::Mat resized;
            cv::resize(original, resized, cv::Size(), scale, scale);
            resized_images[actual_img] = resized;
        }

        std::vector<cv::Point2f> dst = {
            {0, 0}, {300, 0}, {300, 300}, {0, 300}
        };

        cv::Mat transform = cv::getPerspectiveTransform(pts, dst);
        cv::Mat rectified;
        cv::warpPerspective(resized_images[actual_img], rectified, transform, cv::Size(300, 300));

        cv::imwrite(out_img, rectified);

        std::cout << "📤 Sauvegarde image vers : " << out_img << std::endl;
if (!cv::imwrite(out_img, rectified)) {
    std::cerr << "❌ Erreur d'écriture : " << out_img << std::endl;
}
    }

    for (const auto& name : used_names) {
        fs::remove(name);
    }
}