#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
int main() {
    int x = close(0);
  if (x == -1) {
        perror("Failed to close file");
        printf("Error: %s\n", strerror(errno));
    } else {
        printf("File closed successfully\n");
    }int y = close(5);
  if (y == -1) {
        perror("Failed to close file");
        printf("Error: %s\n", strerror(errno));
    } else {
    printf("File closed successfully\n");
    }

    return 0;
}

