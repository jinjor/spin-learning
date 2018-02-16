/*
デッドロックを回避したが飢餓状態が起こる
*/

bool wantP = false, wantQ = false;

active proctype P() {
  do
  :: printf("Non critical section P\n");
     atomic {
       !wantQ;
       wantP = true
     }
     printf("Critical section P\n");
     wantP = false
  od
}

active proctype Q() {
  do
  :: printf("Non critical section Q\n");
     atomic {
       !wantP;
       wantQ = true
     }
     printf("Critical section Q\n");
     wantQ = false
  od
}
