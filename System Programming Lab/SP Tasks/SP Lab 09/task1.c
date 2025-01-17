#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string.h>
#include <unistd.h>

void dp1(const char *dir) {
  struct dirent *dp;
  struct stat buffer;
  DIR *d = opendir(dir);
   chdir(dir);
  while ((dp = readdir(d)) != NULL) {
       if (dp->d_name[0] == '.') {
      continue;
     }
     printf("%s\n", dp->d_name);
     stat(dp->d_name, &buffer);
      if (S_ISDIR(buffer.st_mode)) {
    dp1(dp->d_name);
        chdir("..");
      }
    }
}
int main(int argc, char *argv[]) {
    dp1(argv[1]);
    return 0;
}
