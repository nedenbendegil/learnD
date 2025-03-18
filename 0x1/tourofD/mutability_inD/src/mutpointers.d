import std.stdio;
// did i tell you that i miss you?

void main() @trusted
{
    // immutable int*
    immutable int* p = new int(200);
    // immutable pointer to an immutable int?
    // p = null; this throws an error
    // *p = 3000; throws an error
    
    // immutable(int)* q
    immutable(int)* q = new int(5);
    q = null; // works without a problem
    // *q = 50; this throws an error
    // mutable pointer immutable value
    // TODO add the other later
    
}
