# Notes for this
<p align="center"> <img src="../imgs/0221e0ab-0ac0-4458-9488-5edcff7031eb.jpg"><p>
my first codes yey

## important

``[1]`` dub creates .exe and accepts only one main

``[2]`` if you wanna call a func from another file import sec.d as `import sec;`

``[3]`` if your imports are in the same dir as you are working you must import by only xxx.d name

``[4]`` if you have aa.d with func aa you must import it as aa : aa or it gives error

``[5]`` in d the basic types have always the same size regardless of platform but there is also the 'real' type that is used for high precision floating numbers that will have the most precision your platform / CPU allows

``[6]`` there is no difference between the the size of an integer if on 32bit or 64bit systems.

bool, byte, ubyte, char ---- 8 bit

short, ushort, wchar ----- 16 bit

int, uint, dchar ----- 32 bit

long, ulong ----- 64 bit

float 32 bit

double 64 bit 

real >= 64 bit

The prefix `u` denotes unsigned. `char` translates to UTF 8 characters, `wchar` is UTF16, `dchar` is UTF32

Conversation of variable types is allowed if precision is not lost,
however for double and float it is allowed to change interhcangeably.

A conversion to another type can be enforced by using cast(TYPE) myVar. But be careful. Cast might break your system and get you rekt.

Auto will determine the type of the var in compile time. But still, it will assign to sth such as int.

All data types have a `.init` which is the default value for vars, for ex 0 for int nan for floating points.

Integers and floats also have a ``.max`` value. Integers also have `.min` value. Floating point types have `.min_normal` which is defined to the smallest representable value that is not 0.

Floating points types also have `.nan` `.infinity` `.dig` (number of decimal digits of precisions) `.mant_dig` (number of bits in mantissa) and more.

'Every type also has a `.stringof` property that returns its name as a string.

In D, indexes usually have the alias type `size_t`, as it is a type that is LARGE ENOUGH to represent an offset into all addressable memory. That is `uint` for 32 bit and `ulong` for 64 bit systems.

`Assert expression`: `assert` is an expression which verifies conditions in debug mode and aborts with 'AssertionError' if it fails. `assert(0)` thus is used to mark unreachable code.



``[7]`` Garbage collector in D

D uses a garbage collector by default.

just look at the code in `memory_inD` to understand better.

``[8]`` Statical typing

D is a statically typed language, when you create a variable you can not change the type later.

This allows the compiler to prevetn some bugs from occuring. There are several type qualifiers in D but most commonly used are const and immutable.

``immutable``: when such an object is created it can never be changed again.

example:

immutable int err = 5; (or immutable err = 5 and int is assigned auto)

err = 5; WILL NOT COMPILE

another thing that you will notice is that you can not send an immutable obj to a mutable thing. such as notallowed.d in mutability in d folder


void malicious(char[] s) {
    s[0] = 'X';  // This would modify supposedly immutable data!
}

void main() {
    string immutableStr = "hello";
    malicious(immutableStr);  // If this were allowed, it would break immutability
}

------------------------------


const manipulation: see the constManipulation.d

see the mutpointers for more on immutable / mutable pointers 
