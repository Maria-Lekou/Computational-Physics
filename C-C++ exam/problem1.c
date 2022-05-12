#include <stdio.h>
#include <stdlib.h>
#include <time.h>

//Name: Maria Lekou


int M,N;

//For 2-D matrix
double **ddvector(int size1,int size2)
{
	double **v;
    int i;
    v = (double**) malloc(size1*sizeof(double*));
    for (i = 0; i < size1; i++)
    {
	v[i] = (double*) malloc(size2*sizeof(double));
    }  
	return v;
}

//For 1-D matrix
double *dvector(int size)
{
	double *v;
	v=(double *)malloc( ((size)*sizeof(double)));
	return v;
}


//Generate random values to 2-D array
void random(double **pinakas)
{
	int i,j;
	for(i=0;i<M;i++)
	{
		for(j=0;j<N;j++)
		{
			pinakas[i][j]=1001+(float)(rand()/(float)RAND_MAX)* 200;
		}
	}
	
}


//Merge sort of arrays
void merge(double *arr, int l, int m, int r)
{
	int i, j, k;
	int n1=m-l+1;
	int n2=r-m;
	double ar1[n1], ar2[n2];
	for (i=0;i<n1;i++)
		ar1[i]=arr[l+i];
	for (j=0;j<n2;j++)
		ar2[j]=arr[m+1+j];
	i=0; 
	j=0; 
	k=l; 
	while (i<n1&&j<n2) {
		if (ar1[i]<= ar2[j]) {
			arr[k]=ar1[i];
			i++;
		}
		else {
			arr[k]=ar2[j];
			j++;
		}
		k++;
	}
	while (i < n1) {
		arr[k]=ar1[i];
		i++;
		k++;
	}
	while (j<n2) {
		arr[k]=ar2[j];
		j++;
		k++;
	}
}


void mergeSort(double *arr,int l,int r)
{
	int m;
	if (l<r) {
		m=l+(r-l)/2;
		mergeSort(arr,l,m);
		mergeSort(arr,m+1,r);
		merge(arr,l,m,r);
	}
	else
	{
		return;
	}
}


int main(){
	int i,j,k;
	
	double **matrix,**sortmatrix;
	double *secmatr,*finalmatrix;
	
	time_t t;
	srand((unsigned)time(&t));
	
	printf("Enter the size of matrix (M,N)\n");
	scanf("%d %d",&M,&N);
	
	matrix=ddvector(M,N);
	sortmatrix=ddvector(M,N);
	secmatr=dvector(M);
	finalmatrix=dvector(N);
	
	//Random numbers between 1001.0-1201.0 for matrix
	random(matrix);
	
	printf("NON sorted array:\n");
    for(i=0;i<M;i++)
	{
		for(j=0;j<N;j++)
		{
			printf("%.1f   ",matrix[i][j]);
		}
		printf("\n");
	}
	
	
	//xrhsimopoiw 2 vohthitikous pinakes gia na to kanw sort
	for(j=0;j<N;j++)
	{
		for(i=0;i<M;i++)
		{
		secmatr[i]=matrix[i][j];	
		}

	mergeSort(secmatr, 0, M- 1);
	for(k=0;k<M;k++)
	{
		sortmatrix[k][j]=secmatr[k];
	}

	}
	
	printf("Sorted array: \n");
    for(i=0;i<M;i++)
	{
		for(j=0;j<N;j++)
		{
			printf("%.1f   ",sortmatrix[i][j]);
		}
		printf("\n");
	}
	
	printf("Line with the smallest numbers of each column:\n");
	double min,max;
	for(i=0;i<N;i++)
	{
		min=1201;
		for(j=0;j<M;j++)
		{
			if(sortmatrix[j][i]<min)
			{
				min=sortmatrix[j][i];
			}
		}
		printf("%.1f  ",min);
		finalmatrix[i]=min;
	}
	
	mergeSort(finalmatrix, 0, N- 1);
	max=finalmatrix[N-1];
	printf("\nMax number of line with smallest numbers: %.1f\n",max);

     

	return 0;
}
