import std.stdio;
void funPointers()
{
	int a = 5;
	int* b = &a; // &a means address of a
	writeln(&a); // address of a
	writeln(b); // again, b which contains the address of a
	writeln(*b); // prints 5
	writeln(&b); // a different address where b is stored at
	writeln(*&b); // cancels each other
	writeln(**&b); // *b = 5

}
