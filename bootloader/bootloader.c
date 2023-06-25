#include <stdio.h>

int main() {
    printf("Bootloader executed successfully!\n");

    // Add your bootloader logic here

    // Load and jump to the kernel
    __asm__ __volatile__(
            "mov $0x1000, %%ebx \n"  // Address where the kernel will be loaded
            "jmp *%%ebx \n"          // Jump to the loaded kernel
            :
            :
            : "%ebx"
            );

    // This code should not be reached
    while (1)
        ;
}
