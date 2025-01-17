#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
void fill_array(int *arr) {
  arr[0] = 42; arr[1] = 33; arr[2] = 99; arr[3]= 16; arr[4] = 86;arr[5]=12; arr[6] = 75; 
  arr[7]=4; arr[8]=51; arr[9]=63;arr[10]=86; arr[11]=94; arr[12] =21; arr[13]=7; arr[14]=2;arr[15]=87;
}
int sum_array(int *arr, int start, int end) {
    int sum = 0;
    for (int i = start; i < end; i++) {
        sum += arr[i];
    }
    return sum;
}
int main() {
    int arr[15];
    fill_array(arr);
    int total_sum = 0;
    int num_children = 10;
    for (int i = 0; i < num_children; i++) {
        pid_t pid = fork();
        if (pid == 0) {
            int partial_sum = sum_array(arr, i * (15 / num_children), (i + 1) * (15 / num_children));
            printf("Child %d: Partial sum = %d\n", i, partial_sum);
            if(partial_sum>50){ exit(partial_sum+5);
}else
{exit(partial_sum);}        }
    } for (int i = 0; i < num_children; i++) {
        int status;   wait(&status);
        total_sum += WEXITSTATUS(status);
    }
    printf("Total sum: %d\n", total_sum);
    return 0;}
