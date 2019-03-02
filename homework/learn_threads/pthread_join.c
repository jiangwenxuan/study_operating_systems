#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

void print_message(void* ptr) {
	int i = 0;
	for(; i < 5; i++) {
		printf("%s: %d\n", (char *)ptr, i);
	}
}


int main() {
	int tmp1, tmp2;
	void* retval;
	pthread_t thread1, thread2;
	char* message1 = "thread1";
	char* message2 = "thread2";

	int ret_thrd1, ret_thrd2;

	ret_thrd1 = pthread_create(&thread1, NULL, (void *)&print_message, (void *)message1);
	ret_thrd2 = pthread_create(&thread2, NULL, (void *)&print_message, (void *)message2);

	if(ret_thrd1 != 0) {
		printf("create thread1 fail\n");
	}
	else {
		printf("create thread1 succeed\n");
	}

	if(ret_thrd2 != 0) {
		printf("create thread2 fail\n");
	}
	else {
		printf("create thread2 succeed\n");
	}

	tmp1 = pthread_join(thread1, &retval);
	printf("thread1 return value(retval) is %d\n", (int)retval);
	printf("thread1 return value(tmp) is %d\n", tmp1);
	assert(tmp1 == 0);
	printf("thread1 end\n");

	tmp2 = pthread_join(thread2, &retval);
	printf("thread2 return value(retval) is %d\n", (int)retval);
	printf("thread2 return value(tmp) is %d\n", tmp2);
	assert(tmp2 == 0);
	printf("thread2 end\n");

	return 0;
}