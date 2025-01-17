#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <string.h>
int main(int argc, char *argv[]) {
    if ((argc - 1) % 2 != 0) {
        perror("The number of files must be even.\n");
        return -1; }
    int  processId;
    for (int i = 1; i < argc; i += 2) {
        processId = fork();
   if (processId < 0) {
            perror("Process creation failed");
            return -1;
        } else if (processId == 0) {
     int srcFd, destFd;
       char buffer[1024];
        int  bytesRead, bytesWritten;
    srcFd = open(argv[i], O_RDONLY);
       destFd = open(argv[i + 1], O_WRONLY | O_CREAT | O_TRUNC, 0644);
  while ((bytesRead = read(srcFd, buffer, sizeof(buffer))) > 0) {
                bytesWritten = write(destFd, buffer, bytesRead); }
            close(srcFd);
            close(destFd);
            exit(0);
        } }
    for (int i=1;i<argc;i+=2){
wait(NULL);}
    return 0;
}

