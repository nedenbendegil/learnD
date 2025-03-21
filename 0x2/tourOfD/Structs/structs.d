import std.stdio;

// you can create your own datastructure here

struct Person
{
  int age;
  int height;
  int weight;
}

void main()
{
  auto bb = Person(10, 142, 32);
  auto t = bb; // COPY BY VALUE, not reference

  
}
