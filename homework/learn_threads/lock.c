// controlling interrupts:

void lock() {
	disableInterrupts();
}
void unlock() {
	enableInterrupts();
}

// a failed attempt: just using loads/stores:

typedef struct __lock_t {
	int flag;
} lock_t;

void init(lock_t *mutex) {
	mutex->flag = 0;
}

void lock(lock_t *mutex) {
	while(mutex->flag == 1) {
		// spin-wait(do nothing)
	}
	mutex->flag = 1;
}

void unlock(lock_t *mutex) {
	mutex->flag = 0;
}

// building working spin locks with test-and-set

int testAndSet(int *old_ptr, int new) {
	int old = *old_ptr;
	*old_ptr = new;
	return old;
}

typedef struct __lock_t {
	int flag;
} lock_t;

void init(lock_t *lock) {
	lock->flag = 0;
}

void lock(lock_t *lock) {
	while(testAndSet(&lock->flag, 1) == 1) {
		// spin-wait
	}
}

void unlock(lock_t *lock) {
	lock->flag = 0;
}

// compare-and-swap

int compareAndSwap(int *ptr, int expected, int new) {
	int actual = *ptr;
	if(actual == expected) {
		*ptr = new;
	}
	return actual;
}

typedef struct __lock_t {
	int flag;
} lock_t;

void init(lock_t *lock) {
	lock->flag = 0;
}

void lock(lock_t *lock) {
	while(compareAndSwap(&lock->flag, 0, 1) == 1) {
		// spin-wait
	}
}

void unlock(lock_t *lock) {
	lock->flag = 0;
}

// load-linked and store-conditional

int loadLinked(int *ptr) {
	return *ptr;
}

int storeConditional(int *ptr, int value) {
	if(no one has updated *ptr since the loadlinked to this address) {
		*ptr = value;
		return 1;
	}
	else {
		return 0;
	}
}

typedef struct __lock_t {
	int flag;
} lock_t;

void init(lock_t *lock) {
	*lock->flag = 0;
}

void lock(lock_t *lock) {
	while(1) {
		while(loadlinked(&lock->flag) == 1) {
			// spin lock and wait
		}
		if(storeConditional(&lock->flag, 1) == 1) {
			return;
		}
	}
}

void unlock(lock_t *lock) {
	&lock->flag = 0;
}

// fetch-and-add

int fetchAndAdd(int *ptr) {
	int old = *ptr;
	*ptr = old + 1;
	return old;
}

typedef struct __lock_t {
	int ticket;
	int turn;
} lock_t;

void lock_init(lock_t *lock) {
	lock->ticket = 0;
	lock->turn = 0;
}

void lock(lock_t *lock) {
	int myturn = fetchAndAdd(&lock->ticket);
	while(lock->turn != myturn) {
		// spin lock and wait
	}
}

void unlock(lock_t *lock) {
	lock->turn = lock->turn + 1;
}

// just yield

void lock() {
	while(testAndSet(&flag, 1) == 1) {
		yield(); // give up the cpu
	}
}

// queues

typedef struct __lock_t {
	int flag;
	int guard;
	queue_t *q;
} lock_t;

void lock_init(lock_t *m) {
	m->flag = 0;
	m->guard = 0;
	queue_init(m->q);
}

void lock(lock_t *m) {
	while(testAndSet(&m->guard, 1) == 1) {
		// acquire guard lock by spinning
	}
	if(m->flag == 0) {
		m->flag = 1;
		m->guard = 0;
	}
	else {
		queue_add(m->q, gettid());
		setpark();
		m->guard = 0;
	}
}

void unlock(lock_t *m) {
	while(testAndSet(&m->guard, 1) == 1) {
		// acquire guard lock by spinning
	}
	if(queue_empty(m->q)) {
		m->flag = 0;
	}
	else {
		unpark(queue_remove(m->q));
	}
	m->guard = 0;
}