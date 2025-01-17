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
        } else if (pid == 0) {
            printf("Child %d: PID = %d, Parent PID = %d\n", i + 1, getpid(), getppid());
            exit(0);
        }
    }
    for (int i = 0; i < n; i++) {
        wait(NULL);
}
    return 0;
}
