#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
	int x = fork();
	if(x == 0){
	  execv("task3min.o", argv);
	}
	int y = fork();
	if(y == 0){
	  execv("task3max.o", argv);
	}
   int status;
   waitpid(x, &status, 0);
   if (WIFEXITED(status)) {
        printf("Min value: %d\n", WEXITSTATUS(status));
  }
    waitpid(y, &status, 0);
    if (WIFEXITED(status)) {
        printf("Max value: %d\n", WEXITSTATUS(status));
  }
    return 0;
}
