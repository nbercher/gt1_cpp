#include <stdio.h>
#include "faq3.h"

// int a = func(); // -> PAS POSSIBLE EN DEHORS D'UN FONCTION OU MÉTHODE!!

int func(int b) {
  printf("func()!\n");
  return b*3;
}

