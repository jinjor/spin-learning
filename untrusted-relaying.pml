#include "for.h"
byte input, output;

active proctype Source() {
  for (i, 1, 10)
    input == 0; /* Wait until empty */
    input = i
  rof (i)
}

active proctype Relay() {
  do
  :: atomic {
       input != 0;
       output == 0;
       if
       :: output = input
       :: skip /* Drop input data */
       fi
  }
  input = 0
  od
}

active proctype Destination() {
  do
  :: output != 0 /* Wait until full */
     printf("Output = %d\n", output);
     output = 0
  od
}
