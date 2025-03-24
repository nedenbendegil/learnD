import std.stdio;

void main() {
    int[] originalArray = [10, 20, 30, 40, 50];
    
    int[] newSlice = originalArray[1 .. 4];
    
    assert(newSlice.length == 3);
    
    newSlice[0] = 99;
    assert(originalArray[1] == 99); // originalArray is now [10, 99, 30, 40, 50]
    
    writeln("Original array: ", originalArray);
    writeln("Slice: ", newSlice);
}
