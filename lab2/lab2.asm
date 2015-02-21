#Shane Tachick
#EE 443
#Lab 2
#February 3, 2015

.data
arr: .word	0:20
solu: .asciiz "\nThe array is now:\n"
space: .asciiz	" "
prompt: .asciiz	"How many entries are in the array (Between 0 and 20)\n"
entry: .asciiz	"Enter the next entry for the array\n"
avg: .asciiz	"The average is:\n"

	.text
	jal 	load
	la	$a0, solu	#Load the print service for the array header
	li	$v0, 4		#Specify the print string service
	syscall
	la	$t0, arr	#Load address of array
	addi	$t6, $t5, 0	#Setting up a counter for the loop
print:	lw	$a0, 0($t0)	#Loading the array element to print
	li	$v0, 1		#Specify print int service
	syscall
	la 	$a0, space	#Load the print service for a space character
	li	$v0, 4		#Specify print string service
	syscall
	addi	$t0, $t0, 4	#Increment array index
	addi	$t6, $t6, -1	#Decrement counter
	bgtz	$t6, print	#Repeate if counter > 0
	li 	$v0, 10
	syscall
	
		
	.text
load:	li	$v0, 4		#Syscall for print string
	la	$a0, prompt	#Location of string to be printed
	syscall
	li 	$v0, 5		#Syscall to get int from user for array size
	syscall
	add 	$t5, $v0, 0	#Location to store the array size
	la 	$t0, arr	#Load address of array
	addi	$t6, $t5, 0	#Setting up a counter for the loop
loop1:	li 	$v0, 4		#Syscall for print string
	la	$a0, entry	#location of string to be printed
	syscall
	li	$v0, 5		#Syscall to get int from user
	syscall
	add	$t7, $v0, 0	#Location to store the int from user
	sw	$t7, 0($t0)	#Store user int in array
	addi 	$t0, $t0, 4	#Increment address of array
	addi	$t6, $t6, -1	#Decrement loop counter
	bgtz	$t6, loop1	#Repeat if counter > 0
	sub	$sp, $sp, 4	#adjust the stack pointer
	sw	$ra, 0($sp)	#Store the return value
	jal 	invr		#call to another procedure
	lw	$ra, 0($sp)	#reload the return value
	jr	$ra		#jump to the return value
	
	.text
invr:	addi 	$t6, $t5, 0	#Setting up a counter for the loop
	srl	$t6, $t6, 1	#Dividing the counter by 2
	la	$t0, arr	#Load address of array
	addi	$t3, $t0, 0	#Setting up a pointer to the end of array	
	sll	$t1, $t5, 2
	add	$t3, $t3, $t1
	addi	$t3, $t3, -4	#Fixes an off by 1 error
loop2:	lw	$t1, 0($t0)	#These statements swap
	lw	$t2, 0($t3)	#values in the array with
	sw	$t2, 0($t0)	#the help of 2 temp registers
	sw	$t1, 0($t3)	
	addi	$t0, $t0, 4	#Increment pointer at beginning of array
	addi	$t3, $t3, -4	#Decrement pointer at end of array
	addi	$t6, $t6, -1	#Decrement counter
	bgtz	$t6, loop2	#Repeat if counter >0
	
	la	$t0, arr	#Load address of array
	addi	$t6, $t5, 0	#Setting up a counter for the loop
	addi	$t1, $zero, 0	#Zeroing out a register for the total
loop3:	lw	$t3, 0($t0)	#Loads value from array
	add	$t1, $t1, $t3	#Adds the new element to the total
	addi	$t0, $t0, 4	#Increments the array index
	addi	$t6, $t6, -1	#Decrements the pointer
	bgtz 	$t6, loop3	#Repeat if counter > 0
	
	addi	$t2, $zero, -1	#Setting up a register for the average
loop4:	sub	$t1, $t1, $t5	#Subtracting the array size from the array total
	addi	$t2, $t2, 1	#Incrementing the average
	bgez	$t1, loop4	#Repeat if counter > 0
	li	$v0, 4
	la	$a0, avg
	syscall
	addi	$a0, $t2, 0
	li	$v0, 1
	syscall
	jr	$ra