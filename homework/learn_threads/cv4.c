#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int buffer[MAX];
int fill_ptr = 0;
int use_ptr = 0;
int count = 0;

void put(int value) {
	buffer[fill_ptr] = value;
	fill_ptr = (fill_ptr + 1) % MAX;
	count++;
}

int get() {
	int tmp = buffer[use_ptr];
	use_ptr = (use_ptr + 1) % MAX;
	count--;
	return tmp;	
}

cond_t empty, fill;
mutex_t mutex;

void *producer(void *arg) {
	int i;
	for(i = 0; i < loops; i++) {
		pthread_mutex_lock(&mutex);
		while(count == MAX) {
			pthread_cond_wait(&empty, &mutex);
		}
		put(i);
		pthread_cond_signal(&fill);
		pthread_mutex_unlock(&mutex);
	}
}

void *consumer(void *arg) {
	int i;
	for(i = 0; i < loops; i++) {
		pthread_mutex_lock(&mutex);
		while(count == 0) {
			pthread_cond_wait(&fill, &mutex);
		}
		int tmp = get();
		pthread_cond_signal(&empty);
		pthread_mutex_unlock(&mutex);
		printf("%d\n", tmp);
	}
}