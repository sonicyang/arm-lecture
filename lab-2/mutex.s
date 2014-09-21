	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
	mov r1, #1

.retry:
	ldrex r2, [r0]

.checklocked:
	cmp r2, r1 
	beq .checklocked
	
	strex r2, r1, [r0]

	cmp r2, #1
	beq .retry

	dmb
		
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
	mov r1, #0
        dmb
	str r1, [r0]

        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
