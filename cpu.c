#include <stdio.h>
#include <time.h>
#define N 1000000

void add(float *a, float *b) {
	for(int i = 0; i < N; i++) {
		a[i] = 31.0f;
		b[i] = 0.43f;
		a[i] = a[i] + b[i];
	}
}

int main() {
	float a[N], b[N];

	clock_t start = clock();
	add(a, b);
	clock_t end = clock();

	double delta = (double)(end - start) / CLOCKS_PER_SEC * 1000;
	printf("%f\n", delta);
	return 0;
}
