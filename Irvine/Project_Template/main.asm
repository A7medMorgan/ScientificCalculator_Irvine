
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
num real4 ?
onehundred      dword 100
msg1  byte "Log(",0
msg2  byte ")",0
equals1 byte "=",0
choice_sentence    BYTE "Enter your choice :- ",0
divide			 BYTE " / ", 0
equals			 BYTE " = ", 0
num1			real4 ?
num2			real4 ?
total           dword ?
choice_number	dword ?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ZEAD;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
prompt_1			BYTE	"First Number: ", 0
prompt_2			BYTE	"Second Number: ", 0
firstNumber			DWORD	?							 ; integer entered by user
secondNumber		DWORD	?							 ; second integer entered by user.
goodBye				BYTE	"Goodbye",0

remainder			DWORD	?
remainderString		BYTE	" remainder ",0

; Extra Credit

EC1warn				BYTE	"The second number must be less than the first!", 0
 
EC2string			BYTE	"EC: Floating-point value: ", 0
EC2FloatingPoint	REAL4	?	; short real single precision floating point variable
oneThousand			DWORD	1000						; to convert an int to a floating point number rounded to .001 (can be changed to increase or decrease precision)
bigInt			    DWORD	0							; represents the floating point number multiplied by 1000
ECremainder			DWORD	?							; for floating point creation
dot					BYTE	".",0						; to serve as the decimal place of a floating point number
firstPart			DWORD	?							; for the first part of the floating point representation of the quotient
secondPart			DWORD	?							; fot the part of the floating point number after the decimal place
temp				DWORD	?							; temporary holder for floating point creation
EC3prompt			BYTE	"EC: Would you like to play again? Enter 1 for YES or 0 for NO: ", 0
EC3explain			BYTE	"**EC: This program loops until the user decides to quit.", 0
EC3response			DWORD	?							; BOOL for user to loop or exit.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	je l3
	cmp choice_number,7
	je l7
	cmp choice_number,4
	je l4
	jmp next

	l3:
	call clrscr
	call Perc

	l4:
	call clrscr
	call log
	
	l7:
	call clrscr
	call dvde

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
		Fidiv         num2
		fimul   	 onehundred

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
		
log proc
finit
call readint
mov num,eax
 ; log(base 10)
  fldl2t               ; st: log2(10)
  fld num              ; st: log2(10) num
  fyl2x                ; st: log10(num)
 
 ;print in the Console Application
 mov edx,offset msg1
 call writestring
 
 mov edx,num
 call writedec
 
 mov edx,offset msg2
 call writestring
 
 mov edx,offset equals1
 call writestring

 call writefloat

call crlf

log endp
		

dvde PROC

	
	
		call	CrLf
		mov		edx, OFFSET EC3explain
		call	WriteString
		call	CrLf

	

			; get firstNumber
top:
			mov		edx, OFFSET prompt_1
			call	WriteString
			call	ReadInt
			mov		firstNumber, eax


			; get secondNumber
			mov		edx, OFFSET prompt_2
			call	WriteString
			call	ReadInt
			mov		secondNumber, eax

			; **EC: Jump if second number greater than first
			mov		eax, secondNumber
			cmp		eax, firstNumber
			jg		Warning
			jle		Calculate

Warning:
			mov		edx, OFFSET EC1warn
			call	WriteString
			call	CrLf
			jg		JumpToLoop				; jump if secondNumber > firstNumber


Calculate:		; Calculate Required Values
			

			

				; EC floating point representation of quotient and remainder
				fld		firstNumber					; load firstNumber (integer) into ST(0)
				fdiv	secondNumber				; divide firstNumber by secondNumber ?
				fimul	oneThousand
				frndint	
				fist	bigInt
				fst		EC2FloatingPoint			; take value off stack, put it in EC2FloatingPoint

			; Display Results

			

				; EC2 Output
				mov		edx, OFFSET EC2string
				call	WriteString
				mov		edx, 0
				mov		eax, bigInt
				cdq
				mov		ebx, 1000
				cdq
				div		ebx
				mov		firstPart, eax
				mov		ECremainder, edx
				mov		eax, firstPart
				call	WriteDec
				mov		edx, OFFSET dot
				call	WriteString

				;calculate remainder
				mov		eax, firstPart
				mul		oneThousand
				mov		temp, eax
				mov		eax, bigInt
				sub		eax, temp
				mov		secondPart, eax
				call	WriteDec
				call	CrLf

		; Loop until user quits
		; prompts the user to enter a 0 or 1 to continue looping.
		; if they do want to play again, it takes them to section 'top'
		; skipping the instrucitons

				; get response for loop

JumpToLoop:			mov		edx, OFFSET EC3prompt
					call	WriteString
					call	ReadInt
					mov		EC3response, eax
					cmp		eax, 1
					je		top				; jump to top if response == 1


				; Say Goodbye
					mov		edx, OFFSET goodBye
					call	WriteString
					call	CrLf

	ret	
	; exit to operating system
dvde ENDP


END main