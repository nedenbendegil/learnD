import std.stdio;

void main()
{
  int* p = new int[10];
  int* q = p + 6;
  // Memory positions:  0   1   2   3   4   5   6   7   8   9
  //                   [p] [_] [_] [_] [_] [_] [q] [_] [_] [_]

  // but you can not do sth like q = p + 11 (OUT OF BOUND)
  // or you can not do sth like q = p-1 (OUT OF BOUND)
}
