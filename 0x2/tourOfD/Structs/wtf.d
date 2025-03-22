import core.sync.mutex;
import std.stdio;

class Singleton {
    private static Singleton instance;
    private static Mutex mutex;
    
    shared static this() {
        writeln("1. shared static this() is running automatically when class loads");
        mutex = new Mutex();
        writeln("2. Mutex has been created");
    }
    
    private this() {
        writeln("5. private this() is running because getInstance() is creating an instance");
    }
    
    static Singleton getInstance() {
        writeln("3. getInstance() has been called");
        synchronized(mutex) {
            writeln("4. Entered synchronized block using the mutex");
            if (instance is null) {
                instance = new Singleton();
            }
            writeln("6. Returning instance");
            return instance;
        }
    }
}

void main() {
    writeln("Program starting");
    
    
    writeln("About to call getInstance()");
    auto s = Singleton.getInstance();
    writeln("Got instance");
    
    auto s2 = Singleton.getInstance();
    writeln("Got second reference to same instance");
}
