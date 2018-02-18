#define mutex (critical <= 1)

bool wantP = false, wantQ = false;
byte critical = 0;

active proctype P() {
  do
  :: wantP = true;
     !wantQ;
     critical++;
     /* ここが保護領域 */
     critical--;
     wantP = false
  od
}

active proctype Q() {
  do
  :: wantQ = true;
     !wantP;
     critical++;
     /* ここが保護領域 */
     critical--;
     wantQ = false
  od
}
