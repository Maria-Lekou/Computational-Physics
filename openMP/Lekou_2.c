#include<stdio.h>
#include<stdlib.h>
#include<omp.h>


#define ROWS 1500
#define COLUMNS 1500

double ** array2D (int nRows, int nColumns);

int main() {

  int i, j, k;
  double **a, **b, **c;

  a = array2D(ROWS, COLUMNS);
  b = array2D(ROWS, COLUMNS);
  c = array2D(ROWS, COLUMNS);
  
  omp_set_dynamic(0);     // Explicitly disable dynamic teams
  omp_set_num_threads(1);

  //Start timing
  double start_time = omp_get_wtime(); 
  
#pragma omp parallel for private(i,j)
  for (i=0; i<ROWS; i++) {
    for (j=0; j<COLUMNS; j++) {
      a[i][j] = 3.0;
      b[i][j] = 2.0;
      c[i][j] = 0.0;
    }
  }
  
  
  if (ROWS < 10) 
  {
    for (i=0; i<ROWS; i++) {
      for (j=0; j<COLUMNS; j++) {
        printf("%f ", a[i][j]);
      }
      printf("\n");
    }

    for (i=0; i<ROWS; i++) {
      for (j=0; j<COLUMNS; j++) {
        printf("%f ", b[i][j]);
      }
      printf("\n");
    }

    for (i=0; i<ROWS; i++) {
      for (j=0; j<COLUMNS; j++) {
        printf("%f ", c[i][j]);
      }
      printf("\n");
    }
    printf("\n");
  }

  
#pragma omp parallel for  shared(a,b,c) private(i,j,k) default(none)
  for (i=0; i<ROWS; i++) {
    for (j=0; j<COLUMNS; j++) {
      for (k=0; k<COLUMNS; k++) {
        c[i][j]+= a[i][k] * b[k][j];
      }
    }
  }

  /* Stop Timing */
  double end_time = omp_get_wtime();

  printf("Time: %f seconds\n\n", end_time - start_time);

  if (ROWS < 10)
  {
    for (i=0; i<ROWS; i++) {
      for (j=0; j<COLUMNS; j++) {
        printf("%f ", c[i][j]);
      }
      printf("\n");
    }
  }

  /* Free Memory (Arrays) */
  free(a[0]); 
  free(a);
  free(b[0]); 
  free(b);
  free(c[0]); 
  free(c);
  return 0;
}


/* 
  Dynamically Allocates 2D Array  (Contiguous in Memory) 
*/
double ** array2D (int nRows, int nColumns) {
  
  int i;
  double ** array;

  /* Create rows (equal to gridPoints) */
  array = (double**)malloc(nRows*sizeof(double*));
  if (array == NULL) {
    printf("\n\n ERROR: Out of memory for output array! Exiting...\n\n");
    exit(-1);
  }

  /* Allocate enough memory for whole 2D array */
  array[0] = (double*)malloc(nRows*nColumns*sizeof(double));
  if (array[0] == NULL) {
    printf("\n\n ERROR: Out of memory for output array! Exiting...\n\n");
    exit(-1);
  }
  
  /* Point to individual rows */
  for (i=1;i<nRows;i++) {
    array[i] = array[0] + i*nColumns; 
  }

  return array;
}
