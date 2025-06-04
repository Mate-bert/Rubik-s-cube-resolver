// main.cpp
#include <QApplication>
/*#include <QMainWindow>
#include <QPushButton>
#include <QVBoxLayout>
#include <QWidget>
#include <QLabel>
#include <QMessageBox>
#include "config.hpp"
*/
#include "RubiksPipelineWindow.hpp"


/*
Fonctions de la pipeline
void rectifierFacesAutomatically();
void splitAllFacesIntoStickers();
void solveWithKociembaFile(const std::string&);
void encodeResolution();
bool checkAndFixKociembaStructure(const std::string&);
 
class RubiksPipelineWindow : public QMainWindow {
    Q_OBJECT
public:
    RubiksPipelineWindow(QWidget *parent = nullptr) : QMainWindow(parent) {
        auto *centralWidget = new QWidget(this);
        auto *layout = new QVBoxLayout(centralWidget);

        auto *title = new QLabel("<h2>Pipeline Rubik's Cube</h2>", this);
        layout->addWidget(title);

        auto *btnRectify = new QPushButton("1. Rectifier les faces", this);
        auto *btnStickers = new QPushButton("2. Découper en stickers", this);
        auto *btnCheck = new QPushButton("3. Vérifier structure", this);
        auto *btnSolve = new QPushButton("4. Résoudre le cube", this);
        auto *btnEncode = new QPushButton("5. Encoder la solution", this);

        layout->addWidget(btnRectify);
        layout->addWidget(btnStickers);
        layout->addWidget(btnCheck);
        layout->addWidget(btnSolve);
        layout->addWidget(btnEncode);

        connect(btnRectify, &QPushButton::clicked, this, []() {
            rectifierFacesAutomatically();
            QMessageBox::information(nullptr, "Info", "Faces rectifiées.");
        });
        connect(btnStickers, &QPushButton::clicked, this, []() {
            splitAllFacesIntoStickers();
            QMessageBox::information(nullptr, "Info", "Stickers extraits.");
        });
        connect(btnCheck, &QPushButton::clicked, this, []() {
             auto cfg = loadYamlConfig("data/config/config.yaml");
            bool valid = checkAndFixKociembaStructure(cfg["kociemba_input"]);
            QMessageBox::information(nullptr, "Validation", valid ? "Structure valide." : "Structure invalide !");
       });
        connect(btnSolve, &QPushButton::clicked, this, []() {
            auto cfg = loadYamlConfig("data/config/config.yaml");
            solveWithKociembaFile(cfg["kociemba_input"]);
            QMessageBox::information(nullptr, "Info", "Résolution terminée.");
        });
        connect(btnEncode, &QPushButton::clicked, this, []() {
            encodeResolution();
            QMessageBox::information(nullptr, "Info", "Encodage terminé.");
        });

        setCentralWidget(centralWidget);
        setWindowTitle("Interface Rubik's Cube Qt5");
        resize(400, 300);
    }
};
*/
int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    QApplication::setStyle("Fusion");
    RubiksPipelineWindow window;
    window.show();
    return app.exec();
}
