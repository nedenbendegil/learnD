import std.stdio;

void foo(char[] s)
{
    writeln(s);
}

void main()
{
    string d = "testtest";
    foo(d); // THIS IS NOT ALLOWED THIS IS NOT ALLOWED
    foo(d.dup); // creates mutable copy
}
