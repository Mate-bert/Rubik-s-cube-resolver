#include "xil_printf.h"

int main(void) {
    xil_printf("Hello, World! Ceci est un test de printf.\r\n");

    // Boucle infinie pour empêcher la fin immédiate du programme
    while(1);

    return 0;
}
