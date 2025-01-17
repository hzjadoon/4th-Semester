#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
 int cmnds = argc - 1;
 pid_t pid;
 for (int i = 1; i <= cmnds; i++) {
        pid = fork();
 if (pid < 0) {
    perror("Fork failed");
  return -1;
        } else if (pid == 0) {
 execlp(argv[i],argv[i],NULL);
 perror("execlp failed");
 return -1;
        }
else {
    int status;
wait(&status);
if(WIFEXITED(status)){
printf("Child exited with status %d\n",WEXITSTATUS(status));
}
}
 } return 0;
}
