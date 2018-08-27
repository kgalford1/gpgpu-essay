#define N 1000000


__global__
void add(float *a, float *b) {
	int i = threadIdx.x + blockIdx.x * blockDim.x;
	a[i] = 31.0f;
	b[i] = 0.43f;
	a[i] = a[i] + b[i];
}


int main() {
	float *a, *b;
	cudaMallocManaged(&a, N * sizeof(float));
	cudaMallocManaged(&b, N * sizeof(float));

	for(int j = 0; j < 10; j ++)
	add<<<N/256, 256>>>(a, b);
	cudaDeviceSynchronize();

	cudaFree(a);
	cudaFree(b);
	return 0;
}

