#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <fcntl.h>

int main() {
    int pipefd[2];
    int pid;
    char message[] = "Hello World";
    char buff[256];
    pipe(pipefd);

    for (int i = 0; i < 3; i++) {
        pid = fork();
        if (pid == 0) {
            read(pipefd[0], buff, 256);
            printf("child %d message is %s\n", i + 1, buff);
            exit(0);
        } else {
            write(pipefd[1], message, strlen(message) + 1);
            wait(NULL);
        }
    }

    return 0;
}
