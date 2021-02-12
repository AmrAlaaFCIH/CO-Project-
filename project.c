#include <stdio.h>
#include <stdlib.h>
#include "trigonometrics.h"
void subtract();
void division();
void srt();
void power();
void fact();
int factorial(int);
void maxOfList();
int sumofarray(int[]);
void trigonometrics();

int main()
{
    printf("Calculator:\n1-subtract\n2-division\n3-maxOfList\n4-factorial\n5-trigonometric functions\n6-square,rectangle and triangle detection\n7-power\nEnter Your choice: ");
    int choice;
    scanf("%d",&choice);
    switch(choice)
    {
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
    case 5:
        trigonometrics();
        break;
    case 6:
        srt();
        break;
    case 7:
        power();
        break;
    }
    return 0;
}
void trigonometrics()
{
    int unit;
    double theta;
    int choice;
    printf("Enter 5 for theta measured in degrees:\nEnter 4 for theta measured in radians:\n");
    scanf("%d",&unit);
    if(unit != IN_DEG && unit != IN_RAD)
    {
        printf("Invalid choice\n");
    }
    printf("Enter theta:\n");
    scanf("%lf", &theta);
    printf("Enter 1 for cosine:\nEnter 2 for sine:\nEnter 3 for tan:\n");
    scanf("%d", &choice);
    double tan = 0;
    if(choice == 1)
    {
        printf("Cosine %lf is %lf\n", theta, cosineTheta(theta, unit));
    }
    else if(choice == 2)
    {
        printf("Sine %lf is %lf\n", theta, sineTheta(theta, unit));
    }
    else if(choice == 3)
    {
        tan = tanTheta(theta, unit);
        if(tan != MATH_ERROR)
            printf("Tan %lf is %lf\n", theta, tan);
        else
            printf("MATH ERROR\n");
    }
}

void subtract()
{
    int n1,n2;
    printf("Enter the First Number: ");
    scanf("%d",&n1);
    printf("Enter the second Number: ");
    scanf("%d",&n2);
    printf("The result is: %d",n1-n2);
}

void division()
{
    int n1,n2;
    printf("Enter the First Number: ");
    scanf("%d",&n1);
    printf("Enter the second Number: ");
    scanf("%d",&n2);
    printf("The result is: %d",n1/n2);
}

void srt()
{
    int n1,n2,n3;
    printf("Enter the First Number: ");
    scanf("%d",&n1);
    printf("Enter the second Number: ");
    scanf("%d",&n2);
    printf("Enter the third Number: ");
    scanf("%d",&n3);
    if((n1*n1)==((n2*n2)+(n3*n3)))
    {
        printf("Triangle: True");
    }
    else if((n2*n2)==((n1*n1)+(n3*n3)))
    {
        printf("Triangle: True");
    }
    else if((n3*n3)==((n2*n2)+(n1*n1)))
    {
        printf("Triangle: True");
    }
    else if ((n1==n2)&&(n1==n3))
    {
        printf("Square: True");
    }
    else if ((n1==n2)||(n2==n3)||(n1==n3))
    {
        printf("Rectangle: True");
    }
    else
    {
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
    else if(pow > 0)
    {
        int i;
        res = base;
        for(i=0; i<pow-1; i++)
        {
            res *= base;
        }
    }

    printf("\n%d ^ %d = %d\n",base,pow,res);
}

void fact()
{
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

void maxOfList()
{
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

