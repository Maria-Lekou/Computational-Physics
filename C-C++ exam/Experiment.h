#include <iostream>
#include <time.h>
#include <stdlib.h>
#include "Particle.h"
//Name: Maria Lekou


using namespace std;

class Experiment{
	private:
		Particle p;
	    int steps;
	public:
		Experiment(){
		}
		Experiment(int s){
			s=steps;
		}
	int run(int s);
};

int Experiment::run(int s){
	srand((unsigned)time(NULL));
	double r;
	int i;
	for(i=0;i<s;i++)
	{
		r=(float)(rand()/(float)RAND_MAX);
		if(r>0.5)
		{
			p.moveRight();
		}
		if(r<0.5)
		{
			p.moveLeft();
		}
	}
	return p.getPosition();
}
