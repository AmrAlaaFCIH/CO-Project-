.data 
introMsg: .asciiz "Calculator:\n1-subtract\n2-division\n3-maxOfList\n4-factorial\n5-sin\n6-cos\n7-tan\n8-square,rectangle and triangle detection\n9-power\nEnter Your choice: "
fisrtNumber: .asciiz "Enter First Number: "
secondNumber: .asciiz "Enter second Number: "
thirdNumber: .asciiz "Enter Third Number: "
resultMsg: .asciiz "result is: "
traingle: .asciiz "Traingle: True"
square: .asciiz "Square: True"
rectangle: .asciiz "Rectangle: True"
cannt: .asciiz "Can't find the shape"

#choice 3
        message1: .asciiz " Max_Min\n "

	message2: .asciiz "Fill In The List with 15 Number \n"

	message3: .asciiz  "Welcome \nTo Get The Max Number in The List Press : 1\nTo Get The Min Number in The List Press : 2\nTo Exit The Program Press : 0 \n"

      	message4: .asciiz "Please Enter A Valid Option Number : \n"

      	message5: .asciiz "Max Value := "

      	message6: .asciiz "Min Value := "

      	message7: .asciiz "\n"

      	byemessage: .asciiz "Have A Nice Day \n"

      	test: .asciiz "Exit max\n"

      	test2: .asciiz "Exit min\n"

      	gomax: .asciiz "going to max\n"

      	print:.asciiz "Enter Value: "

      	array: .word 0:15

#choice 4
msgprompt: .word msgprompt_data
msgres1: .word msgres1_data
msgprompt_data: .asciiz "enter a Positive integer: "
msgres1_data: .asciiz " factorial is: "


# Choice 9
baseNum: .asciiz "Enter The Base Number :"
powNum:  .asciiz "Enter The Power Number:"

.text 
main:  #switch case for our program 
li $v0 , 4    #message print code 
la $a0 , introMsg #load the message to the register 
syscall   #calling the system to check code and excute 
li $v0 , 5  #integer input code 
syscall  #calling the system to check code and excute 
add $s0,$0,$v0  #store integer to register s0

li $t0,1  #store option number to register t0
beq $s0,$t0, subtract #if user input equal option number call this funtion 

li $t0,2 #store option number to register t0
beq $s0,$t0, division #if user input equal option number call this funtion 

li $t0,3 #store option number to register t0
beq $s0,$t0, maxofList #if user input equal option number call this funtion 

li $t0,4 #store option number to register t0
beq $s0,$t0, fact #if user input equal option number call this funtion 

li $t0,8 #store option number to register t0
beq $s0,$t0, srt #if user input equal option number call this funtion 

li $t0,9				# Load 9 (Number Of Choice) Into $t0
beq $s0,$t0, power			# Check If User Choice ($s0) = $t0 (9), Then Go To "power" Label (Procedure)

li $v0 , 10 #code for program termination 
syscall


subtract:
li $v0 , 4 #code for printing string 
la $a0 , fisrtNumber #load message to register 
syscall #print it to user 
li $v0 , 5 #code for integer input 
syscall #take input from the user 
add $s0,$0,$v0  # putting the first number to s0
li $v0 , 4  #code for printing string 
la $a0 , secondNumber #load message to register
syscall #print it to user
li $v0 , 5 #code for integer input
syscall #take input from the user 
add $s1,$0,$v0  #putting second number to s1
sub $s2,$s0,$s1 # subtract and store the output 
li $v0 , 4  #code for printing string 
la $a0 , resultMsg #load message to register  
syscall #print it to user
li $v0 , 1 #code for integer output 
add $a0 ,$0, $s2 #load integer to register 
syscall #printing integer to the user 
li $v0 , 10 #code for program termination
syscall


division:
li $v0 , 4
la $a0 , fisrtNumber #printing string for first number
syscall 
li $v0 , 5 #getting integer from the user
syscall  #take input from the user
add $s0,$0,$v0 #saving the integer to register s0
li $v0 , 4
la $a0 , secondNumber #printing string for second number
syscall 
li $v0 , 5  #getting integer from the user
syscall 
add $s1,$0,$v0  #saving integer to register s1
div $s2,$s0,$s1 #divide the two integers and save the result to register s2
li $v0 , 4
la $a0 , resultMsg #printing string for the result msg
syscall 
li $v0 , 1
add $a0 ,$0, $s2  #saving s2 result to a0 to print
syscall
li $v0 , 10  #terminate the program 
syscall


srt:
li $v0 , 4  #message print code 
la $a0 , fisrtNumber #load message to register 
syscall #printing string for first number
li $v0 , 5 #code for integer input
syscall  #take input from the user
add $s0,$0,$v0 #strore integer to register s0
li $v0 , 4  #message print code 
la $a0 , secondNumber #load message to register 
syscall #printing string for first number
li $v0 , 5 #code for integer input
syscall  #take input from the user
add $s1,$0,$v0 #store integer to register s1
li $v0 , 4  #message print code 
la $a0 , thirdNumber #load message to register 
syscall #printing string for first number
li $v0 , 5 #code for integer input
syscall  #take input from the user
add $s2,$0,$v0 #store integer to register s2


