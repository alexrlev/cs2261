	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawHorizontalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHorizontalLine, %function
drawHorizontalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	rsb	r0, r0, r0, lsl #4
	str	lr, [sp, #-4]!
	ldr	lr, .L13
	lsl	ip, r0, #4
	add	r2, ip, r2
	ldr	r0, [lr]
	add	r2, r2, r1
	add	r1, r1, ip
	add	r2, r0, r2, lsl #1
	add	r1, r0, r1, lsl #1
.L7:
	strh	r3, [r1], #2	@ movhi
	cmp	r1, r2
	bne	.L7
	ldr	lr, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	.LANCHOR0
	.size	drawHorizontalLine, .-drawHorizontalLine
	.align	2
	.global	drawVerticalLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawVerticalLine, %function
drawVerticalLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	str	lr, [sp, #-4]!
	ldr	lr, .L23
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [lr]
	add	ip, r1, ip, lsl #4
	add	r1, r1, r0, lsl #4
	add	r1, r2, r1, lsl #1
	add	r0, r2, ip, lsl #1
.L17:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L17
	ldr	lr, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	drawVerticalLine, .-drawVerticalLine
	.align	2
	.global	drawDiagonalUpLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDiagonalUpLine, %function
drawDiagonalUpLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	bxle	lr
	rsb	r0, r0, r0, lsl #4
	ldr	ip, .L29
	add	r0, r1, r0, lsl #4
	rsb	r1, r2, r2, lsl #4
	lsl	r0, r0, #1
	rsb	r1, r2, r1, lsl #4
	ldr	r2, [ip]
	sub	r1, r0, r1, lsl #1
	add	r1, r2, r1
	add	r2, r2, r0
.L27:
	strh	r3, [r2]	@ movhi
	sub	r2, r2, #476
	sub	r2, r2, #2
	cmp	r2, r1
	bne	.L27
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	drawDiagonalUpLine, .-drawDiagonalUpLine
	.align	2
	.global	drawDiagonalDownLine
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDiagonalDownLine, %function
drawDiagonalDownLine:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	ldr	ip, .L39
	str	lr, [sp, #-4]!
	rsb	r0, r0, r0, lsl #4
	rsb	lr, r2, r2, lsl #4
	add	r0, r1, r0, lsl #4
	add	r2, r2, lr, lsl #4
	ldr	r1, [ip]
	add	r2, r0, r2
	add	r2, r1, r2, lsl #1
	add	r1, r1, r0, lsl #1
.L33:
	strh	r3, [r1]	@ movhi
	add	r1, r1, #480
	add	r1, r1, #2
	cmp	r1, r2
	bne	.L33
	ldr	lr, [sp], #4
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.size	drawDiagonalDownLine, .-drawDiagonalDownLine
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r2, #0
	add	r7, r1, r3
	ldrh	lr, [sp, #24]
	ble	.L42
	ldr	r4, .L62
	lsl	r8, r0, #4
	add	r5, r0, r2
	ldr	r4, [r4]
	sub	ip, r8, r0
	rsb	r6, r5, r5, lsl #4
	add	ip, r1, ip, lsl #4
	add	r6, r1, r6, lsl #4
	add	ip, r4, ip, lsl #1
	add	r6, r4, r6, lsl #1
.L43:
	strh	lr, [ip]	@ movhi
	add	ip, ip, #480
	cmp	ip, r6
	bne	.L43
.L44:
	mov	r6, #0
	sub	ip, r8, r0
	add	ip, r7, ip, lsl #4
	add	ip, r4, ip, lsl #1
.L48:
	add	r6, r6, #1
	cmp	r2, r6
	strh	lr, [ip]	@ movhi
	add	ip, ip, #480
	bge	.L48
	cmp	r3, #0
	ble	.L61
.L46:
	ldr	r2, .L62
	rsb	r0, r0, r0, lsl #4
	lsl	r0, r0, #4
	ldr	ip, [r2]
	add	r7, r7, r0
	add	r0, r1, r0
	add	r2, ip, r0, lsl #1
	add	r7, ip, r7, lsl #1
.L50:
	strh	lr, [r2], #2	@ movhi
	cmp	r7, r2
	bne	.L50
.L51:
	mov	r2, #0
	rsb	r5, r5, r5, lsl #4
	add	r1, r1, r5, lsl #4
	add	r1, ip, r1, lsl #1
.L53:
	add	r2, r2, #1
	cmp	r3, r2
	strh	lr, [r1], #2	@ movhi
	bge	.L53
.L41:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L42:
	beq	.L45
	cmp	r3, #0
	add	r5, r0, r2
	bgt	.L46
.L61:
	bne	.L41
	ldr	r2, .L62
	ldr	ip, [r2]
	b	.L51
.L45:
	ldr	ip, .L62
	mov	r5, r0
	ldr	r4, [ip]
	lsl	r8, r0, #4
	b	.L44
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	drawBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBox, %function
drawBox:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	push	{r4, lr}
	mov	lr, #0
	ldr	r4, .L73
	add	r2, r0, r2
	rsb	ip, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	r2, [r4]
	add	ip, r1, ip, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r0, [r4, #4]
	orr	r3, r3, #-2130706432
	add	ip, r2, ip, lsl #1
	add	r1, r2, r1, lsl #1
.L66:
	add	r2, sp, #8
	str	lr, [r0, #44]
	str	r2, [r0, #36]
	str	r1, [r0, #40]
	add	r1, r1, #480
	cmp	r1, ip
	str	r3, [r0, #44]
	bne	.L66
	pop	{r4, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	.LANCHOR0
	.size	drawBox, .-drawBox
	.align	2
	.global	fillScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen, %function
fillScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L77
	sub	sp, sp, #12
	ldm	r2, {r2, r3}
	ldr	r1, .L77+4
	add	ip, sp, #6
	strh	r0, [sp, #6]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L78:
	.align	2
.L77:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen, .-fillScreen
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L80:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L80
	mov	r2, #67108864
.L81:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L81
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [sp, #4]
	ldr	ip, [sp, #12]
	add	ip, lr, ip
	cmp	ip, r0
	blt	.L89
	add	r0, r0, r2
	cmp	r0, lr
	bge	.L91
.L89:
	mov	r0, #0
	ldr	lr, [sp], #4
	bx	lr
.L91:
	ldr	r2, [sp, #8]
	ldr	r0, [sp, #16]
	add	r2, r2, r0
	cmp	r2, r1
	blt	.L89
	add	r0, r1, r3
	ldr	r3, [sp, #8]
	cmp	r0, r3
	movlt	r0, #0
	movge	r0, #1
	ldr	lr, [sp], #4
	bx	lr
	.size	collision, .-collision
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L94
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	lsl	r0, r0, #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 50) 8.2.0"