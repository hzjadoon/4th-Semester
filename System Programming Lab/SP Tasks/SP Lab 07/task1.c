#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char *argv[]) {
    int f1 = open(argv[1], O_RDONLY);
    int f2 = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, 0777);
    char buf[1024];
    int br;
    while ((br = read(f1, buf, sizeof(buf))) > 0)
      write(f2, buf, br);
    close(f1);
    close(f2);
    return 0;
}
