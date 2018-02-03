/* 
  Below is a copy of the code in ex1.c
  Modify the code to correct all bugs
*/

#include <stdio.h>
int tester(int* c, int k) {
	printf("x[%d] = %d\n", k, c[k]);
        return 0;
}

int main(int argc, char* argv[]) {
	int i, k;
	int x[10000];

	for(i = 0; i < 10000; ++i){
		x[i] = i;
	}

	printf("Enter integer in 0..9999: ");
	scanf("%d", &k);

	tester(x, k);
        return 0;
}


