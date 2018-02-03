#include <stdio.h>
#include <stdlib.h>

/***************************************************/
typedef struct Monomial {
    int coeff;     /* coefficient */
    int exp;       /* exponent    */
    struct Monomial *next;  /* next monomial */
} Mono;

/***************************************************/
typedef struct polynomial {
    int   deg;     /* degree */
    Mono* first;   /* first monomial */
    Mono* last;    /* last monomial  */
} Poly;

/***************************************************/
Mono* newMono( int c, int k, Mono* next)
{
    Mono* mono = (Mono*)malloc( sizeof(Mono) );
    if( mono == NULL ) return NULL;
    mono->coeff = c;
    mono->exp   = k;
    mono->next  = next;
    return mono;
}

/***************************************************/
Poly* newPoly()
{
    Poly* poly = (Poly*)malloc( sizeof(Poly) );
    if( poly == NULL ) return NULL;
    poly->deg = 0;
    poly->first = poly->last = NULL;
    return poly;
}

/***************************************************/
void freePoly(Poly* p)
{
    Mono *m1, *m2;

    if( p == NULL ) return;

    m1 = p->first;

    while( m1 != NULL )
    {
       m2 = m1->next;
       free(m1);
       m1 = m2;
    }
    free(p);

    return;
}

/***************************************************/
void appendMono( Poly* p, Mono* m)
{
   if( p->first == NULL )  /* first monomial */
   {
      p->first = p->last = m;
   }
   else   /* add monomial after last */
   {
      p->last = p->last->next = m;
   }
   return;
}

/***************************************************/
Poly* readPoly()
{
    /*
       Add code to read from standard input a polynomial
       in the format described in the assignment document
       and construct its linked list representation
     */
     Poly* p = newPoly();
     int mDeg = 0;
     p->first = NULL; 
     while((scanf("%d", &mDeg)) != '\n'){ //getting max degree
     p->deg = mDeg;
     
     int co, exp = 0;
     
     while(exp < mDeg && (scanf("%d %d", &co, &exp) != '\n')){ 
        Mono* temp = newMono(co, exp, NULL);
        appendMono(p, temp);
     }
     //printf("Made it outside loop");
     break;
    }
     //printf("\nOut Outside loop\n"); 
     return p;  
}

/***************************************************/
void printPoly( Poly* p )
{
    /*
       Add code to print to standard output a polynomial
       in the format described in the assignment document
     */
     Mono* scurr = (Mono*)malloc( sizeof(Mono) );
     scurr = p->first;
     printf("%d ", p->deg);
     while(scurr->next){ 
       if(scurr->coeff == 0){
         scurr = scurr->next;
       }
       else{
         printf("%d %d ", scurr->coeff, scurr->exp); 
       }

     }
}

/***************************************************/
Poly* addPoly( Poly* p1, Poly* p2 )
{
    /*
       Add code to compute the sum of two polynomials
       given as linked lists

     */
     Poly* s = newPoly();
     if(p1->deg > p2->deg){
       s->deg = p1->deg;
     }
     else{
       s->deg = p2->deg;
     }
     s->first = NULL;
     

     Mono* p1curr; //= (Mono*)malloc( sizeof(Mono) );
     Mono* p2curr; //= (Mono*)malloc( sizeof(Mono) );
      
     p1curr = p1->first;
     //printf("Coeff=%d , Exp=%d\n", p1curr->coeff, p1curr->exp);
     p2curr = p2->first;

     //printf("Coeff=%d , Exp=%d\n", p2curr->coeff, p2curr->exp);
     while(p1curr->next && p2curr->next){
       if(p1curr->exp == p2curr->exp){

          Mono* temp = newMono(((p1curr->coeff)+(p2curr->coeff)), (p1curr->exp), NULL);
          printf("Plcurr->exp is EQUAL: COEFF= %d , EXP= %d", temp->coeff, temp->exp);  
          appendMono(s,temp);
          p1curr = p1curr->next;
          p2curr = p2curr->next; 
       }
       else if(p1curr->exp > p2curr->exp){
         Mono* temp = newMono(p2curr->coeff, p2curr->exp, NULL); 
         printf("Plcurr->exp is GRTERTHAN: COEFF= %d , EXP= %d", temp->coeff, temp->exp); 
         appendMono(s,temp);
         p2curr = p2curr->next;
       }
       else if(p1curr->exp < p2curr->exp){
         Mono* temp = newMono(p1curr->coeff, p1curr->exp, NULL); 
         printf("Plcurr->exp is LESSTHAN: COEFF= %d , EXP= %d", temp->coeff, temp->exp); 
         appendMono(s,temp);
         p1curr = p1curr->next;
       }

     }
     return s;
}

/***************************************************/

int main()
{
    Poly* p1 = readPoly();
    Poly* p2 = readPoly();
    //printPoly(p1);
    //printPoly(p2);
    Poly* sum;

    /*
    printPoly(p1);
    printPoly(p2);
    printf("\n\n\n");
    */

    if( (p1 == NULL) || (p2 == NULL) )
    {
        fprintf(stderr, "Could not allocate memory\n");
        return 1;
    }
    
    sum = addPoly(p1, p2);
    //printf("Degree Sum: %d\n", sum->deg);
    //printf("Degree P1: %d\n", p1->deg);
    //printf("Degree P2: %d\n", p2->deg);
    printf("\n");
    printPoly(sum);
    printf("\n");
    //printPoly( sum = addPoly( p1, p2 ) );

    freePoly(p1);
    freePoly(p2);
    freePoly(sum);

    return 0;
}

/***************************************************/
/***************************************************/
