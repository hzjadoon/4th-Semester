#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
long factorial(int n) {
    if (n == 0 || n == 1) return 1;
    long result = 1;
    for (int i = 2; i <= n; i++) {
        result *= i;
    } return result;
}
int main(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++) {
        int num = atoi(argv[i]);
        pid_t pid = fork();
        if (pid < 0) {
            perror("Fork failed");
            exit(1);
        } else if (pid == 0) {
            long fact = factorial(num);
                printf("Factorial of %d is %ld (PID: %d)\n", num, fact, getpid());
            exit(0);
        }
    }
    for (int i = 1; i < argc; i++) {
        wait(NULL);
    } return 0;
}
