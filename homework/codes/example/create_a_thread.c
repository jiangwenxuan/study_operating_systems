#include <pthread.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

typedef struct __myarg_t {
	int a;
	int b;
} myarg_t;

typedef struct __myret_t {
	int x;
	int y;
} myret_t;

void *mythread(void* arg) {
	myarg_t *m = (myarg_t *) arg;
	printf("%d %d\n", m->a, m->b);
	myret_t *r = malloc(sizeof(myret_t))
	r->x = 1;
	r->y = 2;
	return (void *) r;
}

int main(int argc, char* argv[]) {
	pthread_t p;
	myret_t *m;
	int rc;

	myarg_t args;
	args.a = 10;
	args.b = 20;
	pthread_create(&p, NULL, mythread, &args);
	pthread_join(p, (void**) &m);
	free(m);
	return 0;
}