#Functions
####################################
#what is programming?

# functional v object oriented programming
#chunk v dynamic

#Functional programming \/
#anatomy of a function
func <- function(x,y){} #user defining own function
#local v global variables. minimize global vars. vars inside a function 
# only exist within the function
{return(out)}
z<-func(x=2, y=3)
#power of quick repitition using function blocks


######
#User defined functions demo
sum(3,2) #function
3+2 #operator
`+`(3,2)
y<-3
`<-`(yy, 5)

print(read.table) #source code of a built-in function

#creating a function
#start function called adder_subtractor
###########################################################
adder_subtractor <- function(x=1, y=2, z=TRUE){
  #Name: FunctionName
  #Operation: does some random math depending on value of z
  #inputs: 3 inputs: 
    #x (numeric scalar value, default=1. one of numbers to be operated on)
    #y (numeric scalar value, default=2. one of numbers to be operated on)
    #z (logical, default = T. A switch to decide on subtraction or addition)
  #outputs: numeric value resulting from addition or subtraction

  if(z==TRUE){
    out <- x+y
  }else{
    out <- x-y
  }
#out could be two things, depending on if/else statement
  
  return(out)

}
##########################################
#end of adder_subtractor

adder_subtractor(x=7, y=4, z=FALSE)





##########################################
#START OF FUNCTION
hardy_weinberg <- function(p = runif(1)){
##########################################
  #Hardy weinberg my beloved
  #FUNCTION: H_W
  #operation: runs hardy-weinberg equilibrium problem
  #inputs = p: allele frequecny of dom allele
  #output = q: (rec allele): the frequencies of the three genotypes (fAA, fAB, fBB)
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2

  #store data for output
  out_vec <- signif(c(p = p, AA = fAA, BB = fBB, AB = fAB), digits = 3)

  return(out_vec) #return those values
  
}


##########################################

hardy_weinberg(p=0.3)

x <- 5
x
