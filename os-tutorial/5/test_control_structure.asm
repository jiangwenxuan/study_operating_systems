[org 0x7c00]

	mov bx, HELLO_MSG
	call print
;	call print_nl

	mov bx, GOODBYE_MSG
	call print
;	call print_nl

%include "boot_sect_print.asm"

HELLO_MSG:
	db 'hello, world!', 0

GOODBYE_MSG:
	db 'goodbye!', 0

	times 510-($-$$) db 0
	dw 0xaa55