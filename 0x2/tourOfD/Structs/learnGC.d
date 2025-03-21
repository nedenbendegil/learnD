import std.stdio;
import core.memory;

class Box
{
  int value;

  this(int v)
  {
    this.value = v;
    writeln("Created box ", value);
  }

  ~this()
  {
    writeln("Destroyed box ", value);
  }
}

void main()
{
  // holy shit you have to invoke GC manually
  // boggers cuz i assumed it would jsut  do it whenever
  writeln("Slm basladik");
  auto box1 = new Box(1);
  writeln("checkpoint 1 == ");
  box1 = null;
  writeln("checkpoint 2 == ");
  GC.collect();
  writeln("checkpoint 3 == ");
  {
    auto box2 = new Box(2);
  }
  writeln("checkpoint 4 == ");
  GC.collect();
}
