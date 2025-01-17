#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <fcntl.h>
#include <sys/stat.h>

int main(int argc, char const *argv[]) {
    int fd1, fd2, br, bw;
    char buffer[1024]; 
    if (argc == 2) {
        fd1 = open(argv[1], O_RDONLY);
        dup2(fd1, STDIN_FILENO);
        close(fd1);
    } else if (argc == 3) {
        fd1 = open(argv[2], O_WRONLY | O_CREAT | O_APPEND,S_IRWXU|S_IRWXG|S_IRWXO);
        dup2(fd1, STDOUT_FILENO);
        close(fd1);
    } else if (argc == 4) {
        fd1 = open(argv[1], O_RDONLY);
        dup2(fd1, STDIN_FILENO);
        close(fd1);
        fd2 = open(argv[3], O_WRONLY | O_CREAT | O_APPEND,S_IRWXU|S_IRWXG|S_IRWXO);
        dup2(fd2, STDOUT_FILENO);
        close(fd2);
    }
    while ((br = read(STDIN_FILENO, buffer, sizeof(buffer))) > 0) {
        bw = write(STDOUT_FILENO, buffer, br);
   }

    return 0;
}

