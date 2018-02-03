#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define MAX 100

/*********************************************
  Compute the n-th power using recursion
*********************************************/
double power( double x, int n )
{
  if(n % 2 == 0){
    double p = pow(x, n/2);
    return p * p;  
   }
  else{
    return x * power(x, n/2) * power(x, n/2);
  } 
}


/*********************************************
  Evaluate polynomial using the power function
*********************************************/
double eval( int a[], int n, double x )
{
  double sum = 0;
  int i;
  for(i=0; i<=n; i++){
      sum += a[i]*power(x,i);
  }
  return sum; 
}


/*********************************************
  Evaluate polynomial using Horner's rule
*********************************************/
double eval2( int a[], int n, double x )
{
  int i = n;
  double sum = 0;
  while(i>=0){
      sum = sum*x + a[i];
      //printf("Sum : %f\n",sum);
      i--;
  }
  return sum;
}

/********************************************/
int main()
{
    int    i, n;
    int   a[MAX+1];  /* coefficient array */
    double x;

    printf( "Enter the value of x: " );
    (void)scanf( "%lf", &x );
    (void)printf( "Enter the degree n (no larger than %d): ", MAX);
    (void)scanf( "%d", &n );

    /* read coefficients */
    for( i = 0; i<=n; i++ )
    {
        (void)printf( "Enter a[%d]: ", i );
        (void)scanf( "%d", &a[i] );
    }

    (void)printf( "Polynomial evaluates to %f using power function\n", eval(a, n, x) );
    (void)printf( "Polynomial evaluates to %f using Horner's rule\n", eval2(a, n, x) );
    //double ans = power(x, n);
    //(void)printf("Double power of %f power %d equals %f\n", x , n, ans);

    return 0;
}
