.data 
	start_prompt1_SolveEquation : .asciiz "\nPlease enter a,b,c value integers seperated by an enter key for solving ax^2+ bx  + c equation.\n"
   	 exit_prompt: .asciiz "\nProgram is closing.\n"
   	 newlineprompt: .asciiz "\n"
    fp4 : .float 4.0 
    fp2 : .float 2.0 
.text
solveEquation:
#prompt the values 
li $v0 , 4            #syscall for printing string
la $a0 , start_prompt1_SolveEquation
syscall

#get "a" value from the user 
li $v0 , 6
syscall 
mov.s $f1,$f0  #store read value in $f0 

#get "b" value from the user 
li $v0 , 6
syscall
mov.s $f2,$f0 #store read value in $f1

#get "c" value from the user 
li $v0 , 6 
syscall 
mov.s $f3 , $f0 #store read value in $f2

l.s $f29, fp4 
l.s $f24 , fp2

# calculate equation
mul.s  $f4 , $f2 , $f2
mul.s  $f5 , $f1 , $f3            # b^2-4ac
mul.s $f5 , $f5 ,  $f29
          
sub.s $f6 , $f4 , $f5      #delta 

         

sqrt.s $f8 , $f6  #sgrt(delta)


neg.s $f2 , $f2
mul.s $f23 , $f1 , $f24  # 2a

add.s $f25 ,$f2 , $f8  # -b + sgrt(delta)
sub.s $f26 , $f2 , $f8 # -b - sgrt(delta)

div.s $f27 , $f25 , $f23 # -b + sgrt(delta)/2a
div.s $f28 , $f26 , $f23 # -b - sgrt(delta)/2a


li $v0 , 2 
mov.s $f12 , $f27
syscall

li $v0 , 4            #syscall for printing string
la $a0 , newlineprompt
syscall 

li $v0 , 2 
mov.s $f12 , $f28
syscall
#Exit 
Exit :
   li $v0 , 4 
   la $a0 , exit_prompt
   syscall 
   
    li $v0 , 10 
    syscall  



    
    