#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
void create_children(int level, int num_children) {
    for (int i = 0; i < num_children; i++) {
        pid_t pid = fork();
        if (pid < 0) {
            perror("Fork failed");
            exit(1);
        } else if (pid == 0) {
           printf("Level %d Child %d: PID = %d, Parent PID = %d\n", level, i + 1, getpid(), getppid());
            if (level == 2 && (i == 0 || i == 1)) {
                create_children(3, 2);
            } else if (level == 3 && (i == 0 || i == 1)) {
                create_children(4, 2); }
            exit(0);
  }
 }
    for (int i = 0; i < num_children; i++) {
        wait(NULL); }
}
int main() {
    printf("Root process: PID = %d\n", getpid());
    create_children(2, 3);
    return 0;
}
