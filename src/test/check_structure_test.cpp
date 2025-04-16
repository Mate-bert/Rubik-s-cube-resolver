#include <gtest/gtest.h>
#include "check_structure.hpp"
#include <fstream>
#include <vector>
#include <string>

// Test de la fonction `readKociembaLines`
TEST(CheckStructureTest, ReadKociembaLines) {
    std::string testFilePath = "../../data/output/kociemba.txt";
    std::vector<std::string> expectedLines = {
        "\"U:UUUUUUUUU\"",
        "\"R:RRRRRRRRR\"",
        "\"F:FFFFFFFFF\"",
        "\"D:DDDDDDDDD\"",
        "\"L:LLLLLLLLL\"",
        "\"B:BBBBBBBBB\""
    };

    auto lines = readKociembaLines(testFilePath);

    EXPECT_EQ(lines.size(), expectedLines.size());
    for (size_t i = 0; i < lines.size(); ++i) {
        EXPECT_EQ(lines[i], expectedLines[i]);
    }
}

// Test de la fonction `validateLines`
TEST(CheckStructureTest, ValidateLines) {
    std::vector<std::string> validLines = {
        "\"U:UUUUUUUUU\"",
        "\"R:RRRRRRRRR\"",
        "\"F:FFFFFFFFF\"",
        "\"D:DDDDDDDDD\"",
        "\"L:LLLLLLLLL\"",
        "\"B:BBBBBBBBB\""
    };

    std::vector<std::string> invalidLines = {
        "\"U:UUUUUUUUU\"",
        "\"R:RRRRRRRRR\"",
        "\"F:FFFFFFFFF\""
    };

    EXPECT_TRUE(validateLines(validLines)); 
    EXPECT_FALSE(validateLines(invalidLines)); 
}

// Test de la fonction `findMissingColors`
TEST(CheckStructureTest, FindMissingColors) {
    std::vector<std::string> lines = {
        "\"U:UUUUUUUUU\"",
        "\"R:RRRRRRRRR\"",
        "\"F:FFFFFFFFF\"",
        "\"D:DDDDDDDDD\"",
        "\"L:LL??LLLLL\"",
        "\"B:BBBB????B\""
    };

    auto missingColors = findMissingColors(lines);
    EXPECT_EQ(missingColors.size(), 2);
    EXPECT_EQ(missingColors[0], 'L');
    EXPECT_EQ(missingColors[1], 'B');
}

// Test de la fonction `verifyQuestionMarks`
TEST(CheckStructureTest, VerifyQuestionMarks) {
    std::vector<std::string> lines = {
        "\"U:UUUUUUUUU\"",
        "\"R:RRRRRRRRR\"",
        "\"F:FFFFFFFFF\"",
        "\"D:DDDDDDDDD\"",
        "\"L:LL??LLLLL\"",
        "\"B:BBBB????B\""
    };

    EXPECT_TRUE(verifyQuestionMarks(lines, 4)); 
    EXPECT_FALSE(verifyQuestionMarks(lines, 5)); 
}

// Test de la fonction `replaceMissingColors`
TEST(CheckStructureTest, ReplaceMissingColors) {
    std::vector<std::string> lines = {
        "\"U:UUUUUUUUU\"",
        "\"R:RRRRRRRRR\"",
        "\"F:FFFFFFFFF\"",
        "\"D:DDDDDDDDD\"",
        "\"L:LL??LLLLL\"",
        "\"B:BBBB????B\""
    };
    
    std::vector<char> missingColors = {'L', 'B'};
    
    EXPECT_TRUE(replaceMissingColors(lines, missingColors)); 
    EXPECT_EQ(lines[4][2], 'L'); 
    EXPECT_EQ(lines[5][6], 'B'); 
}

// Test de la fonction `saveLines`
TEST(CheckStructureTest, SaveLines) {
    std::vector<std::string> lines = {
        "\"U:UUUUUUUUU\"",
        "\"R:RRRRRRRRR\"",
        "\"F:FFFFFFFFF\"",
        "\"D:DDDDDDDDD\"",
        "\"L:LLLLLLLLL\"",
        "\"B:BBBBBBBBB\""
    };

    std::string testSavePath = "test_save_kociemba.txt"; 
    saveLines(testSavePath, lines);
    
    std::ifstream file(testSavePath);
    std::string line;
    size_t lineCount = 0;
    while (std::getline(file, line)) {
        ++lineCount;
        EXPECT_EQ(line, lines[lineCount - 1]);
    }
    EXPECT_EQ(lineCount, lines.size());
}