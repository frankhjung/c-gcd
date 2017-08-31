#include <stdio.h>
#include "gcd.h"

/*
 * Greatest Common Denominator using recursion.
 * Example from http://www.programiz.com/c-programming/examples/hcf-recursion.
 */
int main()
{
    int n1, n2;
    printf("Require two positive integers:\n");
    printf("Enter first positive integer ...: ");
    (void) scanf("%d", &n1);
    printf("Enter second positive integer ..: ");
    (void) scanf("%d", &n2);
    printf("G.C.D of %d and %d is %d.\n", n1, n2, gcd(n1,n2));
    return 0;
}

int gcd(int n1, int n2)
{
    if (n2!=0)
        return gcd(n2, n1%n2);
    else
        return n1;
}
