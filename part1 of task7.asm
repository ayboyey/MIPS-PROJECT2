#Write a program that checks if the given number is an even number
.data
  prompt1 : 	.asciiz "enter the first number"
  evenMsg: 	.asciiz "the number is even"
  oddMsg:       .asciiz "the number is odd "
  
  num1 :  .word   0 
  .text 
  li 	$v0 ,4  # syscall for printing a string
  la 	$a0,prompt1 # loading the prompt1 from data section $a0
  syscall
  #get "num1" number from the user
    li 	$v0 , 5
    syscall 
    sw    $v0 , num1
    
    #calculating 
    li $t0 , 2 
    div $v0 ,$t0 
    
    mfhi $t1 
    beq  $t1,$zero , yes
 
    #oddMsg : 
    li  $v0 , 4 
    la  $a0 ,oddMsg 
    syscall 
    j   endl
    
     #evenMsg
       yes:  li   $v0, 4 
    	la 	$a0 , evenMsg
    	syscall 
    	endl:
    
    
    
    
    
