import std.stdio;

void foo(char[] s)
{
    writeln(s);
}

void main()
{
    string d = "testtest";
    foo(d); // THIS IS NOT ALLOWED THIS IS NOT ALLOWED
    // bcs the string is immutable by def and the foo treats it as mutable
    // you would be able to manipulate the char array `s` but not the immutable one
    foo(d.dup); // creates mutable copy
}
