#include "trigonometrics.h"
/*
helper function that converts theta from degree to radian
*/

double degreeToRadian(double degree)
{
    if(degree < 0){
        while(degree < 0){
            degree += 360;
        }
    }
    double diff = degree - (int)degree;
    int deg = (int)degree;
    if(diff == 0.0){
        deg %= 360;
        degree = deg;
    }else{
        deg %= 360;
        degree = 0.0;
        degree += deg;
        degree += diff;
    }
    return degree * (M_PI/180);
}

/*
helper function that calculates the power of a number assuming that the exponent is an integer
*/

double pow(double base, int exponent){
    double result = 1;
    for(int i=0; i<exponent; i++)
        result *= base;
    return result;
}

/*
helper function that checks the measuring unit of theta whether it is in degree or radian
in case that theta is in degrees it will be converted to radians
*/

double check_unit(int unit, double theta){
    if(unit == IN_DEG)
        return degreeToRadian(theta);
    return theta;
}

/*
helper function that calculates the factorial of a number n
*/

double facto(int n)
{
    if(n == 0)
    {
        return 1;
    }
    else if(n < 0)
    {
        return 0;
    }
    else
    {
        double facts[n];
        facts[0] = 1;
        for(int i = 1; i <= n; i++)
        {
            facts[i] = i * facts[i - 1];
        }
        return facts[n];
    }
}
/*
function that calculates the approximate value of cosine of angle theta
using the taylor series formula of the cosine function:

1-theta^2/2!+theta^4/4!-theta^6/6!...

*/
double cosineTheta(double theta, int unit)
{
    theta = check_unit(unit, theta);
    double calculatedCosine = 0;
    int i = 0;
    while(i < NUM_TERMS)
    {
        calculatedCosine += pow(-1, i) * pow(theta, i*2) / facto(i*2);
        i++;
    }
    return calculatedCosine;
}
/*
function that calculates the approximate value of sine of angle theta
using the taylor series formula of the sine function:

theta-theta^3/3!+theta^5/5!-theta^7/7!...

*/

double sineTheta(double theta, int unit)
{
    theta = check_unit(unit, theta);
    double calculatedSine = theta;
    int i = 1;
    while(i <= NUM_TERMS)
    {
        calculatedSine += pow(-1, i) * pow(theta, i*2+1)/ facto(i*2+1);
        i++;
    }
    return calculatedSine;
}
/*
function that calculates the approximate value of tangent of angle theta
using the formula:

tan(theta) = sin(theta)/cos(theta)

if cosine theta is equal to 0 MATH_ERROR will be returned
*/

double tanTheta(double theta, int unit)
{
    double cosine = cosineTheta(theta, unit);
    if(cosine > MATH_ERROR)
        return sineTheta(theta, unit) / cosine;
    return MATH_ERROR;
}
