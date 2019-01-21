#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char* argv[]) {
	int rc = fork();
	if(rc < 0) {
		fprintf(stderr, "fork failed\n");
		exit(1);
	}
	else if(rc == 0) {
		int wc = wait(NULL);
		printf("now, it is child process.\n");
		printf("%d\n", wc);
	}
	else {
		printf("now, it is parent process.\n");
	}
	return 0;
}