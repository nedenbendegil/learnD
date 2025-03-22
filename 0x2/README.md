# Second unit and shit

<p align="center">
    <img src="img/w2.png" style="width: 60%; height: auto;"> </img>
</p>

<p><i> So yeah, 0x2 is like a mental classification. I will just switch to another dir when i feel like i made some progress. Uhh, don't expect good progress </i></p>

---

## This weeks contents:

### `[1]` Garbage collection
Uhh so you have to call the garbage collecto to wakeup manually. On the `learnGC.d` file you can understand how it works.

### `[2]` Struct
Structs are all copy by value, not reference  
You can also use this(...) to init the struct  
private funcs can not be called outside in structs  
when you define const you can not edit the members  
static can only get static but can be called without initializing object  
static can call other static functions  
when you say auto p = new Person(..) it is created on STACK  
but when you use the `new` it is created on HEAP  

### `[3]` Thread safety and singleton patterns in D

firstly lets start with `singleton.d`  
so what a singleton pattern is that your class has a default instance,  
and that is the only instance it strictls has. and it is static.  
for example in the code you call s1 and s2 for the class, they are the same instance.  
you have a private constructor.  
and you create an instance if you havent already, this is thread *unsafe*  
so we can do it another way  

go to `wtf.d`  
you have a class, and you use mutex  
mutex makes sure that ONLY ONE thread gets into a function  
and the shared static this runs whenever the class is loaded  
it is run above anything, above main and all  
so we make sure to create mutex first  
if not the get instance method would not be able to use synchronized  

this can still be improved though.  

`doubleLock.d` uses atomicLoad()  
this means that read of the instance (whether null or not) is thread safe  
this does not solve anything, since if thread 1 reads and sees null and before creating another stuff  
thread 2 might also read etc etc so we still need mutex  
then why the hell do we use atomicLoad  
simply it is good for cashing, prevents resources from trying to use mutex, more energy efficient  
caching problems might cause the program to see instance null in multi core cpu's  

there is also this shit called module level singleton  

go to `moduleLevel.d`,  

you create a class private constructor and shit  
but as long as they are on the same file or package you can call private functions  

__gshared means this shit is shared amongst threads but without automatic thread safety  

then you get a shared constructor and generate an instance  
and return the instance when needed.  


This approach works because D guarantees that module constructors run during program initialization, before any other code (including main()). Since there are no threads running during this initialization, there's no possibility of race conditions.  
After initialization, all threads simply access the already-created instance. There's no need for locks or atomic operations because:  

The instance already exists  
The reference to it never changes  
Reading a reference is an atomic operation on most platforms  

there is also this mixin templates and shit on 'mixinTemp.d`  

uhh so this template first line  

private static typeof(this) instance_;  

this means that whatevver type of class calls me, paste its type and create an instance of that  
also create a function using typeof that class, for creating its own instance (actually initializing i guess, since it was created alrd)  

so yeah that is it pretty much