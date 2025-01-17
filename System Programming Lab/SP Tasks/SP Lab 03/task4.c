#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
int main(int argc, char *argv[]) {
    int n = atoi(argv[1]);
       pid_t pid;
    for (int i = 0; i < n; i++) {
   pid = fork();
        if (pid < 0) {
            perror("Fork failed");
            exit(1);
        } else if (pid > 0) {
            printf("Process %d: PID = %d, Parent PID = %d, Child PID = %d\n", i + 1, getpid(), getppid(), pid);
            exit(0);
        } else {
        }
    }sleep(1);
    return 0;
}
