int n = 0;
bool flag = false;

active proctype P() {
  do
  :: flag -> break
  :: else -> n = 1 - n
  od
}

active proctype Q() {
  flag = true
}

/*
Pが必ず停止するためには、Qが必ず実行されなければならない。
つまり弱公平である必要がある。
*/
