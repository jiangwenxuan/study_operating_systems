print_hex:
	
	pusha
	mov cx, 0

hex_loop:
	
	cmp cx, 4
	je hex_loop_end
	mov ax, dx
	and ax, 0x000f
	add ax, '0'
	cmp ax, '0' + 9
	jle step2
	add ax, 'a' - '0' - 0xa

step2:
	
	mov bx, HEXOUT + 5
	sub bx, cx
	mov [bx], al
	ror dx, 4

	add cx, 1
	jmp hex_loop

hex_loop_end:
	
	mov bx, HEXOUT
	call print_string
	popa
	ret

%include "print_string.asm"

HEXOUT:
db '0x0000', 0