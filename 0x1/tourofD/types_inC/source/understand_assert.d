void divideNumber(int a, int b)
{
	assert(b != 0, "Do not divide by zero.");
	int result = a/b;
}

void processItem(int type)
{	
	import std.stdio;
	writeln("DO NOT CALL ME WITH 3");
	switch(type) {
		case 1:
		  writeln("This is an edible product");
		  break;
		case 2:
		  writeln("This is a wearable product");
		  break;
		case 3:
		  assert(0, "You should have never ever entered this one :)");
		default:
		  writeln("Idk what the hell that is");
	}
}
