#include <stdio.h>

int main()
{
    int n, i;
    int sum;

    printf( "Enter the value of n: " );
    scanf( "%d", &n );

    if(n > 0.0){
	for(i=2*n; i>=n; n++){
	sum += n;
        }
    }
    else{
	for(i=2*n; n>=i; i++){
	sum += i;
        }
    }


    /*
        Add code to compute sum of integers from n to 2n if n is nonnegative, or
        from 2n to n if n is negative, using a "for" loop
    */



    printf( "Sum is %d\n", sum );

    return 0;
}