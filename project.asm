#trigonometrics global constants
.eqv IN_RAD 4 # equivalent to #define IN_RAD 1.. declares a global constant
.eqv IN_DEG 5 # equivalent to #define IN_DEG 1.. declares a global constant
.eqv NUM_TERMS 10 # equivalent to #define NUM_TERMS 10.. declares a global constant
# end trigonometrics global constants
.data 
introMsg: .asciiz "Calculator:\n1-subtract\n2-division\n3-maxOfList\n4-factorial\n5-trigonometric functions\n6-square,rectangle and triangle detection\n7-power\nEnter Your choice: "
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
#choice 5 trigonometric functions
	M_PI: .double 3.14159265358979323846264338327950288 
	MATH_ERROR: .double 0.000001 
	calculatedCos: .double 
	calculatedSine: .double
	theta: .double
	unit: .word
	choice: .word
	enterUnitMsg: .asciiz "Enter 5 for theta measured in degrees:\nEnter 4 for theta measured in radians:\n"
	invalidChoiceMsg: .asciiz "Invalid choice\n"
	enterThetaMsg: .asciiz "Enter theta:\n"
	chooseFuncMsg: .asciiz "Enter 1 for cosine:\nEnter 2 for sine:\nEnter 3 for tan:\n"
	mathErrorMsg: .asciiz "Math Error\n"
	cosineMsg: .asciiz "Cosine is "
	sineMsg: .asciiz "Sine is "
	tanMsg: .asciiz "Tan is "
#end choice 5 trigonometric functions

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

li $t0, 5 #store option number 5 to register t0
beq $s0, $t0, trigonometrics #if user input equal option number 5 call trigonometrics

li $t0,6 #store option number to register t0
beq $s0,$t0, srt #if user input equal option number call this funtion 

li $t0,7				# Load 9 (Number Of Choice) Into $t0
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
	
