#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>

sem_t s;
sem_init(&s, 0, 1);

int sem_wait(sem_t *s) {
	// decrement the value of semphore by one
	// wait if value of semphore is negative
}

int sem_post(sem_t *s) {
	// increment the value of semphore by one
	// if there are one or more threads waiting, wake one
}

// binaary semphore (locks)

sem_t m;
sem_init(&m, 0, X);

sem_wait(&m);
// critical section here
sem_post(&m);