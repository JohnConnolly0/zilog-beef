; This method uses the stack to transfer data from one location to another
; It is extremely fast but interrupts MUST be disabled as complete stack
; control is neccessary. The size of the data transfer in bytes MUST be a multiple
; of 12. We don't use AF because of the risk flags (and data) will be overwritten

DI
LD (OLDPOINT),SP    ; This stores the current stack pointer at the location defined by OLDPOINT.
LD SP,DATASTART     ; Puts the stack at the start of the data.
POP BC
POP DE
POP HL
EXX
POP BC
POP DE
POP HL
LD SP,DATAEND2      ; Puts the stack at the top of the next location
PUSH HL
PUSH DE
PUSH BC
EXX
PUSH HL
PUSH DE
PUSH BC
LD SP,(OLDPOINT)
EI

; This could be used with a loop counter in the accumulator which also adds 12 to the address on both LD instructions