#square and save the result 
mulo $t0,$s0,$s0 
mulo $t1,$s1,$s1
mulo $t2,$s2,$s2
#add squares and save result for triangle check 
add $t3,$t0,$t1
add $t4,$t1,$t2
add $t5,$t2,$t0

#code to check if triangle and branch 
beq $t0,$t4,tra
beq $t1,$t5,tra
beq $t2,$t3,tra

#code to check if all of them is equal 
seq $t0,$s0,$s1
seq $t1,$s0,$s2
seq $t2,$s1,$s2

beq $t0,$t1,squ # if all of them is equal branch to square function 
li $t3,1  # if all of them arenot equal we check if only two of them are equal to rectangle check
beq $t0,$t3,req 
beq $t1,$t3,req
beq $t2,$t3,req

li $v0 , 4  #code for printing string 
la $a0 , cannt #message to print 
syscall #print the message 
li $v0 , 10 #code for program termination
syscall


tra:
li $v0 , 4 #code for printing string 
la $a0 , traingle #message to print 
syscall #print the message 
li $v0 , 10 #code for program termination
syscall

squ:
li $v0 , 4 #code for printing string 
la $a0 , square #message to print 
syscall #print the message 
li $v0 , 10 #code for program termination
syscall

req:
li $v0 , 4 #code for printing string 
la $a0 , rectangle #message to print 
syscall #print the message 
li $v0 , 10 #code for program termination
syscall

fact:
  la      $t0, msgprompt    # load address of msgprompt into $t0
  lw      $a0, 0($t0)       # load data from address in $t0 into $a0
  li      $v0, 4            # call code for print_string
  syscall                   # run the print_string syscall
  
  li      $v0, 5            # call code for read_int
  syscall                   # run the read_int syscall
  move    $t0, $v0          # store input in $t0

  move    $a0, $t0          # move input to argument register $a0
  addi    $sp, $sp, -12     # move stackpointer up 3 words
  sw      $t0, 0($sp)       # store input in top of stack
  sw      $ra, 8($sp)       # store counter at bottom of stack
  jal     factorial         # call factorial

  lw      $s0, 4($sp)       # load final return val into $s0

  la      $t1, msgres1      # load msgres1 address into $t1
  lw      $a0, 0($t1)       # load msgres1_data value into $a0
  li      $v0, 4            # system call for print_string
  syscall                   # print value of msgres1_data to screen

  move    $a0, $s0          # move final return value from $s0 to $a0 for return
  li      $v0, 1            # system call for print_int
  syscall                   # print final return value to screen

  addi    $sp, $sp, 12      # move stack pointer back down where we started

  li      $v0, 10           # system call for exit
  syscall                   # exit!

factorial:
  
  lw      $t0, 0($sp)       # load input from top of stack into register $t0
  beq     $t0, 0, returnOne # if $t0 is equal to 0, branch to returnOne
  addi    $t0, $t0, -1      # subtract 1 from $t0 if not equal to 0
  addi    $sp, $sp, -12     # move stack pointer up 3 words
  sw      $t0, 0($sp)       # store current working number into the top of the stack segment
  sw      $ra, 8($sp)       # store counter at bottom of stack segment
  jal     factorial         # recursive call
  lw      $ra, 8($sp)       # load this call's $ra again(we just got back from a jump)
  lw      $t1, 4($sp)       # load child's return value into $t1
  lw      $t2, 12($sp)      # load parent's start value into $t2
  mul     $t3, $t1, $t2     # multiply child's return value by parent's working value, store in $t3.
  sw      $t3, 16($sp)      # take result(in $t3), store in parent's return value.
  addi    $sp, $sp, 12      # move stackpointer back down for the parent call
  jr      $ra               # jump to parent call
  
returnOne:
  li      $t0, 1            # load 1 into register $t0
  sw      $t0, 4($sp)       # store 1 into the parent's return value register
  jr      $ra               # jump to parent call


power:
	li $v0, 4
	la $a0, baseNum 
	syscall 
	li $v0, 5			# Read Base [User Input] -- Integer
	syscall
	add $s0, $v0, $0		# Store Base in $s0	 
	
	li $v0, 4
	la $a0, powNum 
	syscall 
	li $v0, 5			# Read Power [User Input] -- Integer
	syscall
	add $s1, $v0, $0		# Store Power in $s1	
	
	addi $t0, $0, 0			# Counter Variable ($t0) Initi to 0
	sub $t1, $s1, 1			# t1 = power - 1
	addi $s3, $0, 0			# Initilize Result($s3) to 0
	
	beq $s1, $0, IF			# Check If Power == 0		--> Set Result($v0) = 1
	slt $t2, $0, $s1		# Check If Power Is Positive Number -- ( 0 < Power ),
	beq $t2, $0, ELSE		# Then Go To "ELSE" Label
	
	ELSE:
	addi $s3, $s0, 0		# Result = Base
	fLoop:
	slt $t2, $t0, $t1		# Check End Of Loop (Counter < Power - 1)
	beq $t2, $0, Exit		# If Loop is Ended, Go To "Exit" Label 
	mult $s3, $s0			# Result * Base
	mflo $s3			# Result *= Base 
	addi $t0, $t0, 1		# Counter++
	j fLoop				# Else, Loop Again
	
	IF: li $s3, 1
	
	Exit:
	
	li $v0, 1
	add $a0, $s3, $0
	syscall 
	
	End_Prog:	
	li $v0, 10			# Terminate The Program
	syscall

