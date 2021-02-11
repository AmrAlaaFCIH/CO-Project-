#include <stdio.h>
#include <stdlib.h>
void subtract();
void division();
void srt();
void power();
void fact();
int factorial(int);
void maxOfList();
int sumofarray(int[]);

int main()
{
    printf("Calculator:\n1-subtract\n2-division\n3-maxOfList\n4-factorial\n5-sin\n6-cos\n7-tan\n8-square,rectangle and triangle detection\n9-power\nEnter Your choice: ");
    int choice; scanf("%d",&choice);
    switch(choice){
    case 1:
        subtract();
        break;
    case 2:
        division();
        break;
    case 3:
        maxOfList();
        break;
    case 4:
        fact();
        break;
    case 8:
        srt();
        break;
    case 9:
        power();
        break;
    }
    return 0;
}

void subtract(){
    int n1,n2;
    printf("Enter the First Number: ");
    scanf("%d",&n1);
    printf("Enter the second Number: ");
    scanf("%d",&n2);
    printf("The result is: %d",n1+n2);
}

void division(){
    int n1,n2;
    printf("Enter the First Number: ");
    scanf("%d",&n1);
    printf("Enter the second Number: ");
    scanf("%d",&n2);
    printf("The result is: %d",n1/n2);
}

void srt(){
    int n1,n2,n3;
    printf("Enter the First Number: ");
    scanf("%d",&n1);
    printf("Enter the second Number: ");
    scanf("%d",&n2);
    printf("Enter the third Number: ");
    scanf("%d",&n3);
    if((n1*n1)==((n2*n2)+(n3*n3))){
        printf("Triangle: True");
    }
    else if((n2*n2)==((n1*n1)+(n3*n3))){
        printf("Triangle: True");
    }
    else if((n3*n3)==((n2*n2)+(n1*n1))){
        printf("Triangle: True");
    }
    else if ((n1==n2)&&(n1==n3)){
        printf("Square: True");
    }
    else if ((n1==n2)||(n2==n3)||(n1==n3)){
        printf("Rectangle: True");
    }else {
        printf("Can't find the shape");
    }
}

void power()
{
    int base, pow, res = 0;
    printf("Enter The Base Number : ");
    scanf("%d",&base);
    printf("Enter The Power Number: ");
    scanf("%d",&pow);


    if(pow == 0)
        res = 1;
    else if(pow > 0) {
        int i;
        res = base;
        for(i=0; i<pow-1; i++) {
            res *= base;
        }
    }

    printf("\n%d ^ %d = %d\n",base,pow,res);
}

void fact(){
    int num, fact;

   printf("enter a Positive integer:");
   scanf("%d",&num);

   fact =factorial(num);

   printf("\nfactorial of %d is: %d",num, fact);
   return 0;
}

int factorial(int n)
{
   if(n==0)
      return(1);
   return(n*factorial(n-1));
}

void maxOfList(){
    int a[5],i,n,sum;
    printf("Enter elements in array : ");
    for(i=0; i<5; i++)
    {
        scanf("%d",&a[i]);
    }
    sumofarray(a);
}
int sumofarray(int a[])
 {
 	int max,i;
 	max=a[0];
    for(i=1; i<5; i++)
    {

		   if(max<a[i])
		    max=a[i];
    }


    printf("\nmaximum of array is : %d",max);
 }
