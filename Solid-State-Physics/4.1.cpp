#include <iostream>
#include <vector>
#include <stdlib.h>     
#include <time.h> 
#include <fstream>

using namespace std;



int main()
{
	ofstream MyFile ("C:/maria/ask4.txt");
	srand (4400);
	int i,j,l,N=10000,t=10, k[N],Pk[N],s;
	float p=1./6,r;
	float avg[N];
	//Initialization
	
	for(l=0;l<t;l++)
	{
	   for(i=0;i<N;i++)
	   {
	    k[i]=0;
	   }
	
	   for(i=0;i<N;i++)
	   {
		for(j=i+1;j<N;j++)
		{
			r=(float)rand()/RAND_MAX;
			if(r<=p)
			{
				k[i]+=1;
				k[j]+=1;
			}
		}
   	   }
   	   for(s=0;s<N;s++)
   	   {
   	   	Pk[k[s]]+=1;
	   }
   	   
   	}
   	for(i=0;i<N;i++)
   	{
   		avg[i]=Pk[i]/t;
   		MyFile<<avg[i]<<endl;
	}
	
	MyFile.close();
}
