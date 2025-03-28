#include "face_splitter.hpp"

void splitFaceIntoStickers(const cv::Mat& faceImg, const std::string& prefix) {
    int rows = 3;
    int cols = 3;

    int cell_width = faceImg.cols / cols;
    int cell_height = faceImg.rows / rows;

    int index = 0;
    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols; ++j) {
            int x = j * cell_width;
            int y = i * cell_height;
            cv::Rect cell(x, y, cell_width, cell_height);
            cv::Mat sticker = faceImg(cell);
            std::string filename = prefix + "_" + std::to_string(index) + ".jpg";
            cv::imwrite(filename, sticker);
            ++index;
        }
    }
}