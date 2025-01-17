#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
void remove_file(const char *filename) {
    if (unlink(filename) == -1) {
        perror("Error deleting file");
        exit(EXIT_FAILURE);
    } else {
        printf("File '%s' removed successfully.\n", filename);
    }
}
int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s FILE\n", argv[0]);
        exit(EXIT_FAILURE);
    }
    remove_file(argv[1]);
    return 0;
}
