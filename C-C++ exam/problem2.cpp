#include <iostream>
#include "Experiment.h"
//Name: Maria Lekou

using namespace std;

int main(){
	int i,N;
	N=10;
	Experiment exp(N);
	
	for(i=0;i<5;i++)
	{
		printf("Position of particle with steps=%d is %d\n",N,exp.run(N));
		
		N=N*10;
	}
	
	
	return 0;
}
