#ifndef TRIGONOMETRICS_H_INCLUDED
#define TRIGONOMETRICS_H_INCLUDED

#define IN_RAD 4
#define IN_DEG 5
#define NUM_TERMS 10
#define MATH_ERROR 0.000001
#define M_PI 3.14159265358979323846264338327950288
/*
function that calculates the approximate value of cosine of angle theta
using the taylor series formula of the cosine function:

1-theta^2/2!+theta^4/4!-theta^6/6!...

*/

double cosineTheta(double, int );

/*
function that calculates the approximate value of sine of angle theta
using the taylor series formula of the sine function:

theta-theta^3/3!+theta^5/5!-theta^7/7!...

*/

double sineTheta(double, int );

/*
function that calculates the approximate value of tangent of angle theta
using the formula:

tan(theta) = sin(theta)/cos(theta)

if cosine theta is equal to 0 MATH_ERROR will be returned
*/

double tanTheta(double, int );


#endif // TRIGONOMETRICS_H_INCLUDED
