#include "faq3.h"
#include "faq3.hpp"

int variable_globale;
int variable_globale_initialisee = 0;

int main(void) {
  // Ici tout commence!
  Faq3 f1; // 1. créé f1 en mémoire de type Faq3 ; 2. ***appelle le constructeur Faq3()***

  int k = f1.add(3); // appelle la méthode add() de la classe Faq3
  
  return 0; // 0: ça marche, >0: code erreur
}

// Compilation: =gcc faq3.c main.c -o faq=
