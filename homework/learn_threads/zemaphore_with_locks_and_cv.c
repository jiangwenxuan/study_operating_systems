#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

typedef struct __zem_t {
	int value;
	pthread_cond_t cond;
	pthread_mutex_t lock;
} zem_t;

void zem_init(zem_t *s, int value) {
	s->value = value;
	cond_init(&s->cond);
	mutex_init(&s->lock);
}

void zem_wait(zem_t *s) {
	mutex_lock(&s->lock);
	while(s->value <= 0) {
		cond_wait(&s->cond, &s->lock);
	}
	s->value--;
	mutex_unlock(&s->lock);
}

void zem_post(zem_t *s) {
	mutex_lock(&s->lock);
	s->value++;
	cond_singal(&s->cond);
	mutex_unlock(&s->lock);
}