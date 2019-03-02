#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

volatile int done = 0;

void *child(void *arg) {
	printf("child\n");
    done = 1;
	return NULL;
}

int main(int argc, char *argv[]) {
	printf("parent: begin\n");
	pthread_t c;
	pthread_create(&c, NULL, child, NULL);
	while(done == 0)
	printf("parent: end\n");
	return 0;
}