import core.sync.mutex;
import core.atomic;

class Singleton {
    private static shared Singleton instance;
    private static Mutex mutex;
    
    shared static this() {
        mutex = new Mutex();
    }
    
    private this() {
    }
    
    static Singleton getInstance() {
        if (atomicLoad(instance) is null) {
            synchronized(mutex) {
                if (instance is null) {
                    instance = cast(shared)new Singleton();
                }
            }
        }
        return cast()atomicLoad(instance);
    }
    
    void doSomething() {
    }
}
