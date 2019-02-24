print_string:
	pusha
	mov ah, 0x0e

loop_begin:
	mov al, [bx]
	cmp al, 0
	je loop_end
	int 0x10
	add bx, 1
	jmp loop_begin

loop_end:
	popa
	ret

print_nl:
	pusha

	mov ah, 0x0e
	mov al, 0x0a
	int 0x10
	mov al, 0x0d
	int 0x10

	popa
	ret