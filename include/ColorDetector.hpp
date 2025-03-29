#pragma once
#include <opencv2/opencv.hpp>
#include <string>
#include <map>

class ColorDetector {
public:
    ColorDetector();
    std::string getDominantColor(const cv::Mat& img);

private:
    std::map<std::string, std::pair<cv::Scalar, cv::Scalar>> color_ranges;
};