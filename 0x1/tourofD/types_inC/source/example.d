import std.stdio;

void types()
{
    // big numbers can be seperated with _ to enhance readibility
    int b = 7_000_000;
    short c = cast(short) b;
    uint d = b;
    int g;
    assert(g == 0); // will be ok bcs ints are 0 by default
    auto f = 3.1415f; // f denotes float


    // typeid(VAR) returns the type information of the expression
    writeln("type of f is: ", typeid(f));
    double pi = f;
    // for floating points down casting is also allowed
    float demoted = pi;

    // access to type properties

    assert(int.init == 0);
    assert(int.sizeof == 4);
    assert(bool.max == 1);
    writeln(int.min, " ", int.max);
    writeln(g.stringof); // int
}
