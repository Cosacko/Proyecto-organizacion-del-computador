 	.equ SCREEN_WIDTH,   640
	.equ SCREEN_HEIGH,   480

.global circle
circle:

	mov x0, x20

    movz x10, 0xff, lsl 16
	movk x10, 0x00, lsl 00 

    
    
    mov x15,SCREEN_HEIGH
    
    loop1:
    mov x9, 200
    mov x8, 200
    mov x14,SCREEN_WIDTH
    
    loop0:
    mov x11,4225//radio al cudrado
    sub x16,x15,x8//y-y0
    mul x18,x16,x16//(y-y0)^2
    sub x17,x14,x9//x-x0
    mul x19,x17,x17//(x-x0)^2
    add x20,x18,x19//(y-y0)^2+(x-x0)^2
    sub x14,x14,1//SCREEN_WIDTH-1
    add x0,x0,4//siguiente pixel
    cmp x11,x20//comparar (y-y0)^2+(x-x0)^2 y radio al cuadrado        
    b.hs loop0
  //add x0,x0,4//siguiente pixel    
    stur w10,[x0]
    cbnz x14,loop0
    sub x15,x15,1
    cbnz x15,loop1
    
    ret
