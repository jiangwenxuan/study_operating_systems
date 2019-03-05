#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

sem_t forks[5];

int left(int p) {
	return p;
}

int right(int p) {
	return (p + 1) % 5;
}

void getforks() {
	sem_wait(forks[left(p)]);
	sem_wait(forks[right(p)]);
}

void putforks() {
	sem_post(forks[left(p)]);
	sem_post(forks[right(p)]);
}