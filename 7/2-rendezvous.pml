mtype { red, yellow, green }

chan ch = [0] of { mtype, byte, bool }

active proctype Sender() {
  ch ! red, 20, false;
  printf("Sent message\n")
}

active proctype Receiver() {
  mtype color;
  byte time;
  bool flush;
  ch ? color, time, flush;
  printf("Received message %e, %d, %d\n",
         color, time, flush)
}
