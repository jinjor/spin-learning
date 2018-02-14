byte n = 0;

active proctype P() {
  byte temp;
  d_step {
    temp = n + 1;
    n = temp;
  }
  printf("Process P, n = %d\n", n)
}

active proctype Q() {
  byte temp;
  d_step {
    temp = n + 1;
    n = temp;
  }
  printf("Process Q, n = %d\n", n)
}
