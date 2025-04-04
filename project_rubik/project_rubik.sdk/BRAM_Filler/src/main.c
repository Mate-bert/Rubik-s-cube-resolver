#include "xil_io.h"
#include "xil_printf.h"

#define BRAM_BASE    0x40000000   // Valeur r�cup�r� depuis l'address editor
#define NUM_VALUES   15

int main(void) {
    int i;
    xil_printf("Remplissage de la BRAM avec des valeurs de 1 � %d...\r\n", NUM_VALUES);

    // �criture dans la BRAM
    for (i = 0; i < NUM_VALUES; i++) {
        Xil_Out32(BRAM_BASE + (i * 4), i + 1); // La BRAM est configur� sur des width de 8 bits
    }

    // V�rification
    xil_printf("Lecture de la BRAM...\r\n");
    for (i = 0; i < NUM_VALUES; i++) {
        int value = Xil_In32(BRAM_BASE + (i * 4));
        xil_printf("Adresse 0x%08X = %d\r\n", (BRAM_BASE + (i * 4)), value);
    }

    return 0;
}
