LD A,R			; Load the A register with the refresh register
LD L,A			; Copy register A into register L
AND %00111111		; This masking prevents the address we are forming from accessing RAM
LD H,A			; Copy register A into register H
LD A,(HL)		; Load the pseudo-random value into A

; HOW THIS WORKS

; The refresh register in the Z80 is highly unpredictable since it is incremented every cycle.
; Because it may be at any value when this routine is called, it is very good for random numbers.
; This routine increases the randomness of the number by forming an address based on the
; refresh counter's current status and accessing the memory at that address.

; This can also be modified to get a sixteen-bit pseudo-random number by changing line 5 to LD D,(HL)
; and adding these two lines to the end:
; INC L
; LD E,(HL)

; This routine was written for the ZX Spectrum which has a 16KB ROM. If you plan to use this routine
; on another Z80 system, change the binary value at the AND instruction. For example, if you had a
; Z80 computer with an 8KB ROM, you would change the binary value to %00011111.
