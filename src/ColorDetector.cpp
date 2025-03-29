
#include "ColorDetector.hpp"

ColorDetector::ColorDetector() {
    color_ranges = {
        {"red",    {cv::Scalar(0, 100, 100),   cv::Scalar(10, 255, 255)}},
        {"orange", {cv::Scalar(11, 100, 100),  cv::Scalar(22, 255, 255)}},
        {"yellow", {cv::Scalar(23, 100, 100),  cv::Scalar(34, 255, 255)}},
        {"green",  {cv::Scalar(35, 80, 80),    cv::Scalar(85, 255, 255)}},
        {"blue",   {cv::Scalar(86, 100, 100),  cv::Scalar(130, 255, 255)}},
        {"white",  {cv::Scalar(0, 0, 200),     cv::Scalar(180, 40, 255)}}
    };
}

std::string ColorDetector::getDominantColor(const cv::Mat& img) {
    cv::Mat resized;
    cv::resize(img, resized, cv::Size(50, 50));
    cv::Mat hsv;
    cv::cvtColor(resized, hsv, cv::COLOR_BGR2HSV);

    std::map<std::string, int> pixel_counts;

    for (const auto& [color_name, range] : color_ranges) {
        cv::Mat mask;
        cv::inRange(hsv, range.first, range.second, mask);
        pixel_counts[color_name] = cv::countNonZero(mask);
    }

    std::string dominant = "unknown";
    int max_pixels = 0;
    for (const auto& [color, count] : pixel_counts) {
        if (count > max_pixels) {
            max_pixels = count;
            dominant = color;
        }
    }

    return dominant;
}
