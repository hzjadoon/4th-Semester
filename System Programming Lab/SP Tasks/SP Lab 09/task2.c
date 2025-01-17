#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string.h>
#include <unistd.h>
typedef struct QueueNode {
    char path[1024];
    struct QueueNode *next;
} QueueNode;
typedef struct {
    QueueNode *front;
    QueueNode *rear;
} Queue;
void enqueue(Queue *q, const char *path) {
    QueueNode *node = malloc(sizeof(QueueNode));
    strcpy(node->path, path);
    node->next = NULL;
    if (q->rear) {
        q->rear->next = node;
    } else {
        q->front = node;
    }
    q->rear = node;
}

int dequeue(Queue *q, char *path) {
    if (!q->front) return 0;
    QueueNode *node = q->front;
    strcpy(path, node->path);
    q->front = node->next;
    if (!q->front) q->rear = NULL;
    free(node);
    return 1;
}

void dp1(const char *root) {
    Queue q = {NULL, NULL};
    enqueue(&q, root);
    char currentPath[1024];
    struct dirent *dp;
    struct stat buffer;

    while (dequeue(&q, currentPath)) {
        DIR *d = opendir(currentPath);
        if (!d) continue;

        printf("%s\n", currentPath);
        while ((dp = readdir(d)) != NULL) {
            if (dp->d_name[0] == '.') continue;

            char fullPath[1024];
            snprintf(fullPath, sizeof(fullPath), "%s/%s", currentPath, dp->d_name);

            stat(fullPath, &buffer);
            if (S_ISDIR(buffer.st_mode)) {
                enqueue(&q, fullPath);
            } else {
                printf("%s\n", fullPath);
            }
        }
        closedir(d);
    }
}

int main(int argc, char *argv[]) {
    dp1(argv[1]);
    return 0;
}
