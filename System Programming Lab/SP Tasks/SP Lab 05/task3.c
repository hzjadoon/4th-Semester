#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
int main(int argc, char *argv[]) {

int fd1 = open(argv[1],O_RDONLY);
int fd2 = open(argv[2], O_WRONLY | O_CREAT, S_IRUSR, S_IWUSR, S_IRGRP);
char buff[10];
while(1){
int br= read(fd1, buff, sizeof(buff));
if(br==0){
break;
}
int bw= write(fd2, buff, br);
}
return 0;
}
