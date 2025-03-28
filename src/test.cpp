#include <opencv2/opencv.hpp>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <map>

// Parse une ligne de type : 3face_1.jpg, face_rectified_1.jpg: x1 y1, x2 y2, x3 y3, x4 y4
bool parseLine(const std::string& line,
               std::string& image_name,
               std::string& output_name,
               std::vector<cv::Point2f>& points)
{
    size_t colon_pos = line.find(':');
    if (colon_pos == std::string::npos) return false;

    std::string left = line.substr(0, colon_pos);
    std::string coords = line.substr(colon_pos + 1);

    // split "image_name, output_name"
    size_t comma_pos = left.find(',');
    if (comma_pos == std::string::npos) return false;

    image_name = left.substr(0, comma_pos);
    output_name = left.substr(comma_pos + 1);
    output_name.erase(0, output_name.find_first_not_of(" ")); // trim

    std::stringstream ss(coords);
    std::string token;
    while (std::getline(ss, token, ',')) {
        float x, y;
        std::stringstream pair(token);
        pair >> x >> y;
        points.emplace_back(x, y);
    }

    return points.size() == 4;
}

int main() {
    std::ifstream file("faces_coords.txt");
    if (!file.is_open()) {
        std::cerr << "Erreur : impossible d'ouvrir faces_coords.txt" << std::endl;
        return -1;
    }

    // Cache des images redimensionnées pour ne pas les recharger plusieurs fois
    std::map<std::string, cv::Mat> resized_images;
    const int target_height = 800;

    std::string line;
    while (std::getline(file, line)) {
        if (line.empty()) continue;

        std::string image_name, output_name;
        std::vector<cv::Point2f> input_points;

        if (!parseLine(line, image_name, output_name, input_points)) {
            std::cerr << "❌ Ligne mal formatée : " << line << std::endl;
            continue;
        }

        // Charger et redimensionner si nécessaire
        if (resized_images.find(image_name) == resized_images.end()) {
            cv::Mat original = cv::imread(image_name);
            if (original.empty()) {
                std::cerr << "Erreur : image " << image_name << " non trouvée !" << std::endl;
                continue;
            }

            double scale = static_cast<double>(target_height) / original.rows;
            cv::Mat resized;
            cv::resize(original, resized, cv::Size(), scale, scale);
            resized_images[image_name] = resized;
        }

        // Homographie et redressement
        std::vector<cv::Point2f> dst_points = {
            {0, 0}, {300, 0}, {300, 300}, {0, 300}
        };

        cv::Mat transform = cv::getPerspectiveTransform(input_points, dst_points);
        cv::Mat rectified;
        cv::warpPerspective(resized_images[image_name], rectified, transform, cv::Size(300, 300));

        cv::imwrite(output_name, rectified);
        std::cout << "✅ " << output_name << " générée depuis " << image_name << std::endl;
    }

    return 0;
}