class Obj {
  private static Obj instance;

  private this() {
    import std.stdio : writeln;
    writeln("Instance created");
  }
  
  static Obj getInstance() {
    if(instance is null) { instance = new Obj(); }
    return instance;
  }
  
  void doSth() {
    import std.stdio : writeln;
    writeln("hello");
  }
}

void main() {
  auto s1 = Obj.getInstance();
  s1.doSth();
  auto s2 = Obj.getInstance();

}
