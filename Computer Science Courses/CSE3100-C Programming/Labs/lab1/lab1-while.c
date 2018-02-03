#include <stdio.h>

int main()
{
    int n, i;
    int sum;

    printf( "Enter the value of n: " );
    scanf( "%d", &n );
    
    if(n > 0.0){
    	i= 2*n;
        while(i>=n){
	  sum += n;
          n++;
        } 
    }
    else{
	i= 2*n;
	while(n>=i){
	  sum += i;
          i++;
	}
    }

	
    /*
        Add code to compute sum of integers from n to 2n if n is nonnegative, or
        from 2n to n if n is negative, using a "while" loop
    */



    printf( "Sum is %d\n", sum );

    return 0;
}
