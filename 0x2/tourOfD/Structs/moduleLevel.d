class Singleton {
    private this() { }
    
    void doSomething() { }
    
}

__gshared Singleton instance;

shared static this() {
    instance = new Singleton();
}

Singleton getInstance() {
    return instance;
}
