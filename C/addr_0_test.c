#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stdint.h>

#define BRAM_ADDR 0x40000000
#define MAP_SIZE  4096

int main() {
    int fd;
    void *map_base;
    volatile uint32_t *bram_ptr;

    // Ouvrir /dev/mem
    fd = open("/dev/mem", O_RDWR | O_SYNC);
    if (fd < 0) {
        perror("open");
        return 1;
    }

    // Mapper la mémoire physique
    map_base = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, BRAM_ADDR);
    if (map_base == MAP_FAILED) {
        perror("mmap");
        close(fd);
        return 1;
    }

    bram_ptr = (volatile uint32_t *)map_base;

    // Écriture de 0x0000000F à l'adresse 0x40000000
    bram_ptr[0] = 0x0000000F;
    printf("Écrit : 0x%08X à l'adresse 0x%08X\n", bram_ptr[0], BRAM_ADDR);

    // Nettoyage
    munmap((void *)map_base, MAP_SIZE);
    close(fd);
    return 0;
}
