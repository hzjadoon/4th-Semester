#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/select.h>
int main(int argc, char *argv[]) {
    if (argc < 2) return -1;
    int files[argc - 1];
    fd_set set;
    char buf[1024];
    ssize_t n;
    FD_ZERO(&set);
    struct timeval t;
    t.tv_sec=5;
    int max_fd = 0;
    for (int i = 1; i < argc; i++) {
        files[i - 1] = open(argv[i], O_RDONLY);
        FD_SET(files[i - 1], &set);
        if (files[i - 1] > max_fd)
          max_fd = files[i - 1];
    }
    select(max_fd + 1, &set, NULL, NULL,&t); 
        for (int i = 0; i < argc - 1; i++) {
            if (FD_ISSET(files[i], &set)) {
               printf("File %d is ready.\n",files[i]);
            }
        }
    return 0;
}
