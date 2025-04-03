#include <opencv2/opencv.hpp>
#include <fstream>
#include <iostream>
#include <sstream>
#include <filesystem>
#include "config.hpp"

using namespace cv;
using namespace std;
namespace fs = std::filesystem;

struct FaceCoords {
    string imageName;
    string outputName;
    vector<Point2f> points;
};

vector<FaceCoords> loadCoords(const string& filepath) {
    vector<FaceCoords> data;
    ifstream infile(filepath);
    string line;

    while (getline(infile, line)) {
        if (line.empty()) continue;

        istringstream ss(line);
        string inputName, outputName;

        // Lire "input.jpg, output.jpg:"
        getline(ss, inputName, ',');
        getline(ss, outputName, ':');

        inputName.erase(remove_if(inputName.begin(), inputName.end(), ::isspace), inputName.end());
        outputName.erase(remove_if(outputName.begin(), outputName.end(), ::isspace), outputName.end());

        vector<Point2f> points;
        float x, y;
        while (ss >> x >> y) {
            points.emplace_back(x, y);
            if (ss.peek() == ',') ss.ignore();
        }

        data.push_back({inputName, outputName, points});
    }
    return data;
}

void rectifierFacesAutomatically() {
    auto cfg = loadYamlConfig("data/config/config.yaml");
    string facesDir = cfg["raw_dir"];
    string outputDir = cfg["rectified_dir"];
    string coordsPath = cfg["coords_file"];
    int imageSize = stoi(cfg["image_size"]);

    vector<FaceCoords> all_faces = loadCoords(coordsPath);

    for (const auto& face : all_faces) {
        string imagePath = (fs::path(facesDir) / face.imageName).string();
        Mat src = imread(imagePath);
        if (src.empty()) {
            cerr << "[Erreur] Impossible de charger " << imagePath << endl;
            continue;
        }

        vector<Point2f> dstPts = {
            Point2f(0, 0), Point2f(imageSize - 1, 0),
            Point2f(imageSize - 1, imageSize - 1), Point2f(0, imageSize - 1)
        };

        Mat H = getPerspectiveTransform(face.points, dstPts);
        Mat rectified;
        warpPerspective(src, rectified, H, Size(imageSize, imageSize));

        string savePath = (fs::path(outputDir) / face.outputName).string();
        imwrite(savePath, rectified);
        cout << "[OK] Sauvegardé : " << savePath << endl;
    }
}