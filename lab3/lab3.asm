#Shane Tachick
#EE 443
#Lab 3
#February 10, 2015

.data
space: .asciiz 		" "
prompt: .asciiz		"Please enter the radius in mm, or 0 to exit\n"
pi: .asciiz 		"Enter the value of Pi\n"
answer1: .asciiz	"The area of the circle is "
answer2: .asciiz	" square inches.\n"
finished: .asciiz	"Exiting\n"
keyctrl: .word		0xFFFF0000
keydata: .word		0xFFFF0004
newline: .word		0x0000000a
conv: .double		.03937

#	$t0 = pointer to key ctrl
#	$t1 = pointer to keyboard data
#	$t2 = value at key ctrl
#	$t3 = value at keyboard data
#	$t4 = int total for mm
#	$t5 = value of newline character
#	$t6 = 10
#	$f22 = users input for pi
#	$f6 = radius in floating point
#	$f2 = area
#	$f4 = conversion factor from mm to inches

.text
	lw	$t0, keyctrl		#Pointer to keyctrl
	lw	$t1, keydata		#Pointer to keyboard data
	lw	$t5, newline		#Pointer to newline character
	addi	$t6, $zero, 10
	l.d	$f4, conv

input:	li	$v0, 4			#Syscall for print string
	la 	$a0, prompt		#Location of string to be printed
	syscall				
	jal	getint
	
	
	
getint:	lw	$t2, 0($t0)		#Puts the value at keyctrl into $t2
	beqz	$t2, getint		#Loops if they are equal to 0 (no key input)
	#### OTHERWISE KEY IS PRESSED AND FALL THROUGH TO THIS PART ####
	lb	$t3, 0($t1)		#Puts the value at keydata into $t3
	beq	$t3, $t5, getpi		#Branches away if a newline was sent
	addi	$t3, $t3, -48		#If its an integer, cleanse it
	add	$t4, $t4, $t3		#Then add it to the total
	mult	$t4, $t6		#Multiply total by 10
	mflo	$t4			#move results into int total
	j	getint			#gather more input
	
	
getpi:	beqz	$t4, quit		#If the user entered 0 radius, quit
	li	$v0, 4			#Syscall for print string
	la	$a0, pi			#Location of string to be printed
	syscall
	li	$v0, 7			#Syscall for read double
	syscall
	mov.d	$f22, $f0		#puts users value for pi into $f22

calc:	div	$t4, $t4, $t6		#Divide 10 from the int total to give us our correct value
	mul	$t4, $t4, $t4		#r*r
	mtc1	$t4, $f6		#convert radius into floating point register
	cvt.d.w $f6, $f6		#converts to double
	mul.d	$f6, $f6, $f4		#converts from mm to inches
	mul.d	$f6, $f6, $f4		#converts from mm to inches
	mul.d	$f2, $f6, $f22		#area!!!
	
print:	la	$a0, answer1		#load address of string to print
	li	$v0, 4			#syscall for print string
	syscall
	mov.d	$f12, $f2		#load douple for printing
	li	$v0, 3			#syscall for print double
	syscall
	la	$a0, answer2		#load address of string to print
	li	$v0, 4			#syscall for print string
	syscall
	j input
	
	
quit:	la 	$a0, finished		#load address of string to print
	li	$v0, 4			#syscall for print string
	syscall
	li	$v0, 10			#Syscall to quit
	syscall
	
