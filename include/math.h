#ifndef _MATH_H_
#define _MATH_H_

#ifndef __MWERKS__
static inline int __abs(int n)
{
    int mask = n >> 31;
    return (n + mask) ^ mask;
}
#endif

#define NAN       (0.0f / 0.0f)
#define HUGE_VALF (1.0f / 0.0f)
#define INFINITY  (1.0f / 0.0f)

double fabs(double x);
double sin(double x);
double cos(double x);

float sinf(float x);
float cosf(float x);
float tanf(float x);
float acosf(float x);

double ldexp(double x, int exp);

static inline int abs(int n) { return(__abs(n)); }

double scalbn(double x, int n);

double copysign(double x, double y);

double floor(double x);

double fabs(double x);

#ifdef __MWERKS__
#pragma cplusplus on
#endif

#ifdef __MWERKS__
extern inline float sqrtf(float x)
{
    static const double _half = .5;
    static const double _three = 3.0;
    volatile float y;
    if (x > 0.0f)
    {
       double guess = __frsqrte((double)x);   // returns an approximation to
       guess = _half*guess*(_three - guess*guess*x);  // now have 12 sig bits
       guess = _half*guess*(_three - guess*guess*x);  // now have 24 sig bits
       guess = _half*guess*(_three - guess*guess*x);  // now have 32 sig bits
       y = (float)(x*guess);
       return y ;
    }
    return x;
}
#else
extern float sqrtf(float x);
#endif

long __fpclassifyf(float x);
long __fpclassifyd(double x);

#define FP_NAN       1
#define FP_INFINITE  2
#define FP_ZERO      3
#define FP_NORMAL    4
#define FP_SUBNORMAL 5

#define fpclassify(x) (sizeof(x) == sizeof(float) ? __fpclassifyf((float)(x)) : __fpclassifyd((double)(x)))
#define isfinite(x) ((fpclassify(x) > FP_INFINITE))

#ifdef __MWERKS__
#pragma cplusplus reset
#endif

#endif
