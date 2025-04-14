#include <opencv2/opencv.hpp>
#include <iostream>

using namespace cv;
using namespace std;

int main() {
    Mat src = imread("data/raw/3face_2.jpg");
    if (src.empty()) {
        cerr << "Erreur : image non trouvée." << endl;
        return -1;
    }

    Mat gray, blurred, edges;

    cvtColor(src, gray, COLOR_BGR2GRAY);
    GaussianBlur(gray, blurred, Size(3, 3), 1.0);
    Canny(blurred, edges, 0, 37);

    imshow("Image originale", src);
    imshow("Canny edges", edges);
    waitKey(0);
    return 0;
}
