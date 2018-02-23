TITLE InputArray Procedure                 (InputArray.asm)

INCLUDE Irvine32.inc

.data
prompt BYTE "Input Signed Integers : ", 13, 10, 0

.code
;------------------------------------------------------------
InputArray PROC USES eax edi ecx edx,
	pArray:PTR DWORD,		  ; pointer to array
	Count:DWORD,		       ; number of elements
;
; Fills an array with a random sequence of 32-bit signed
; integers between LowerRange and (UpperRange - 1).
; Returns: nothing
;-----------------------------------------------------------
	mov	edx,OFFSET prompt
	call	WriteString			 ; Write input prompt
	mov	edi,pArray	           ; EDI points to the array
	mov	ecx,Count	                ; loop counter
	cld                            ; clear direction flag

L1:	call ReadInt
	stosd		                ; store EAX into [edi]
	loop	L1

	ret
InputArray ENDP

END