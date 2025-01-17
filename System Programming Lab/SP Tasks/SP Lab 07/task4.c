#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/select.h>
#include <sys/types.h>
#include <sys/wait.h>
int main(int argc, char *argv[]) {
    int source = open(argv[1], O_RDONLY);
    int dest1 = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0644);
    int dest2 = open(argv[3], O_WRONLY | O_CREAT | O_TRUNC, 0644);
    char buf[1024];
    int n;
   for(int i=1;i<=2;i++){
        int x=fork();
        if (x==0 && i==1) {
        while (n=read(source,buf,sizeof(buf)) > 0) {
        write(dest1, buf, n);
        }
        exit(0);
    }
    if (x == 0 && i==2) {
        while (n=read(source,buf,sizeof(buf))>0) {
         write(dest2, buf, n);
        }
        exit(0);
    }}
    wait(NULL);
    wait(NULL);
    return 0;
}
