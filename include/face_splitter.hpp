#pragma once
#include <opencv2/opencv.hpp>
#include <string>
#include <vector>

// Prototype générique (tu peux en faire un par face ensuite)
void splitFaceIntoStickers(const cv::Mat& faceImg, const std::string& prefix);