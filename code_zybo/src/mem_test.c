#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>

#define BRAM_ADDR 0x40000000
#define MAP_SIZE  4096
#define MAX_LINES 1024

int main() {
    int fd;
    void *map_base;
    volatile uint32_t *bram_ptr;
    FILE *fichier;
    char ligne[64];
    uint32_t data;
    int index = 1;
    uint8_t buffer[4];
    int buffer_index = 0;

    // Ouvrir le fichier
    fichier = fopen("data/output/output_encoded.txt", "r");
    if (!fichier) {
        perror("fopen");
        return 1;
    }

    // Ouvrir /dev/mem
    fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) {
        perror("open");
        fclose(fichier);
        return 1;
    }

    // Mapper la mémoire physique
    map_base = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, BRAM_ADDR);
    if (map_base == MAP_FAILED) {
        perror("mmap");
        close(fd);
        fclose(fichier);
        return 1;
    }

    bram_ptr = (volatile uint32_t *)map_base;

    while (fgets(ligne, sizeof(ligne), fichier)) {
        // Enlever le saut de ligne
        ligne[strcspn(ligne, "\r\n")] = 0;

        if (strlen(ligne) == 8) { // Si c'est un octet ASCII (ex: 01001100)
            // Le fichier se termine par 4 lignes ASCII pour "LAST"
            for (int i = 0; i < 8; ++i) {
                buffer[buffer_index] <<= 1;
                if (ligne[i] == '1') buffer[buffer_index] |= 1;
            }
            buffer_index++;
            if (buffer_index == 4) {
                // Fusionner les 4 octets en un seul mot 32 bits
                data = (buffer[0] << 24) | (buffer[1] << 16) | (buffer[2] << 8) | buffer[3];
                bram_ptr[index++] = data;
                printf("Ecrit LAST = 0x%08X a l'adresse +%d\n", data, (index - 1) * 4);
                break; // On a fini
            }
        } else if (strlen(ligne) == 4) {
            // Valeurs binaires sur 4 bits
            data = (uint32_t)strtol(ligne, NULL, 2);
            bram_ptr[index++] = data;
            printf("Ecrit 0x%X a l'adresse +%d\n", data, (index - 1) * 4);
        }
    }

    fclose(fichier);
    munmap((void *)map_base, MAP_SIZE);
    close(fd);

    return 0;
}
