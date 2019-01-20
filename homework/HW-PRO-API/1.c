#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char* argv[]) {
	int x = 100;
	printf("x is 100\n");
	int rc = fork();
	if(rc < 0) {
		fprintf(stderr, "fork failed\n");
		exit(1);
	}
	else if(rc == 0) {
		printf("now, x is %d\n", x);
		scanf("%d", &x);
		printf("in the child process, x is %d\n", x);
	}
	else {
		wait(NULL);
		printf("now, x is %d\n", x);
		scanf("%d", &x);
		printf("in the parent process, x is %d\n", x);
	}
	return 0;
}