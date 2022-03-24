# const num = 10

# for (let i = 1; i < num; i++) {
#   //boolean value
#   let prime = true
#   if (i === 2) {
#     console.log(i)
#     continue
#   }
#   //exclude even numbers because they will not be prime aside from 2
#   if (i % 2 === 0) {
#     continue
#   }
#   for (let j = 2; j < i; j++) {
#     if (i % j === 0) {
#       prime = false
#       break //this is because we only care about have >= 1 divisor aside from 1 and the i
#     }
#   }
#   if (prime) {
#     console.log(i)
#   }
# }


.text
.globl main

main:
# Ask user to enter a number
li $v0, 4 
la $a0, prompt1
syscall

li $v0, 5 # read int from keyboard into $v0
syscall

# num is in $t0
move $t0, $v0 # move the user's number from $v0 in $t0


#------------------------------Operations-----------------------------------




# i = 1
li $t1, 1

# for(let i ...//)
for_I:
addi $t1, $t1, 1 # let i = 2
sltu $t3, $t1, $t0 # end loop if i === num: "1" if keep looping "0" if end loop
beq $t3, 0, end # end program once i === num: $t3 === 1
beq $t1, 2 print_prime # if i is 2 then print it since 2 is the onnly even prime number

li $t5, 2 # hack for dividing by 2
div $t1, $t5 # divide by 2 to see if number is even
mfhi $t6 # holds the remainder
beq $t6, 0, for_I # if the remainder === 0 then number is EVEN so skip it. 2 is the only prime even number




# j = 1
li, $t2, 1

# for(let j ...//)
for_J:
addi $t2, $t2, 1 # let j = 2
sltu $t4, $t2, $t1 # boolean to hop out of loop if j !< i
beq $t4, 0, print_prime # if j === i then print i since i wasn't evenly divisible by any numbers besides 1 and its self

# the following lines complete the modulus operation
div $t1, $t2 # divide $t1 by $t2 and store remainder in hi
mfhi $t7 # pass value of hi (this is the remainder of above division) to $t7
beq $t7, 0, for_I

j for_J




# the current value of i IS prime so print it
print_prime:

li $v0, 1 
move $a0, $t1 # print current i
syscall
# print space after number 
li $v0, 4 
la $a0, space # move to next iteration of i
syscall

j for_I




# end program
end: li $v0, 10 
syscall 

.data
prompt1:
 .asciiz "Enter a positive integer: "
space:
 .asciiz "  "
prime:
 .asciiz "I'm prime!! "