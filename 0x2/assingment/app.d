/*
Create a D program that implements a simple user authentication system. Your program should:
1. Define a structure to store usernames and passwords
2. Open a file in read mode and load user data from it using fscanf
3. Display the number of registered users
4. Print the usernames and passwords loaded from the file
5. Create a menu with the following options:
   - Press 1 to add a new user (use append mode for the file)
   - Press 2 to log in with existing credentials
6. If option 1 is selected, prompt for and save new user credentials to the file
7. If option 2 is selected, compare the entered username and password with stored records using strcmp
8. Display an appropriate message based on the login result
*/
import std.utf;
import std.stdio;
import std.file;
import std.string;
import std.array;

struct pass {
  public char[] password;
}

struct user {
  public char[] username;
}

struct users {
  pass[] passwords = [];
  user[] usernames = [];
  File file;
  
  public void readFile() {
    import std.string : split, strip;
    auto filePath = "./creds.txt";
    
    if(exists(filePath)) {
      file = File(filePath, "r");
    } else {
      writeln("dosyayok haci.");
      file = File(filePath, "w");
      file.close();
      file = File(filePath, "r");
    }
    
    auto filelines = file.lines;
    int size = 0;
    
    foreach(string line; filelines) {
      auto parts = split(line, ";");
      if(parts.length >= 2) {
        user newUser;
        pass newPass;
        
        newUser.username = strip(parts[0]).dup;
        newPass.password = strip(parts[1]).dup;
        
        usernames ~= newUser;
        passwords ~= newPass;
        
        size++;
        writeln(line);
      }
    }
    
    writeln("There are total of ", size, " registered users");
    file.close(); 
  }
  
  public void printUsernames() {
    import std.stdio;
    writeln("Users:");
    for(int i = 0; i < usernames.length; i++) {
      writeln("Username: ", usernames[i].username, " ~ Password: ", passwords[i].password);
    }
  }
  
  public void appendUser(string aUsername, string aPassword) {
    file = File("./creds.txt", "a");
    file.writeln(aUsername, " ; ", aPassword);
    file.close();
    
    user newUser;
    newUser.username = aUsername.dup;
    usernames ~= newUser;
  
    pass newPass;
    newPass.password = aPassword.dup;
    passwords ~= newPass;
    
    writeln("User added successfully!");
  }
  
  public bool login(string loginUsername, string loginPassword) {
    import std.string : strip;
    
    loginUsername = loginUsername.strip();
    loginPassword = loginPassword.strip();
    
    for(int i = 0; i < usernames.length; i++) {
      string storedUsername = cast(string)usernames[i].username;
      string storedPassword = cast(string)passwords[i].password;
      
      if(storedUsername == loginUsername && storedPassword == loginPassword) {
        return true;
      }
    }
    
    return false; 
  }
}

void main() {
  users u1;
  u1.readFile();
  u1.printUsernames();
  
  bool running = true;
  while(running) {
    writeln("\nMenu:");
    writeln("1. Add a new user");
    writeln("2. Log in with existing credentials");
    writeln("3. Exit");
    write("Enter your choice: ");
    
    string choice = readln().strip();
    
    switch(choice) {
      case "1":
        write("Enter username: ");
        string username = readln().strip();
        write("Enter password: ");
        string password = readln().strip();
        u1.appendUser(username, password);
        break;
        
      case "2":
        write("Enter username: ");
        string username = readln().strip();
        write("Enter password: ");
        string password = readln().strip();
        
        if(u1.login(username, password)) {
          writeln("Login successful!");
        } else {
          writeln("Login failed. Invalid username or password.");
        }
        break;
        
      case "3":
        running = false;
        writeln("Goodbye!");
        break;
        
      default:
        writeln("Invalid choice. Please try again.");
    }
  }
}
