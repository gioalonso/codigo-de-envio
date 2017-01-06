// Alonso Arroyo Giovanni
//recorrido Fibonacci de manera Recursiva

#include <stdio.h>
#include <stdlib.h>

int fibonacci(int n)
{
  if (n>2)
    return fibonacci(n-1) + fibonacci(n-2);
  else if (n==2)
    return 1;
  else if (n==1)
    return 1;
  else if (n==0)
    return 0;
}

int main(void)
{
    int num,opc;
printf("Teclea numero para iniciar la serie Fibonacci en modo Recursivo:");
scanf("%i",&opc);
    for (num=0; num<=opc; num++)
    {
      printf("%d\n", fibonacci(num));
    }

  //system("PAUSE");
  return 0;
}
