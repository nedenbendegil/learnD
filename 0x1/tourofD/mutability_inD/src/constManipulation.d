void main() {
    // Create a mutable array
    int[] arr = [1, 2, 3];
    
    // Create a const reference to it
    const int[] constRef = arr;
    
    // This would fail - can't modify through const reference
    // constRef[0] = 10;  // Compilation error!
    
    // But we can modify through the original reference
    arr[0] = 10;
    
    import std.stdio;
    writeln(constRef);  // Prints [10, 2, 3]
}
