#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

// I don't know <time.h>, so I don't know how to 
// solve this problem

int main(int argc, char* argv[]) {
	int rc = fork();
	if(rc < 0) {
		fprintf(stderr, "fork failed\n");
		exit(1);
	}
	else if(rc > 0) {
		time_t timer, delay;
		time(&timer);
		delay = timer + .01;
		while(difftime(delay, timer) >= 0) {
			time(&timer);
		}
		printf("goodbye\n");
	}
	else {
		printf("hello\n");
	}
	return 0;
}