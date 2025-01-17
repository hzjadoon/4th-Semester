#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/select.h>

int main(int agrc, char *argv[]) {
    struct timeval t;
    t.tv_sec =5;
    int f1 = open(argv[1], O_RDONLY);
    int f2 = open(argv[2], O_RDONLY);
    fd_set set;
    char buf[1024];
    int br;
    FD_ZERO(&set);
    FD_SET(f1, &set);
    FD_SET(f2, &set);
    int max_fd = f1 > f2 ? f1 : f2;
    select(max_fd + 1, &set, NULL, NULL, &t);
    if (FD_ISSET(f1, &set)) {
          printf("Source file is ready");
        }
    else if (FD_ISSET(f2, &set)) {
         printf("Destination file is ready");
        }
    close(f1); close(f2);
    return 0;
}
