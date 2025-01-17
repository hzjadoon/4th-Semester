#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <unistd.h>

int main (int argc, char*argv[]){
  pid_t pid1,pid2;
pid1=fork();
if(pid1==0){
execv("./task2add.o", argv);
perror("Exec Failed");
}
pid2=fork();
if(pid2==0){
execv("./task2mul.o", argv);
perror("Exec Failed");
}
int status;
waitpid(pid1,&status, 0);
if(WIFEXITED(status)){
printf("Addition: %d\n", WEXITSTATUS(status));
}
waitpid(pid2,&status,0);
if(WIFEXITED(status)){
printf("Multiplication %d\n", WEXITSTATUS(status));
}
return 0;
}
