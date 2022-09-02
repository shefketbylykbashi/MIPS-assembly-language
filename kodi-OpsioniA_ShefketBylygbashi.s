.text
.globl main
main:
addi $a0, $zero,4 #qite shumen e zeros me 4  ne regjistrin a0 -Iformat

printFun:
#Steku
    addi $sp, $sp, -8 #Steku per dy artikuj
    sw $ra, 4($sp) # ruaj adresen e kthimit 
    sw $a0, 0($sp) # ruaj argumentin $a0 vleren
 

    slti $t0, $a0, 1 #vendose regjitstrin $t0 ne 1 nese $a0<1 perndryshe $to= 0
	
    beq $t0, $zero, else #nese $t0 = 0 ,shko te else
 
    addi $sp, $sp, 8 
    jr $ra #shko pa kusht te instruktsioni adresa e te cilit eshte ne regjistri $a

else:
    li $v0 ,1
    add $t0 ,$a0 ,$zero
    syscall #shtype vleren aktuale te $a0
	
    li $a0, 32
    li $v0, 11  
    syscall # shtype hapsiren(space) 32-->ascii code

    addi $a0, $t0, -1 #e zvoglone n per 1
    jal printFun # shko pa kusht te printFun dhe ruje adresen e instruktsionit te ardhshem ne $ra
	
	
    lw $a0, 0($sp) # merre n prej stekut
    lw $ra, 4($sp) # dhe return adresen
    addi $sp, $sp, 8 #ngrite vlere s $sp per 8
 
 
    li $v0 ,1
    add $t0 ,$a0 ,$zero
    syscall # printoje argumentin e marre nga steku

    li $a0, 32
    li $v0, 11  
    syscall  #shtype hapsiren(space) 32-->ascii code
    jr $ra  