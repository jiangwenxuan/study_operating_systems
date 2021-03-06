
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    int rc = fork();
    if (rc < 0) {
        fprintf(stderr, "fork failed\n");
        exit(1);
    } else if (rc == 0) {
        printf("I'm child, doing my thang. My pid is %d\n", getpid());
        wait(NULL);
    } else {
        printf("I'm parent, and am about to wait\n");
        int wc = wait(NULL);
        printf("I'm parent; child (pid %d) has finished and so have I\n", wc);
    }
    return 0;
}