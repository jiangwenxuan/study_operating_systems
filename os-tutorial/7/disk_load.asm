disk_load:

	push dx ; dh stores the number of sectors we want to read

	mov ah, 0x02

	mov al, ah
	mov ch, 0x00
	mov dh, 0x00
	mov cl, 0x02

	int 0x13
	jc disk_error_flag
	pop dx ; restore and dh now is the number of we want to read
	cmp dh, al
	jne disk_error_count
	ret

disk_error_flag:
	mov bx, DISK_ERROR_FLAG_MSG
	call print_string
	jmp $

disk_error_count:
	mov bx, DISK_ERROR_COUNT_MSG
	call print_string
	jmp $

DISK_ERROR_FLAG_MSG: 
	db "disk read flag error", 0x0a, 0x0d, 0
DISK_ERROR_COUNT_MSG: 
	db "disk read error. read sector num error!", 0x0a, 0x0d, 0