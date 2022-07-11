#include<stdio.h>
#include<stdlib.h>
#include<omp.h>
#include<math.h>

int main()
{
	
	int M=300,
	    N=300,
	    i,j,p,r;
	double k=0.8,m,
		xstart=0,
	    xend=2*M_PI,
	    ystart=0,
	    yend=2*M_PI,
	    tstart=0,
	    tend=2*M_PI,
	    dx=(xend-xstart)/(N-1),
	    dy=(yend-ystart)/(M-1),
	    dt=0.8*pow(dx,2)/(4*k);
	double *x, *y, *t, **uold, **unew, *u;
	
	//Allocate memory
	uold=(double**)malloc(N*sizeof(double*));
	unew=(double**)malloc(N*sizeof(double*));

	for(i=0; i<N; i++)
	{
		uold[i]=(double*)malloc(M*sizeof(double));
		unew[i]=(double*)malloc(M*sizeof(double));
	}
	
	x=(double*)malloc(N*sizeof(double));
	y=(double*)malloc(M*sizeof(double));
	
	double fTimeStart,fTimeEnd;
	//Set number of threads for comparison
	omp_set_dynamic(0);     
    omp_set_num_threads(3);
   
	//Start timing
	fTimeStart = omp_get_wtime();
	#pragma omp parallel for private(i) 
	for(i=0; i<N; i++)
	{
		x[i]=xstart+i*dx;
	}
	
	#pragma omp parallel for private(i) 
	for(i=0; i<M; i++)
	{
		y[i]=ystart+i*dy;
	}

	//initial conditions
	#pragma omp parallel for collapse(2) private(i,j) 
	for(i=0;i<N;i++)
	{
		for(j=0;j<M;j++)
		{
			uold[i][j]=sin(x[i])*sin(y[j]/2);
			unew[i][j]=sin(x[i])*sin(y[j]/2);
		}
	}
        
    //boundary conditions
	#pragma omp parallel for collapse(2) private(i,j) 
    for(i=1;i<N-1;i++)
	{
		for(j=1;j<M-1;j++)
		{
         			
			unew[0][j]=0;
			unew[N-1][j]=0;
			unew[i][0]=0;
			unew[i][N-1]=0;
			uold[0][j]=0;
			uold[N-1][j]=0;
			uold[i][0]=0;
			uold[i][N-1]=0;
}}
     
for(m=0+dt;m<=tend;m+=dt)
{
	#pragma omp parallel for collapse(2) private(i,j) 
	for(i=1;i<N-1;i++)
	{
		for(j=1;j<M-1;j++)
		{
			unew[i][j]=uold[i][j]+k*dt*((uold[i+1][j]-2*uold[i][j]+uold[i-1][j])/(pow(dx,2))+(uold[i][j+1]-2*uold[i][j]+uold[i][j-1])/(pow(dy,2)));
			
		}

	}
	
       #pragma omp parallel for collapse(2) private(p,r) 
       for(p=0;p<N;p++)
          {for(r=0;r<M;r++) 
             {uold[p][r] = unew[p][r];}
	    	}
}

//For convergence
//printf("h=%f  t=%f  dt=%f  x=y=%f   u(N/4,M/4)=%.15f ",dx,m-dt,dt, x[N/4],unew[N/4][M/4]);

fTimeEnd = omp_get_wtime();
printf("time is= %.5f\n", fTimeEnd - fTimeStart);
	return 0;
}
