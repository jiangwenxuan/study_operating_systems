[org 0x7c00]
	mov bp, 0x9000
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print

	call switch_to_pm
	jmp $

%include "../5/boot_sect_print.asm"
%include "../9/my_try_of_gdt.asm"
%include "../8/32bit-print.asm"
%include "32bit-switch.asm"

[bits 32] ; tell our assembler: 
		  ; it should encode in 32-bit mode instructions 
		  ; from that point onwards

BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm
	jmp $

MSG_REAL_MODE: db "started in 16-bit real mode", 0
MSG_PROT_MODE: db "loaded 32-bit protected mode", 0

times 510-($-$$) db 0
dw 0xaa55

