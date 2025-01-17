#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <dirent.h>
#include <pwd.h>
#include <grp.h>
#include <time.h>
#include <string.h>
#include <unistd.h>
int main(int argc, char *argv[]) {
    const char *dir_name = argv[1];
    DIR *dir = opendir(dir_name);
chdir(dir_name);
  struct dirent *entry;
 while ((entry = readdir(dir)) != NULL) {
    struct stat file_stat;
   struct passwd *pwd;
   struct group *grp;
 stat(entry->d_name, &file_stat);
   printf((S_ISDIR(file_stat.st_mode)) ? "d" : "-");
    printf((file_stat.st_mode & S_IRUSR) ? "r" : "-");
   printf((file_stat.st_mode & S_IWUSR) ? "w" : "-");
  printf((file_stat.st_mode & S_IXUSR) ? "x" : "-");
    printf((file_stat.st_mode & S_IRGRP) ? "r" : "-");
   printf((file_stat.st_mode & S_IWGRP) ? "w" : "-");
 printf((file_stat.st_mode & S_IXGRP) ? "x" : "-");
   printf((file_stat.st_mode & S_IROTH) ? "r" : "-");
  printf((file_stat.st_mode & S_IWOTH) ? "w" : "-");
 printf((file_stat.st_mode & S_IXOTH) ? "x" : "-");
        printf(" %ld", file_stat.st_nlink);
pwd = getpwuid(file_stat.st_uid);
   grp = getgrgid(file_stat.st_gid);
    printf(" %s",pwd->pw_name);
      printf(" %s", grp->gr_name);
    printf(" %ld", file_stat.st_size);
    printf(" %d", file_stat.st_mtime);
        printf(" %s\n", entry->d_name);
    }
    return 0;
}
