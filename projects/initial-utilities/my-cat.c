#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
	int cFileNum = argc - 1;
	if(cFileNum == 0) {
		printf("there is no file\n");
		return 0;
	}
	int i;
	char* str;
	char buffer[80];
	for(i = 0; i < cFileNum; i++) {
		str = argv[i+1];
		FILE* fp = fopen(str, "r");
		if(fp == NULL) {
			printf("cannot open file\n");
			exit(1);
		}
		while(fgets(buffer, 80, fp) != NULL) {
			printf("%s", buffer);
		}
		fclose(fp);
	}
	return 0;
}