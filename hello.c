#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <time.h>

/* return a uniform random value in the range 0..n-1 inclusive */
int
randRange(int n)
{
    int limit;
    int r;

    limit = RAND_MAX - (RAND_MAX % n);

    while((r = rand()) >= limit);

    return r % n;
}

int
main (void)
{

  srand(time(0));

  int height = 10000;
  int width = 10000;
  int current_width;
  int current_height;
  char tile[8] = "\u2B1C ";
//  char test[100] = "hello how are you";
  FILE *file;
  file = fopen("test2.html", "w");
   

  for (current_height = 0; current_height < height; ++current_height)
  {
    for (current_width = 0; current_width < width; ++current_width) 
    {
//      sprintf(test,"%d",randRange(10));
//      fputs(test, file);
      fputs(tile, file);
    }
    fputs("\n", file);
  }

  fclose(file);

  return 0;
}
