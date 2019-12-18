
INCLUDE Irvine32.inc
.DATA
codeTitle		 BYTE "  ---------  Scientific Calculator  ---------  ", 0
oneOperation     BYTE "1)   Calculate f(x) for equation until third degree.",0
twoOperation     BYTE "2)   Calculate Combinations C (n,r).",0
threeOperation   BYTE "3)   Calculate percentage of x/y (%).",0
fourOperation    BYTE "4)   Calculate log base 10  [log10 (X)].",0
fiveOperation    BYTE "5)   Get the roots of a quadratic equation.",0
sixOperation     BYTE "6)   Solving system of linear equations (with 2 unknowns).",0
sevenOperation   BYTE "6)   Calculate sin(x) and cos(x).",0
directions		 BYTE "Enter 2 numbers.", 0
prompt1			 BYTE "First number: ", 0
prompt2			 BYTE "Second number: ", 0
choice_number    BYTE "Enter your choice :- ",0
divide			 BYTE " / ", 0
equals			 BYTE " = ", 0
num1			real4 ?
num2			real4 ?
total           dword ?
 ; x		real4 100.0

.code
main PROC
	; Output the title
		mov		edx, OFFSET codeTitle
		call	WriteString
		call	CrLf
		call    crlf

	; Output the firstOperation
		mov		edx, OFFSET oneOperation	
	    call	WriteString
		call	CrLf
	; Output the secondOperation
		mov		edx, OFFSET twoOperation
		call	WriteString
		call	CrLf
	; Output the thirdOperation
		mov		edx, OFFSET threeOperation
		call	WriteString
		call	CrLf
	; Output the fourthOperation
		mov		edx, OFFSET fourOperation
		call	WriteString
		call	CrLf
	; Output the fifthOperation
		mov		edx, OFFSET fiveOperation
		call	WriteString
		call	CrLf
	; Output the sixthOperation
		mov		edx, OFFSET sixOperation
		call	WriteString
		call	CrLf
		
	; Output the seventhOperation
		mov		edx, OFFSET sevenOperation
		call	WriteString
		call	CrLf
	    call crlf
	exit
main ENDP

END main