#trigonometrics code start
#start of trigonometrics label
	trigonometrics:
	li $v0, 4 #instruction to print string
	la $a0, enterUnitMsg #load address of enterUnitMsg string into a0
	syscall
	
	li $v0, 5#instruction to take int input
	syscall
	
	move $t0, $v0#move int input from v0 to t0
	
	li $t1, IN_DEG #load value of IN_DEG to t1
	li $t2, IN_RAD #load value of IN_RAD to t2
	
	beq $t0, $t1, ifChoiceDegree#jump to ifChoiceDegree if user input was equal to IN_DEG
	
	beq $t0, $t2, ifChoiceRadian #jump to ifChoiceRadian if user input was equal to IN_RAD
	
	li $v0, 4 #instruction to print string
	la $a0, invalidChoiceMsg #load address of invalidChoiceMsg into a0
	syscall
	
	li $v0, 10 #system call to end program
	syscall
	
	ifChoiceDegree:
	li $a1, IN_DEG #load 5 to a1 indicating unit is degrees
	
	li $v0, 4 #instruction to print string
	la $a0, enterThetaMsg #load address of enterThetaMsg string into a0
	syscall
	
	li $v0, 7 #instruction to take double input
	syscall
	
	mov.d $f12, $f0 #move double input from f0 to f12 to pass to trigonometric procedures
	
	li $v0, 4 #instruction to print string
	la $a0, chooseFuncMsg #load address of chooseFuncMsg string into a0
	syscall
	
	li $v0, 5 #instruction to take int input
	syscall
	
	move $t3, $v0 #move int input from v0 to t3
	
	addi $t0, $zero, 1 #store choice 1 into t0
	addi $t1, $zero, 2 #store choice 2 into t1
	addi $t2, $zero, 3 #store choice 3 into t2
	
	
	beq $t0, $t3, choiceCosine #go to choiceCosine if user input was 1
	
	beq $t1, $t3, choiceSine #go to choiceSine if user input was 2
	
	beq $t2, $t3 choiceTan #go to choiceTan if user input was 3
	
	#end ifChoiceDegree label
	
	ifChoiceRadian:
	li $a1, IN_RAD #load 5 to a1 indicating unit is degrees
	
	li $v0, 4 #instruction to print string
	la $a0, enterThetaMsg #load address of enterThetaMsg string into a0
	syscall
	
	li $v0, 7 #instruction to take double input
	syscall
	
	mov.d $f12, $f0 #move double input from f0 to f12 to pass to trigonometric procedures
	
	li $v0, 4 #instruction to print string
	la $a0, chooseFuncMsg #load address of chooseFuncMsg string into a0
	syscall
	
	li $v0, 5 #instruction to take int input
	syscall
	
	move $t3, $v0 #move int input from v0 to t3
	
	addi $t0, $zero, 1 #store choice 1 into t0
	addi $t1, $zero, 2 #store choice 2 into t1
	addi $t2, $zero, 3 #store choice 3 into t2
	
	beq $t0, $t3, choiceCosine #go to choiceCosine if user input was 1
	
	beq $t1, $t3, choiceSine #go to choiceSine if user input was 2
	
	beq $t2, $t3 choiceTan #go to choiceTan if user input was 3
	
	#end ifChoiceRadian label
	
	choiceCosine:
	jal cosineTheta #jump to cosineTheta procedure to calculate cosine
	
	li $v0, 4 #instruction to print string
	la $a0, cosineMsg #load address of cosineMsg string into a0
	syscall
	
	li $v0, 3 #instruction to print double
	mov.d $f12, $f2 #move result of cosineTheta procedure from f2 to f12
	syscall
	
	li $v0, 10#system call to end program
	syscall
	
	#end choiceCosine label
	
	choiceSine:
	jal sineTheta #jump to cosineTheta procedure to calculate cosine
	
	li $v0, 4 #instruction to print string
	la $a0, sineMsg #load address of cosineMsg string into a0
	syscall
	
	li $v0, 3 #instruction to print double
	mov.d $f12, $f2 #move result of cosineTheta procedure from f2 to f12
	syscall
	
	li $v0, 10#system call to end program
	syscall
	
	#end choiceSine label
	
	choiceTan:
	jal tanTheta #jump to cosineTheta procedure to calculate cosine
	
	li $v0, 4 #instruction to print string
	la $a0, tanMsg #load address of cosineMsg string into a0
	syscall
	
	ldc1 $f4, MATH_ERROR
	c.eq.d $f2, $f4 #compare if tanTheta result is equal to MATH_ERROR
	
	bc1t tanMathError
	
	li $v0, 3 #instruction to print double
	mov.d $f12, $f2 #move result of cosineTheta procedure from f2 to f12
	syscall
	
	li $v0, 10#system call to end program
	syscall
	
	#end choiceTan label
	
	tanMathError:
	li $v0, 4 #instruction to print string
	la $a0, mathErrorMsg #load address of mathErrorMsg string into a0
	syscall
	
	li $v0, 10#system call to end program
	syscall
	

	# end of trigonometrics label
	
	
	
	#factorial procedure to compute factorial of n
	#$a1 store value of n
	#$f2 store procedure result .. factorial of n
	#$t0 hold dynamically allocated array index
	#$t5 hold dynamically allocated array start address
	#$t3 hold loop counter value
	facto:
	beqz $a1, ifEqZero #go label ifEqZero when n = 0 is evaluated to true
	
	bltz $a1, ifLessThanZero #go label ifLessThanZero when n < 0 is evaluated to true
	
	li $v0,9 #system instruction to dynamically allocate memory
	mul $a0, $a1, 8 #number of bytes to allocate n * 8 .. double array of size n
	syscall #issue system call
	
	move $t5, $v0 #move the dynamically allocated array address start from v0 to t5
	move $v0, $zero #make v0 point to 0 to remove its reference to the address of array
	
	add $t0, $zero, $zero #set index of array to 0
	addi $t1, $zero, 1 #t1 register hold value of 1 to set to first value of facts arrray
	mtc1.d $t1, $f4 #move the value 1 in t1 to f4 in coproc1 to convert to double
	cvt.d.w $f4, $f4 #convert the value 1 to double value
	sdc1 $f4, 0($t5) #store the value of factorials[0] = 1
	
	addi $t3, $zero, 1 #set counter of loop to 1
	
	startWhile: #factorial computation loop start
	bgt $t3, $a1, endWhile #loop termination condition.. $t3 > $a1.. loop counter > n . jump to label endWhile 
	add $t2, $t5, $t0 #store the array address in t5 with offset of the index in t0 into t2 
	ldc1 $f4, ($t2) #load factorials[$t2] into f4 in coproc1
	mtc1.d $t3, $f6 #move the loop counter value from t3 to f6 to convert to double
	cvt.d.w $f6, $f6 #convert the loop counter value to double for multiplication
	mul.d $f8, $f4, $f6 # loop counter multiplied by factorials[counter - 1].. i * factorials[i-1]
	addi $t0, $t0, 8 #increment the array index by 8 to go next address 
	add $t2, $t5, $t0 #store the array address in t5 with offset of index in t0 into t2
	sdc1 $f8, ($t2) #store the value of i * factorials[i-1] in factorials[i].. factorials[i] = i * factorials[i-1]
	addi $t3, $t3, 1 #increment the loop counter by 1
	j startWhile #jump to loop start again
	
	
	#sub-labels/procedures of factorial
	ifEqZero: #this will be executed when n is equal to zero
	addi $t4, $zero, 1 # store value of 1 in t4
	mtc1.d $t4, $f2 #move value of 1 in f2 to convert t double 
	cvt.d.w $f2, $f2 #convert value of 1 to double in f2 for returning it
	j exitFactorial #jump to exitFactorial 
	
	ifLessThanZero: #this will be executed when n is less than zero
	add $t4, $zero, $zero #store value of zero in t4
	mtc1.d $t4, $f2 #move value of zero to f2 for conversion to double
	cvt.d.w $f2,$f2 #convert value of zero to double for returning it
	j exitFactorial #jump to exitFactorial
	
	endWhile: #this will be executed when loop termination condition is evaluated to true
	add $t2, $t5, $t0 #store the array address in t5 with offset in t0 in t2
	ldc1 $f2, ($t2) #load the value in factorials[n]
	move $t5, $zero #make t5 store 0 to remove its reference to array address .. de allocation of the array
	j exitFactorial #jump to exitFactorial
	
	exitFactorial: #will be executed after loop terminates 
	jr $ra #jump to caller address in ra
	
	#end factorial label
	
	                                                                                                                                                                                                                                       
	#procedure to calculate power of number assuming that the exponent is an integer
	#a1 holds the exponent argument
	#f12 holds the base argument 
	#f6 holds result 
	#t1 holds loop counter
	#f2 has return value.. power of base raised to exponent
	pow:
	addi $t0, $zero, 1 #store value of 1 in t0 to move to f6 for initialization
	mtc1.d $t0, $f6 #move value of 1 from t0 to f6 for initialization
	cvt.d.w $f6, $f6 #convert value of 1 to double in f6 for initialization
	addi $t1, $zero, 0 #initialize loop counter to 0
	
	startLoop:
	bge $t1, $a1, exitLoop #jump to exitLoop when loop counter is greater or equal to exponent..
	mul.d $f6, $f6, $f12 # result = result * base
	addi $t1, $t1, 1 #increment loop counter by 1
	j startLoop #jump to loop start
	
	
	exitLoop:
	mov.d $f2, $f6 #move result from f6 to f2 for returning
	jr $ra #jump to address of caller in ra
	
	#end pow label
	
	
	
	
	#procedure to convert unit of theta from degree to radian
	#f12 store theta arguement
	#$f2 returns theta in radians
	degreeToRadian:
	mtc1.d $zero, $f8
	c.lt.d $f12, $f8
	bc1t ifThetaNegative
	
	afterCheckNegative:
	mtc1.d $zero, $f4  #initialize difference to 0
	
	cvt.w.d $f6, $f12 #store the integer part of theta in f6
	
	cvt.d.w $f6, $f6 # convert the integer part of theta to double for subtraction
	
	sub.d $f4, $f12, $f6 #store the difference between the theta double value and the integer value.. diff = degree - (int)degree in f4
	
	
	l.d $f10, M_PI #load the value of M_PI from memory into f10
	li $t2, 180 #load 180 into t2
	mtc1.d $t2, $f16 #move 180 from t2 to f16 to convert to double
	cvt.d.w $f16, $f16 #convert 180 to double value
	div.d $f16, $f10, $f16 #store result of M_PI/180 into f16
	
	cvt.w.d $f6, $f6 #convert the integer part from double to integer to move into t0
	mfc1.d $t0, $f6 #move integer part to t0
	rem $t0, $t0, 360 #store remainder of theta % 360 in t0
	
	mtc1.d $zero, $f8 #store zero in f8 
	c.eq.d $f4, $f8 #compare if difference is equal to zero .. 
	bc1t ifDiffEqZero #jump to branch ifDiffEqZero if comparison was evaluated to true
	
	mtc1.d $zero, $f12 #set value of theta to zero	
	mtc1.d $t0, $f6 # move remainder of theta % 360 to f6
	cvt.d.w $f6, $f6 #convert remainder of theta % 360 to f6
	add.d $f12, $f12, $f6 #add remainder of theta % 360 in f6 and store in f12
	add.d $f12, $f12, $f4 #add the fractional part of theta to f12 and store in f12
	mul.d $f2, $f12, $f16 #store result of theta * (M_PI/180) in f2 for return value
	jr $ra #jump to caller address stored in ra
	
	
	ifDiffEqZero:
	mtc1.d $t0, $f12 # move remainder of theta % 360 to f12
	cvt.d.w $f12, $f12 #convert the remainder to double 
	mul.d $f2, $f12, $f16 # store result of theta * (M_PI/180) into f2 for return value
	jr $ra #jump to caller address stored in ra
	
		
	ifThetaNegative:
	mtc1.d $zero, $f8 #move zero to f8 for loop condition
	mov.d $f6, $f12 #move theta from f12 to f6 for calculations
	li $t0, 360 #load 360 into t0
	mtc1.d $t0, $f4 #move 360 from t0 to f4
	cvt.d.w $f4, $f4 #convert 360 to double and store in f4
	TNwhile:
	c.lt.d $f6, $f8 #compare if f6 (theta) is less than f8 (zero)
	bc1f exitTNWhile #if above comparison is false jump to exitWhile
	add.d $f6, $f6, $f4 # theta += 360
	j TNwhile #jump loop start
	
	exitTNWhile:
	j afterCheckNegative #jump afterCheckNegative to end loop
	
	#end degreeToRadian label
	
	
	#procedure to check the unit of theta whether it is degree or radian
	#if theta is in degrees then procedure degreeToRadian will be called to convert to radians
	#a1 stores the unit of theta as arguement
	#f12 stores theta as arguement
	#f2 stores theta ready for trigonometric calculations.. return value
	checkUnit:
	li $t0, IN_DEG #load value of degree unit from memory
	beq $a1, $t0, ifUnitIsDeg #if unit in a1 is equal to degree unit in t0 then jump to ifUnitIsDeg
	mov.d $f2, $f12 #move theta to f2 from f12 for return value
	jr $ra #jump to location of caller in ra
	
	
	
	ifUnitIsDeg:
	addi $sp, $sp, -4 #allocate space in stack to store the return address
	sw $ra, 0($sp) #store the return address of caller in stack
	
	jal degreeToRadian #jump to degreeToRadian procedure and link the ra register 
	lw $ra, 0($sp) #load the value of the caller address stored in the stack
	
	addi $sp, $sp, 4 #de allocate the stack
	jr $ra #jump to address of caller in ra

	
	
	#end checkUnit label
	
	
	#procedure to calculate cosine of angle in radians
	#f12 store theta as arguement
	#a1 store unit of theta as arguement
	#f2 store cosine theta as return value
	cosineTheta:
	addi $sp, $sp -4#allocate memory in stack for return address
	sw $ra, 0($sp) #store the return address of the caller in stack 
	
	jal checkUnit #call checkUnit to prepare theta for calculations
	mov.d $f10, $f2 #move result of checkUnit to f10 for calculations
	mtc1.d $zero, $f4 #initialize result ( calculatedCos ) to zero
	
	sdc1 $f4, calculatedCos #store calculatedcos to memory from f4
	move $t7, $zero #initialize loop counter to zero
	
	startCosLoop:
	li $t4, NUM_TERMS #load value of num_terms of taylor expansion needed for loop condition
	beq $t7, $t4, endCosLoop #jump to endLoop when loop counter is equal to num of terms of taylor expansion series
	
	addi $t2, $zero, -1 #store -1 in t2 for calculations
	mtc1.d $t2, $f12 #move -1 to f12 to convert to double
	cvt.d.w $f12, $f12 #convert -1 from int to double
	
	mul $t3, $t7, 2 #multiply loop counter by 2 for calculations
	
	move $a1, $t3 #move i * 2 from t3 to a1 to pass as arguement to factorial
	
	jal facto #call factorial of loop counter by 2 .. i * 2
	mov.d $f18, $f2 #move result of factorial (i*2) to f18
	
	move $a1, $t7 #move i from t7 to a1 to pass as exponent arguement for pow procedure
	
	jal pow #call pow(-1,i)
	mov.d $f8, $f2 #move result of pow(-1,i) to f8
	
	move $a1, $t3 #move i *2 from t3 to a1 
	mov.d $f12, $f10 #move theta from f10 to f12 for calculations
	jal pow #call pow(theta, i*2)
	mov.d $f16, $f2 #move result of pow(theta, i*2) from f2 to f16
	
	mul.d $f16, $f16, $f8 #f16 = pow(-1,i) * pow(theta, i*2)
	
	div.d $f16, $f16, $f18 #f16 = pow(-1,i) * pow(theta, i*2) / factorial(i*2)
	
	ldc1 $f4, calculatedCos #load calculatedCos from memory into f4
	
	add.d $f4, $f4, $f16 #calculatedCos += pow(-1,i) * pow(theta, i*2) / factorial(i*2)
	
	sdc1 $f4, calculatedCos #store new calculatedCos to memory from f4
	
	addi $t7, $t7, 1 #increment loop counter by 1
	
	j startCosLoop #jump to loop start
	
	endCosLoop:
	mov.d $f2, $f4 #move result of calculations done in loop to f2 for return value
	
	lw $ra, 0($sp) #load the value of return address stored in stack
	
	addi $sp, $sp, 4 #deallocate space allocated in stack
	
	jr $ra #jump to address of caller in ra
	
	#end cosineTheta label
	
	
	#procedure to calculate sine of angle in radians
	#f12 store theta as arguement
	#a1 store unit of theta as arguement
	#f2 store cosine theta as return value
	sineTheta:
	addi $sp, $sp, -4 #allocate memory in stack for return address 
	sw $ra, 0($sp)  #store the return address of the caller in stack 
	
	jal checkUnit #call checkUnit to prepare theta for calculations
	mov.d $f10, $f2 #move result of checkUnit to f10 for calculations
	mov.d $f4, $f10 #initialize result (calculatedSine) to theta
	
	sdc1 $f4, calculatedSine #store calculatedSine to memory from f4
	addi $t7, $zero, 1 #initialize loop counter to one
	
	startSineLoop:
	li $t4, NUM_TERMS #load value of num_terms of taylor expansion needed for loop condition
	bgt $t7, $t4, endSineLoop #jump to endLoop when loop counter is greater than to num of terms of taylor expansion series
	
	addi $t2, $zero, -1 #store -1 in t2 for calculations
	mtc1.d $t2, $f12 #move -1 to f12 to convert to double
	cvt.d.w $f12, $f12 #convert -1 from int to double
	
	mul $t3, $t7, 2 #multiply loop counter by 2 for calculations
	addi $t3, $zero, 1 #store i * 2 + 1 in t3
	move $a1, $t3 #move i * 2 + 1 from t3 to a1 to pass as arguement to factorial
	
	jal facto #call factorial of loop counter by 2 and add one.. i * 2 + 1
	mov.d $f18, $f2 #move result of factorial (i*2+1) to f18
	
	move $a1, $t7 #move i from t7 to a1 to pass as exponent arguement for pow procedure
	
	jal pow #call pow(-1,i)
	mov.d $f8, $f2 #move result of pow(-1,i) to f8
	
	move $a1, $t3 #move i *2 +1 from t3 to a1 
	mov.d $f12, $f10 #move theta from f10 to f12 for calculations
	jal pow #call pow(theta, i*2+1)
	mov.d $f16, $f2 #move result of pow(theta, i*2+1) from f2 to f16
	
	mul.d $f16, $f16, $f8 #f16 = pow(-1,i) * pow(theta, i*2+1)
	
	div.d $f16, $f16, $f18 #f16 = pow(-1,i) * pow(theta, i*2+1) / factorial(i*2+1)
	
	ldc1 $f4, calculatedSine #load calculatedSine from memory into f4
	
	add.d $f4, $f4, $f16 #calculatedSine += pow(-1,i) * pow(theta, i*2+1) / factorial(i*2+1)
	
	sdc1 $f4, calculatedSine #store new calculatedSine to memory from f4
	
	addi $t7, $t7, 1 #increment loop counter by 1
	
	j startSineLoop #jump to loop start
	
	endSineLoop:
	mov.d $f2, $f4 #move result of calculations done in loop to f2 for return value
	
	lw $ra, 0($sp) #load the value of return address stored in stack
	
	addi $sp, $sp, 4#deallocate allocated space in stack
	
	jr $ra #jump to address of caller in ra
	
	
	#end sineTheta label
	
	#procedure to calculate the tan of theta 
	#f12 store value of theta arguement
	#a1 store value of unit of theta
	#f2 returns the result which may be the tan of theta or MATH_ERROR if cosine theta is equal to 0
	tanTheta:
	addi $sp, $sp, 4 #allocate space in stack for caller return address
	sw $ra, 0($sp) #store return address in stack
	
	jal cosineTheta #jump to cosineTheta procedure to calculate cosine
	
	ldc1 $f6, calculatedCos #load calculatedCos from memory into f6
	ldc1 $f10, MATH_ERROR #load MATH_ERROR from memory into f10
	
	c.lt.d $f6, $f10 #compare if cosine less than MATH_ERROR
	bc1t returnMathError #jump to returnMathError if comparison was true
	
	
	jal sineTheta #jump to sineTheta procedure to calculate sine
	
	ldc1 $f6, calculatedCos #load calculatedCos from memory to f6
	ldc1 $f4, calculatedSine #load calculatedSine from memory to f4
	
	div.d $f2, $f4, $f6 #store the division of calculatedSine and CalculatedCos in f2
	
	lw $ra, 0($sp) #load the return address from stack
	addi $sp, $sp, 4 #deallocate stack memory
	
	jr $ra #jump to caller address in ra
	
	returnMathError:
	lw $ra, 0($sp) #load return address from stack
	
	mov.d $f2, $f10 #move MATH_ERROR from f10 to f2 to return
	
	addi $sp, $sp, 4 #deallocate stack memory
	
	jr $ra #jump to caller address in ra


#trigonometrics code end
	
	
	
	

