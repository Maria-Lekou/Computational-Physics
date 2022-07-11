#include <stdio.h>
#include <math.h>
#include <omp.h>
#include <stdlib.h>
//Integration of function using Simpson rule


//Function that I want to integrate
double function(double x){
	double f;
	f=x*exp(2*x);
	return f;
}

int main(){
	
int i,
    n=100000000;
double
	xstart=0,
	xend=3;
double h,
	Se=0,
	So=0,
	sum;
double *x, *S;
 
 
 h=(double)(xend-xstart)/n;  //step of integration
 
 //Allocate memory
 x=(double *)malloc( ((n+1)*sizeof(double)));
 S=(double *)malloc( ((n+1)*sizeof(double)));
 
 
 x[0]=0;
 x[n]=3;
 
 for(i=1;i<n;i++)
 {
 	x[i]=x[i-1]+h;
 }

//Set number of threads
omp_set_dynamic(0);     // Explicitly disable dynamic teams
omp_set_num_threads(4);
int nThreads;
 
 //Start timing
 double tstart=omp_get_wtime();
 #pragma omp parallel
 {
 #pragma omp for private(i)
 for(i=0;i<=n;i++)
 {
 	S[i]=function(x[i]);
 }
 
 #pragma omp for private(i) reduction(+:Se)
 for(i=1;i<n;i=i+2)
{
	Se=Se+S[i];
}	

 #pragma omp for private(i) reduction(+:So)
for(i=2;i<n;i=i+2)
{
	So=So+S[i];
}
nThreads=omp_get_num_threads();
}
 //End timing
 double tend=omp_get_wtime();

sum=(h/3)*(S[0]+4*Se+2*So+S[n]);
printf("Number of threads used: %d\n",nThreads);
printf("Solution of integral is %f\n",sum);
printf("executed in %f seconds",tend-tstart);
	

	
	
	
	return 0;
}
