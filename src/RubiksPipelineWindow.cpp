#include "RubiksPipelineWindow.hpp"
#include <QLabel>
#include <QPushButton>
#include <QVBoxLayout>
#include <QMessageBox>
#include <QApplication>
#include "config.hpp"

// Déclaration des fonctions externes
void rectifierFacesAutomatically();
void splitAllFacesIntoStickers();
bool checkAndFixKociembaStructure(const std::string&);
void solveWithKociembaFile(const std::string&);
void encodeResolution();

// 🎨 Fonction utilitaire pour appliquer une couleur à un bouton
void setButtonColor(QPushButton* button, const QString& colorHex) {
    button->setStyleSheet(
        "QPushButton {"
        "background-color: " + colorHex + ";"
        "color: white;"
        "border: none;"
        "border-radius: 6px;"
        "min-height: 40px;"
        "font-size: 15px;"
        "}"
        "QPushButton:hover {"
        "background-color: #444;"
        "}"
    );
}

RubiksPipelineWindow::RubiksPipelineWindow(QWidget *parent) : QMainWindow(parent) {
    auto *centralWidget = new QWidget(this);
    auto *mainLayout = new QVBoxLayout(centralWidget);

    // Titre discret
    auto *title = new QLabel("Interface Rubik's Cube");
    title->setAlignment(Qt::AlignCenter);
    title->setStyleSheet("font-size: 14px; color: #666; margin-bottom: 10px;");
    mainLayout->addWidget(title);

    // Image preview
    auto *preview = new QLabel();
    preview->setFixedSize(200, 200);
    preview->setAlignment(Qt::AlignCenter);
    preview->setStyleSheet("border: 1px solid gray; background-color: #f9f9f9;");
    preview->setPixmap(QPixmap("C:/Users/rayan/Documents/Rubik-s-cube-resolver/data/images/cube.png.jpg").scaled(200, 200, Qt::KeepAspectRatio));
    mainLayout->addWidget(preview, 0, Qt::AlignCenter);

    // Boutons
    auto *btn1 = new QPushButton("Rectifier les faces");
    auto *btn2 = new QPushButton("Découper les stickers");
    auto *btn3 = new QPushButton("Vérifier la structure");
    auto *btn4 = new QPushButton("Résoudre le cube");
    auto *btn5 = new QPushButton("Encoder la solution");

    setButtonColor(btn1, "#1abc9c");
    setButtonColor(btn2, "#3498db");
    setButtonColor(btn3, "#9b59b6");
    setButtonColor(btn4, "#e67e22");
    setButtonColor(btn5, "#e74c3c");

    auto *row1 = new QHBoxLayout();
    row1->addWidget(btn1);
    row1->addWidget(btn2);

    auto *row2 = new QHBoxLayout();
    row2->addWidget(btn3);
    row2->addWidget(btn4);

    auto *row3 = new QHBoxLayout();
    row3->addWidget(btn5);

    mainLayout->addLayout(row1);
    mainLayout->addLayout(row2);
    mainLayout->addLayout(row3);

    setCentralWidget(centralWidget);
    resize(600, 400);
    setWindowTitle("Interface Rubik's Cube");

    connect(btn1, &QPushButton::clicked, this, [] {
        rectifierFacesAutomatically();
        QMessageBox::information(nullptr, "OK", "Rectification faite.");
    });

    connect(btn2, &QPushButton::clicked, this, [] {
        splitAllFacesIntoStickers();
        QMessageBox::information(nullptr, "OK", "Stickers extraits.");
    });

    connect(btn3, &QPushButton::clicked, this, [] {
        auto cfg = loadYamlConfig("data/config/config.yaml");
        bool valid = checkAndFixKociembaStructure(cfg["kociemba_test"]);
        QMessageBox::information(nullptr, "Validation", valid ? "Structure valide." : "Structure invalide !");
    });

    connect(btn4, &QPushButton::clicked, this, [] {
        auto cfg = loadYamlConfig("data/config/config.yaml");
        solveWithKociembaFile(cfg["kociemba_test"]);
        QMessageBox::information(nullptr, "Résolution", "Cube résolu.");
    });

    connect(btn5, &QPushButton::clicked, this, [] {
        encodeResolution();
        QMessageBox::information(nullptr, "Encodage", "Solution encodée.");
    });
}
