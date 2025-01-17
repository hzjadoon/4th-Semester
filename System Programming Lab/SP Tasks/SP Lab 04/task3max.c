#include <stdio.h>
#include <stdlib.h>
int main(int argc, char *argv[]) {
 int max = atoi(argv[1]);
 for (int i = 2; i < argc; i++) {
 int num = atoi(argv[i]);
 if (num > max) {
  max = num;
   }
 } return max;
}
