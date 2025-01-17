#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>
#include <sys/wait.h>
#include <unistd.h>
int main (){
  pid_t pid= fork();
if(pid == -1){
perror ("Fork Failed\n");
}
else  if(pid==0){
  wait(NULL);
  perror("Failed to wait\n");
  printf("Error %s\n",strerror(errno));
}
  else{
  wait(NULL);
  perror("Failed to wait\n");
  printf("Error %s\n", strerror(errno));
}
}
