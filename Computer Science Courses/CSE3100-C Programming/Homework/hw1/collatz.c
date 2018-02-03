#include <stdio.h>

// Patrick Korianski Homework 1
// All print statements other than the bottom one that shows the final result, were used for testing  and seeing the correct number of steps per trial.

int main()
{
  int a, b, x, final, lgsteps;
  lgsteps = 0;
  printf( "Enter a: ");
  scanf("%d", &a);
  printf( "Enter b: ");
  scanf("%d", &b);
 
  long steps, prod;
  x = a;
  
  // My Collatz Recurrence method.
  // In the while it looks for if the number is even or odd and then puts it in the right equ.
  // The last if statement determines if the current x's amount of steps is greater than the current      max steps  
  void collatz(int n){
    prod = x;
    steps = 1;
    printf("\n");
    while(prod != 1 && prod != 0){
    	if(prod % 2 ==0){
      	  long eSum = prod/2;
          printf("x= %d at step %d equals %d\n", x, steps, eSum);
      	  prod = eSum;
          steps++;
    	}
        else{
      	  long oSum = (3*prod)+1;
          printf("x=%d at step %d equals %d\n", x, steps, oSum);
          prod = oSum;
          steps++;
    	}
    }
    if(steps > lgsteps){
        lgsteps = steps;
        final = x;
    }
  }
 
 // Runs the method and checks for if the numbers entered are positive numbers and if a>b or a<b
 if(a <= 0 || b <= 0){
    printf("\nThe number entered is not a postive number for a or b\n");
    final = 0;
 }
  else if(a < b){
    while(x != b+1){
       	while(x <= b){
  	  collatz(x);
          printf("-----------------------------\n");
          x++;
        }
    }
   } 
  else{
    while(x != b-1){
       while(x >= b){
         collatz(x);
         printf("-----------------------------\n");
         x--;
       }
    }
  }
  // Kept track of max steps in variable 'final' and at the end of the code made x equal to final  
  x = final;
  

  // Prints final result
  printf("\nLongest Collatz chain starts at %d\n\n", x );
  return 0;
}

