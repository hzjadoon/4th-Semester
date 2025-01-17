#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
 int product = 1;
 for (int i = 1; i < argc; i++) {
  product *= atoi(argv[i]);
    }
 return product;
}
