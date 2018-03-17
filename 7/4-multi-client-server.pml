chan request = [0] of { byte };
chan reply = [0] of { byte };

active [2] proctype Server() {
  byte client;
end:
  do
  :: request ? client ->
       printf("Client %d processed by server %d\n", client, _pid);
       reply ! _pid
  od
}

active [2] proctype Client () {
  byte server;
  request ! _pid;
  reply ? server;
  printf("Reply received from server %d by client %d\n", server, _pid)
}

/*

これだとレスポンスが別のクライアントに返ることがある

Client 2 processed by server 0
    Client 3 processed by server 1
        Reply received from server 1 by client 2
            Reply received from server 0 by client 3
*/
