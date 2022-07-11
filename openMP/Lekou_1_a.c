#include<stdio.h>
#include<stdlib.h>
#include<omp.h>
#include<math.h>

int main()
{
	FILE* heating;
	heating=fopen("C:/maria/parall1.txt","w");
	if(heating==NULL)
	{
		perror("Error\n");
		exit(1);
	}
	
	int M=50,
	    N=50,
	    i,j,p,r,s,b;
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
	
	//Set values for x,y
	for(i=0; i<N; i++)
	{
		x[i]=xstart+i*dx;
	}
	
	for(i=0; i<M; i++)
	{
		y[i]=ystart+i*dy;
	}
	
    
	//initial conditions
	for(i=0;i<N;i++)
	{
		for(j=0;j<M;j++)
		{
			uold[i][j]=sin(x[i])*sin(y[j]/2);
			unew[i][j]=sin(x[i])*sin(y[j]/2);
		}
	}
	
	//boundary conditions
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
    
    //Save initial values in a file
    for(s=0;s<N;s++)
       {
	    fprintf(heating,"%f  ",tstart);
		for(b=0;b<M;b++) 
         {
           fprintf(heating,"%f  ",unew[s][b]);
	     }
		 fprintf(heating,"\n");
         }
         
   
//m represents the steps in time
for(m=tstart+dt;m<=tend;m+=dt)
{
	for(i=1;i<N-1;i++)
	{
		for(j=1;j<M-1;j++)
		{
			unew[i][j]=uold[i][j]+k*dt*((uold[i+1][j]-2*uold[i][j]+uold[i-1][j])/(pow(dx,2))+(uold[i][j+1]-2*uold[i][j]+uold[i][j-1])/(pow(dy,2)));
			
		}

	}
	    //Save values of each time in a file
	    for(s=0;s<N;s++)
          {
          fprintf(heating,"%f   ",m);
		  for(b=0;b<M;b++) 
             {
              fprintf(heating,"%f  ",unew[s][b]);
			 }
			 fprintf(heating,"\n");
         }
         
       //set uold=unew for the next step
       for(p=0;p<N;p++)
          {for(r=0;r<M;r++) 
             {uold[p][r] = unew[p][r];}
	    	}
	    	
}

	fclose(heating);	
	return 0;
}
