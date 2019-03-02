#include <stdio.h>
#include <pthread.h>

typedef struct __counter_t {
	int global;
	pthread_mutex_t glock;
	int local[numcpus];
	pthread_mutex_t llock[numcpus];
	int threshold;
} counter_t;

void init(counter_t *c, int threshold) {
	c->threshold = threshold;
	c->global = 0;
	pthread_mutex_init(&c->glock, NULL);
	int i;
	for(i = 0; i < numcpus; i++) {
		c->local[i] = 0;
		pthread_mutex_init(&c->llock[i], NULL);
	}
}

void update(counter_t *c, int threadID, int amt) {
	int cpu = threadID % numcpus;
	pthread_mutex_lock(&c->llock[cpu]);
	c->local[cpu] += amt;
	if(c->local[cpu] >= c->threshold) {
		pthread_mutex_lock(&c->glock);
		c->global += c->local[cpu];
		pthread_mutex_unlock(&c->glock);
		c->local[cpu] = 0;
	}
	pthread_mutex_unlock(&c->llock[cpu]);
}

int get(counter_t *c) {
	pthread_mutex_lock(&c->glock);
	int val = c->global;
	pthread_mutex_unlock(&c->glock);
	return val;
}