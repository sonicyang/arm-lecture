	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ R4 = 0, R5 = 1
	mov r4, #0
	mov r5, #1
	sub r0, r0, #2

.calloop:
	add r5, r4, r5
	sub r4, r5, r4

	subs r0, r0, #1
	bpl .calloop
	
	mov r0, r5

	pop {r3, r4, r5, pc}		@EPILOG

	.size fibonacci, .-fibonacci
	.end
