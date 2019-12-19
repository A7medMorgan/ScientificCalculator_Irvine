
INCLUDE Irvine32.inc
.DATA
codeTitle		 BYTE "  ---------  Scientific Calculator  ---------  ", 0
oneOperation     BYTE "1)   Calculate f(x) for equation until third degree.",0
twoOperation     BYTE "2)   Calculate Combinations C (n,r).",0
threeOperation   BYTE "3)   Calculate percentage of x/y (%).",0
fourOperation    BYTE "4)   Calculate log base 10  [log10 (X)].",0
fiveOperation    BYTE "5)   Get the roots of a quadratic equation.",0
sixOperation     BYTE "6)   Solving system of linear equations (with 2 unknowns).",0
sevenOperation   BYTE "7)   Calculate sin(x) and cos(x).",0
directions		 BYTE "Enter 2 numbers.", 0
prompt1			 BYTE "First number: ", 0
prompt2			 BYTE "Second number: ", 0
choice_sentence    BYTE "Enter your choice :- ",0
divide			 BYTE " / ", 0
equals			 BYTE " = ", 0
num1			real4 ?
num2			real4 ?
total           dword ?
choice_number	dword ?

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
    ; Output the Choice_sentence
	mov edx,offset choice_sentence
	call writestring
	call readdec
	mov choice_number,eax

	cmp choice_number,3
	je l1
	jmp next

	l1:
	call Perc
	next:
	call crlf
	
	exit
main ENDP

 perc proc

finit
	; Prompt for the first number
		mov		edx, OFFSET prompt1
		call	WriteString
		call	Readint
		mov		num1, eax

	; Prompt for the second number
		mov		edx, OFFSET prompt2
		call	WriteString
		call	Readdec
		mov		num2, eax
	    
	; Perform the calculation 
		fild		 num1
		fild		 num2
		Fdiv          		

	    ; Print the total to the console
		; Print num1
		mov		eax, num1
		call	WriteDec
		
		; Print the divide sign
		mov		edx, OFFSET divide
		call	WriteString
		
		; Print num2
		mov		eax,  num2
		call	WriteDec
		
		; Print the equals sign
		mov		edx, OFFSET equals
		call	WriteString

		; Print out the total
		call	writefloat
		mov total,edx
	    call crlf
		
		perc endp

END main