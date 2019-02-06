#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int* x = malloc(10 * sizeof(int));
	printf("%ld\n", sizeof(x));
	int y[10];
	printf("%ld\n", sizeof(y));
	free(x);
	return 0;
}