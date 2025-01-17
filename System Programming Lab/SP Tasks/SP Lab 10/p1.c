#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/stat.h>
int main() {
    char buff[100];
    int fifofd;
    fd_set readset;
    struct timeval mytime;
    mytime.tv_sec = 2;
mytime.tv_usec =2;
    mkfifo("fifo", 0777); 
    fifofd = open("fifo", O_RDWR); 
    while (1) {
        FD_ZERO(&readset);
        FD_SET(STDIN_FILENO, &readset);
        FD_SET(fifofd, &readset);
        int maxfd = fifofd > STDIN_FILENO ? fifofd : STDIN_FILENO;
        select(maxfd + 1, &readset, NULL, NULL, &mytime);

        if (FD_ISSET(STDIN_FILENO, &readset)) {
            int br = read(STDIN_FILENO, buff, 100);
            write(fifofd, buff, br);
        }
        if (FD_ISSET(fifofd, &readset)) {
            int br = read(fifofd, buff, 100);
            write(STDOUT_FILENO, buff, br);
        }
    }
    close(fifofd);
    return 0;}

