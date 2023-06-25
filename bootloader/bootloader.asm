BITS 16

start:
    ; Set up the segment registers
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; Set up the stack
    mov ss, ax
    mov sp, 0xFFFF

    ; Load the kernel
    mov bx, KERNEL_LOAD_ADDRESS  ; Address where the kernel will be loaded
    mov ah, 0x02                 ; Function number for reading sectors from disk
    mov al, NUMBER_OF_SECTORS    ; Number of sectors to read
    mov ch, 0x00                 ; Cylinder number
    mov cl, 0x02                 ; Sector number
    mov dh, 0x00                 ; Head number
    mov dl, 0x80                 ; Boot drive number (assumed to be the first hard drive)
    int 0x13                     ; BIOS interrupt for disk I/O

    ; Jump to the loaded kernel
    jmp KERNEL_LOAD_ADDRESS:0

TIMES 510 - ($ - $$) db 0  ; Fill the remaining bytes in the boot sector with zeros
dw 0xAA55                 ; Boot signature

KERNEL_LOAD_ADDRESS equ 0x1000       ; Address where the kernel will be loaded
NUMBER_OF_SECTORS equ 8              ; Number of sectors to read from disk
