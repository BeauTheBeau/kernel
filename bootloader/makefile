# Makefile for the bootloader

bootloader: bootloader.asm bootloader.c
    nasm -f bin bootloader.asm -o bootloader.bin
    gcc -m32 bootloader.c -o bootloader

clean:
    rm -f bootloader.bin bootloader
