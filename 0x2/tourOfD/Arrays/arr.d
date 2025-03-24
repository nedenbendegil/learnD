import std.stdio;
void main() {
  int[] a = [];
  int[] b = new int[10]; // must give an int
  writeln(b.length);
  int[] c = [1, 2, 3];
  c.length = 5;
  assert(c == [1, 2, 3, 0, 0]);
  int[] copy = c.dup;
  int[] arr = [10, 20, 30, 40, 50];
  assert(arr[0] == 10);        // first element
  assert(arr[$ - 1] == 50);    // last element $ symbol
  assert(arr[$ - 2] == 40);
  int[] d = [1, 2];
  int[] e = [3, 4];
  int[] f = d ~ e;
  assert(f == [1, 2, 3, 4]);
  int[] g = [1, 2];
  g ~= 3;
  assert(g == [1, 2, 3]);
  g ~= [4, 5];
  assert(g == [1, 2, 3, 4, 5]);
  int[] h = [1, 2, 3];
  int[] i = [4, 5, 6];
  int[] j = new int[h.length];
  j[] = h[] + i[];
  assert(j == [5, 7, 9]);
  h[] *= 2;
  assert(h == [2, 4, 6]);
  int[] values = [30, 40, 50];
  values[] %= 26;
  assert(values == [4, 14, 24]);
  int[] k = [1, 2, 3];
  // This would cause a RangeError at runtime
  // int value = k[10];  // Index out of bounds
  // Bounds checking can be disabled with -boundscheck=off compiler flag
  // for performance, but at the cost of safety
  int[] l = [1, 2, 3, 4, 5];
  int[] slice = l[1..4];  // Elements from index 1 to 3
  assert(slice == [2, 3, 4]);
  // Slices are views, so modifying the slice affects the original
  slice[0] = 99;
  assert(l == [1, 99, 3, 4, 5]);
}
