#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

typedef struct __node_t {
	int value;
	struct __node_t *next;
} node_t;

typedef struct __queue_t {
	node_t *head;
	node_t *tail;
	pthread_mutex_t headLock;
	pthread_mutex_t tailLock;
} queue_t;

void queue_init(queue_t *q, int value) {
	node_t *tmp = malloc(sizeof(node_t));
	tmp->next = NULL;
	tmp->value = value;
	q->head = q->tail = tmp;
	pthread_mutex_init(&q->headLock, NULL);
	pthread_mutex_init(&q->tailLock, NULL);
}

void queue_enqueue(queue_t *q, int value) {
    node_t *tmp = malloc(sizeof(node_t));
    assert(tmp != NULL);
    tmp->value = value;
    tmp->next = NULL;
    pthread_mutex_lock(&q->tailLock);
    q->tail->next = tmp;
    q->tail = tmp;
    pthread_mutex_unlock(&q->tailLock);
}

int queue_dequeue(queue_t *q, int *value) {
	pthread_mutex_lock(&q->headLock);
	node_t *tmp = q->head;
	node_t *newHead = tmp->next;
	if(newHead == NULL) {
		pthread_mutex_unlock(&q->headLock);
		return -1;
	}
	*value = newHead->value;
	q->head = newHead;
	pthread_mutex_unlock(&q->headLock);
	free(tmp);
	return 0;
}