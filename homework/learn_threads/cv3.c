#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int buffer
int count = 0;

void put(int value) {
	assert(count == 0);
	count = 1;
	buffer = value;
}

int get() {
	assert(count == 1);
	count = 0;
	return buffer;
}

int loops;
cond_t empty, fill;
mutex_t mutex;

void *producer(void *arg) {
	int i;
	for(i = 0; i < loops; i++) {
		pthread_mutex_lock(&mutex);
		while(count == 1) {
			pthread_cond_wait(&empty, &mutex);
		}
		put(i);
		pthread_cond_signal(&fill);
		pthread_mutex_unlock(&mutex);
	}
}

void *consumer(void *arg) {
	int i;
	for(int i = 0; i < loops; i++) {
		pthread_mutex_lock(&mutex);
		whilew(count == 0) {
			pthread_cond_wait(&fill, &mutex);
		}
		int tmp = get();
		pthread_cond_signal(&empty);
		pthread_mutex_unlock(&mutex);
		printf("%d\n", tmp);
	}
}