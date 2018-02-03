/*
  Write a program to compute and print to the standard output
  a) the sum of all even Fibonacci numbers smaller than 1 billion, and
  b) the sum of all prime Fibonacci numbers smaller than 1 billion.
*/
#include <stdio.h>
 
int main()
{

 // Part A: Sum of all even Fibonacci numbers smaller than 1 billion
 int fnum = 0;
 int sum, i, fn;  
 int f1 = 0;
 int f2 = 1;
  
 // Fibonacci method where fn = f(n), f1= f_n-1, f2= f_n-2 starting f1= 0 and f2=1 
 int fibonacci(int n){
    if(n <= 1){
      return n;
    }
    else{
      fn = f1 + f2;
      f1 = f2;
      f2 = fn;
      return fn;
    }
  }
   

  for(i=0; fnum<1000000000; i++){
    fnum = fibonacci(i);
    if(fnum <1000000000 && (fnum % 2) == 0){
      sum += fnum;
      printf("i= %d   | FibNum= %d   | Sum= %d\n", i, fnum, sum);
    }
  }
  
  printf("\n");
  printf("Sum of all even Fib Numbers equals %d\n\n", sum);
  printf("--------------------------------------\n");
  
  
  // Part B: Sum of all prime Fibonacci numbers smaller than 1 billion
  // First Reset f1, f2, fn, num and sum to starting values
  f1 = 0;
  f2 = 1;
  fn = 0;
  fnum = 0;
  sum = 0;
  int numToDivide;
  for(i=0; fnum<1000000000; i++){
     fnum = fibonacci(i);
     int primeDecider; // If equals 0 then prime if greater than not prime
     // numToDivide starts at 2 since we are trying to see if any other #'s than itself go into it
     for(numToDivide=2; numToDivide<=fnum/2; numToDivide++){
          primeDecider = 0;
          // Checks if there is an int that divides it and if so then primeDecider is incremented and             the fibonacci number is not considered prime
          if(fnum % numToDivide == 0){
            primeDecider++;
            break;
          }
       }
       if(primeDecider == 0 && fnum !=0 && fnum !=1){
         sum += fnum;
         printf("i= %d   | FibNum= %d  | Sum= %d\n", i, fnum, sum);
       }
   }

  printf("\n");
  printf("Sum of all prime Fib Numbers equals %d\n\n", sum);
}
