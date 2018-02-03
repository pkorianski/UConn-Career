#include <string.h>

#define M 2000
#define N 2000

float a[M][N];

int main()
{
   int i, j;
  
   for(i=0; i<N; i++)
     for(j=0; j<N; j++)
        a[i][j] = i+j;

   return 0;
}
