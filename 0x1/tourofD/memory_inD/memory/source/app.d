import std.stdio;

void safeFun() @safe
{
    writeln("Hello hello");
    // allocating memory with GC
    int* p = new int;
}

void unsafeFun() @trusted
{
    int* p = new int;
    int* f = p + 5;
}

void main() @safe
{
    // if this was a safe block and unsafe was not trusted you would get error
    safeFun();
    unsafeFun();
}