maxofList:					
	 li 	$v0 , 4  	
	 la 	$a0 , message1	
	 syscall 				
	 li $v0 , 4 			
	 la $a0 , message2      
	 syscall 				

	 li $v0 , 4				
	 la $a0 , print			
	 syscall				

	 li $v0 , 5             
	 syscall 				

	 move $t1 ,$v0			
	 la $t2,array  			
	 sw $t1,0($t2) 			
	 addi $t2,$t2,4    		
	 andi $t3 ,$t3 ,0	
	 addi $t3,$t3,0

	 li $v0 , 4				
	 la $a0 , message7		
	 syscall		

	 while:					
		beq $t3,14,next		
		li $v0 , 4			
		la $a0 , print		
		syscall				
		li $v0 , 5        
		syscall 			
	 	move $t1 ,$v0		
		sw $t1,($t2)		
	 	addi $t2,$t2,4		
	 	addi $t3,$t3,1		
	 	li $v0 , 4			
	 	la $a0 , message7	
	 	syscall				
	 	j while

	 next:
	 li $v0,4               
	 la $a0,message3       
	 syscall              

	 li $v0,5               
	 syscall               
	 move $t0,$v0         



	 while_1:               
	 	beq $t0,0,exit     
	 	beq $t0,1,max      
	 	beq $t0,2,min      
	 	bne $t0,0,go_back1  
	 	bne $t0,1,go_back1
	 	go_back1:           
	 	jal go_back        
	 	move $t0,$v1       
	 	b while_1
	
	 	max:
	 	    jal maxf
	 	move		$a1,$v1			
	 	li		$v0,4			 
	 	la		$a0,message5		
	 	syscall					
	 	li		$v0 ,1		        
	 	move		$a0,$a1			
	 	syscall					
	 	li		$v0,4			 
	 	la		$a0,message7		 
	 	syscall					
	 	li		$v0 ,4			
	 	la		$a0 ,message3 		
	 	syscall					
	 	li		$v0 ,5			 
	 	syscall					
	 	move		$t0,$v0
	 	j while_1				

	
		min: 
	 	    jal minf				
	 	move  $a1,$v1				
	 	li   $v0,4				
	 	la   $a0,message6 			
	 	syscall					
	 	li $v0 ,1			
	 	move $a0,$a1				
	 	syscall					
	 	li $v0,4		
	 	la $a0,message7	
	 	syscall					
	 	li $v0 ,4				
	 	la $a0 ,message3			
	 	syscall					
	 	li $v0 ,5				
	 	syscall					
	 	move $t0,$v0
	 	j while_1			

	go_back:
	   li $v0 ,4             
	   la $a0,message4       
	   syscall               
	   li $v0,5              
	   syscall             
	   move $v1,$v0          
	   jr $ra                

	exit:                    
	 li $v0 ,4               
	 la $a0 ,byemessage     
	 syscall                 
	 li $v0 ,10              
	 syscall                 



	maxf:
	lw $t4,array	
	move $a1,$t4	
	la $t4,array	
	andi $t5,$t5,0	
	loop_mx:
	    if1: beq $t5 ,15,Finish 
	   	continue:
	   	lw $s2,($t4)	
	   	bge $s2,$a1,replace			
	   	inc:			
	   	addi $t5,$t5,1	
	   	addi  $t4,$t4,4	
	   	j loop_mx	
	   	replace:
	   	move $a1,$s2
	   	j inc	
	       	Finish:
	     	move $v1,$a1 	
	     	li $v0 ,4		
	     	la $a0,test	
	     	syscall
	     	jr $ra		

	minf:
	lw $t4,array	
	move $a2,$t4	
	la $t4,array	
	andi $t5,$t5,0
	loop_min:
	    if2: beq $t5 ,15,go_to_main_1	
	   else2: bne $t5 ,15,continue_1
	   	continue_1:
	   	lw 		$s4,($t4)
	   	ble 		$s4,$a2,replace_1			
	   	increment:						
	   	addi $t5,$t5,1
	   	addi  $t4,$t4,4
	   	j loop_min		
	   	replace_1:		
	   	move $a2,$s4
	   	j increment
	       	go_to_main_1:  		
	     	move $v1,$a2
	     	li $v0 ,4
	     	la $a0,test2		
	     	syscall
	     	jr $ra			


	
	li $v0 , 10
	syscall