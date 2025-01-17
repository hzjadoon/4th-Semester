#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>
#include <fcntl.h>

int main() {
    int pipefd[2];
    int pid;
    char message[] = "Hello from child!";
    char buff[256];
    pipe(pipefd);
    pid = fork();
    if (pid == 0) {
         close(pipefd[0]); 
        write(pipefd[1], message, strlen(message) + 1);
        close(pipefd[1]); 
        exit(0);
    } else {
        close(pipefd[1]);
        read(pipefd[0], buff, sizeof(buff));
        printf("Parent received message: %s\n", buff);
        close(pipefd[0]); 
        wait(NULL);
    }
    return 0;
}
