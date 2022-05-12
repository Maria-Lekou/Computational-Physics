#include <iostream>
#include <time.h>
#include <stdlib.h>
//Name: Maria Lekou


using namespace std;

class Particle{
	private:
		int x;
	public:
		Particle(){
		}
		Particle(int thesi){
			x=thesi;
			thesi=0;
		}
		
		int getPosition();
		void moveRight();
		void moveLeft();
};

void Particle::moveRight(){
	x=x+1;
}
void Particle::moveLeft(){
	x=x-1;
}
int Particle::getPosition()
{
	return x;
}

