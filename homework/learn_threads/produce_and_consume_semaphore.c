#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

#define MAX 1 
int my_buffer[MAX];
int fill = 0;
int use = 0;

void put(int value) {
	my_buffer[fill] = value;
	fill = (fill + 1) % MAX;
}

int get() {
	int tmp = my_buffer[use];
	use = (use + 1) % MAX;
	return tmp;
}

sem_t empty;
sem_t full;
sem_t mutex;

void *producer(void *arg) {
	int i;
	for(i = 0; i < loops; i++) {
		sem_wait(&empty);
		sem_wait(mutex);
		put(i);
		sem_post(&mutex);
		sem_post(&full);
	}
}

void *consumer(void *arg) {
	int tmp = 0;
	while(tmp != -1) {
		sem_wait(&full);
		sem_wait(&mutex);
		tmp = get();
		sem_post(&mutex);
		printf("%d\n", tmp);
		sem_post(&empty);
	}
}

int main(int argc, char *argv[]) {
	sem_init(&empty, 0, MAX);
	sem_init(&full, 0, 0);
	sem_init(&mutex, 0, 0);
	pthread_t c, d;
	printf("begin produce and consume\n");
	pthread_create(&c, NULL, producer, NULL);
	pthread_create(&d, NULL, consumer, NULL); 
	return 0;
}