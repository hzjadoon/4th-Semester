#include <stdio.h>
#include <stdlib.h>
#include <sys/select.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    struct timeval t;
    t.tv_sec = atoi(argv[1]);
    t.tv_usec = 0;
    int nfd = select(0, NULL, NULL, NULL, &t);
    if (nfd == 0) {
        printf("Select function created delay of %d seconds\n", atoi(argv[1]));
    }
    return 0;
}

