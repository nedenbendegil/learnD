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
    
    int* immutable r = new int(110);
    // the pointer can not point to anywhere else
    // the int can not be changed
    r = null; // gives error
    *r = 10; // is OK

    immutable(int*) s = new int(424);
    // the pointher can not point to anywhere else
    // the int can be chagned
    s = null; // gives an error
    *s = 10; // ok

    // in short you can also write
    immutable ss = new int(505);
    // botht he pointer (ss) and the int created (*s) is immutable


    // MORE EXAMPLES BELOW

    immutable apple = new int(999);
    // apple = null NOT ALLOWED
    // *apple = 234234 NOT ALLOWED
    
    immutable(int*) orange = new int(223);
    orange = null; // OK
    // *orange = 124123 NOT OK

    int bbb = 5;
    int* immutable ahhh = &bbb;
    // ahhh = null NOT OK
    *ahhh = 1234;

    int yyy = 23;
    immutable (int*) ohno = &yyy;
    // ohno = null NOT OK
    *ohno = 32; // THIS IS OOK

    // AS YOU CAN SEE THE ABOVE TWO EXAMPLES ARE THE SAME
}
