// Alonso Arroyo Giovanni
// recorrido de Fibonacci de manera Iterativa

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
  int x,y,z,cont,opc;

  x=0;
  y=1;


  printf("Teclea numero para iniciar la serie Fibonacci en modo iterativo:\n");
  scanf("%i",&opc);
  printf("\nSerie\n");
  for (cont=1;cont<=opc;cont=cont+1)
  {

      z=x+y;
      printf("%d\n",z);
      x=y;
      y=z;
  }

  //system("PAUSE");
  return 0;
}
