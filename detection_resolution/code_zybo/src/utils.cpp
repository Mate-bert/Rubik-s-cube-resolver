#include "utils.hpp"
#include <sys/stat.h>

namespace utils {
    bool createDirectory(const std::string& path) {
        struct stat info;
        if (stat(path.c_str(), &info) != 0) {
            // Le répertoire n'existe pas, on le crée
            return mkdir(path.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == 0;
        }
        return (info.st_mode & S_IFDIR) != 0;
    }
} 