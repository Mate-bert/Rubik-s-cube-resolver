
#include "split_stickers.hpp"
#include <opencv2/opencv.hpp>
#include <filesystem>
#include <map>
#include <string>
#include <iostream>

namespace fs = std::filesystem;

void splitAllFacesIntoStickers() {
    std::map<std::string, std::string> face_mapping = {
        {"data/output/face_decouper/face_rectified_1.jpg", "up"},
        {"data/output/face_decouper/face_rectified_2.jpg", "front"},
        {"data/output/face_decouper/face_rectified_3.jpg", "right"},
        {"data/output/face_decouper/face_rectified_4.jpg", "left"},
        {"data/output/face_decouper/face_rectified_5.jpg", "back"},
        {"data/output/face_decouper/face_rectified_6.jpg", "down"}
    };

    fs::create_directory("data\\output\\stickers");

    for (const auto& [filename, face_name] : face_mapping) {
        cv::Mat face = cv::imread(filename);
        if (face.empty()) {
            std::cerr << "❌ Image introuvable : " << filename << "\n";
            continue;
        }

        int sticker_size_x = face.cols / 3;
        int sticker_size_y = face.rows / 3;

        for (int row = 0; row < 3; ++row) {
            for (int col = 0; col < 3; ++col) {
                int x = col * sticker_size_x;
                int y = row * sticker_size_y;
                cv::Rect roi(x, y, sticker_size_x, sticker_size_y);
                cv::Mat sticker = face(roi);

                std::string out_name = "data/output/stickers/" + face_name + "_" + std::to_string(row * 3 + col + 1) + ".jpg";
                cv::imwrite(out_name, sticker);
            }
        }
    }
}
