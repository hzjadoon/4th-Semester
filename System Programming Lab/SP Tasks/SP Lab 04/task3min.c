#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
 int min = atoi(argv[1]);
  for (int i = 2; i < argc; i++) {
   int num = atoi(argv[i]);
 if (num < min) {
   min = num;
        } }
return min;
}
