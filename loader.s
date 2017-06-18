global loader                   ; the entry symbol for ELF

MAGIC_NUMBER equ 0x1BADB002     ; define the magic number constant
FLAGS        equ 0x0            ; multiboot flags
CHECKSUM     equ -MAGIC_NUMBER  ; calculate the checksum
KERNEL_STACK_SIZE equ 4096

                                    ; (magic number + checksum + flags should equal 0)

section .text:                  ; start of the text (code) section
align 4                         ; the code must be 4 byte aligned
	dd MAGIC_NUMBER             ; write the magic number to the machine code,
	dd FLAGS                    ; the flags,
	dd CHECKSUM                 ; and the checksum
	dd KERNEL_STACK_SIZE
	
section .bss:
align 4
kernel_stack:
	resb KERNEL_STACK_SIZE


loader:                         ; the loader label (defined as entry point in linker script)
	mov esp, kernel_stack + KERNEL_STACK_SIZE
	mov eax, 0xCAFEBABE
	extern sn_text
;	push dword 3
;	push dword 2
;	push dword 1
	call sn_text
	mov eax, [0x000B8000]

.loop:
	jmp .loop

