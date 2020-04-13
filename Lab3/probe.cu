#include <stdio.h>
static void HandleError( cudaError_t err,
                         const char *file,
                         int line ) {
    if (err != cudaSuccess) {
        printf( "%s in %s at line %d\n", cudaGetErrorString( err ),
                file, line );
        exit( EXIT_FAILURE );
    }
}
#define HANDLE_ERROR( err ) (HandleError( err, __FILE__, __LINE__ ))

int main(int argc, char const *argv[])
{
	//Alibek Cholponbaev Assignment 3
	//code from the book

	//get  device count
	printf("Alibek's remote machine:\n")
	int count;
	HANDLE_ERROR(cudaGetDeviceCount(&count));
	printf("number of GPU devices: %d\n\n", count);

	//get device props
	cudaDeviceProp prop;
	for(int i = 0; i < count; i++) {
		HANDLE_ERROR(cudaGetDeviceProperties(&prop, i));

		//from the book (from your file)
		printf("\tName: %s\n", prop.name);
	    printf( "\tCompute capability: %d.%d\n", prop.major, prop.minor);
	    printf( "\tClock rate: %d\n", prop.clockRate );
	    printf( "\tDevice copy overlap: " );
	      if (prop.deviceOverlap)
	        printf( "Enabled\n" );
	      else
	        printf( "Disabled\n" );
	    printf( "\tKernel execition timeout: " );
	      if (prop.kernelExecTimeoutEnabled)
	        printf( "Enabled\n" );
	      else
	        printf( "Disabled\n" );
	    printf( "--- Memory Information for device %d ---\n", i );
	    printf("\tTotal global mem: %ld\n", prop.totalGlobalMem );
	    printf("\tTotal constant Mem: %ld\n", prop.totalConstMem );
	    printf("\tMax mem pitch: %ld\n", prop.memPitch );
	    printf( "\tTexture Alignment: %ld\n", prop.textureAlignment );
	    printf("\n");
	    printf( "\tMultiprocessor count: %d\n", prop.multiProcessorCount );
	    printf( "\tShared mem per processor: %ld\n", prop.sharedMemPerBlock );
	    printf( "\tRegisters per processor: %d\n", prop.regsPerBlock );
	    printf( "\tThreads in warp: %d\n", prop.warpSize );
	    printf( "\tMax threads per block: %d\n", prop.maxThreadsPerBlock );
	    printf( "\tMax block dimensions: (%d, %d, %d)\n",
	                  prop.maxThreadsDim[0],
	                  prop.maxThreadsDim[1],
	                  prop.maxThreadsDim[2]);
	    printf( "\tMax grid dimensions: (%d, %d, %d)\n",
	                  prop.maxGridSize[0],
	                  prop.maxGridSize[1],
	                  prop.maxGridSize[2]);
	    printf("\n");
	}
	printf("Please see my code for changes I made\n");
	return 0;
}
