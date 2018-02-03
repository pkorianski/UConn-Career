#include <stdio.h>

int super( int n, int p[] )
{
    /* return 1 if p[1],...,p[n] is a super-permutation, 0 otherwise */
    int i=0;
    int sORn;
    int x = p[i];
    while(n>i){
        if(p[x] == i){
           i++;
           x = p[i];
        }
        else{
           break;
        }
    }
    if(i == n){
       sORn = 1;
       return sORn;
    }
    else{
       sORn = 0;
       return sORn;
    }    
}

int main()
{
    int i, n;
    int p[100001];  /* p[0] is not used */

    for(;;)
    {
        scanf( "%d", &n);

        if( n==0 ) return 0;

        for( i = 1; i <= n; i++ )
        {
           scanf( "%d", p+i );
        }

        if(super(n, p))
        {
            printf( "super\n" );
        }
        else
        {
            printf( "not super\n" );
        }
    }
}
