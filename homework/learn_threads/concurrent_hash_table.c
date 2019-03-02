#include "concurrent_link_list.c"
#define BUCKETS (101)

typedef struct __hash_t {
	list_t lists[BUCKETS];
} hash_t;

void hash_init(hash_t *h) {
	int i;
	for(i = 0; i < BUCKETS; i++) {
		list_init(&h->lists[i]);
	}
}

int hash_insert(hash_t *h, int key) {
	int bucket = key % BUCKETS;
	return list_insert(&h->list[bucket], key);
}

int hash_lookup(hash_t *h, int key) {
	int bucket = key % BUCKETS;
	return list_lookup(&h->list[bucket], key);
}