#include "ColorDetector.hpp"
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>

ColorDetector::ColorDetector() {
    color_ranges = {
        {"red", {cv::Scalar(0, 0, 100), cv::Scalar(50, 50, 255)}},
        {"green", {cv::Scalar(0, 100, 0), cv::Scalar(50, 255, 50)}},
        {"blue", {cv::Scalar(100, 0, 0), cv::Scalar(255, 50, 50)}},
        {"yellow", {cv::Scalar(0, 100, 100), cv::Scalar(50, 255, 255)}},
        {"white", {cv::Scalar(200, 200, 200), cv::Scalar(255, 255, 255)}},
        {"orange", {cv::Scalar(0, 50, 150), cv::Scalar(50, 150, 255)}}
    };
}

std::string ColorDetector::getDominantColor(const cv::Mat& roi) {
    std::map<std::string, int> pixel_counts{};

    for (const auto& color_range : color_ranges) {
        cv::Mat mask;
        cv::inRange(roi, color_range.second.first, color_range.second.second, mask);
        pixel_counts[color_range.first] = cv::countNonZero(mask);
    }

    std::string dominant_color;
    int max_pixels = 0;
    for (const auto& count : pixel_counts) {
        if (count.second > max_pixels) {
            dominant_color = count.first;
            max_pixels = count.second;
        }
    }
    return dominant_color;
}
