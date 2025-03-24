/*
Develop a D program that allows a user to securely store and retrieve text using Caesar cipher encryption. Your program should:

1. Offer a menu with options to view file contents or change file contents
2. When viewing, read the encrypted content from the file and decrypt it before displaying
3. When changing content, encrypt the new text before writing it to the file
4. Use Caesar cipher for encryption and decryption with a fixed key value
5. Implement proper file handling with error checking

*/

import std.utf;
import std.stdio;
import std.file;
import std.string;
import std.array;

void readEncryptedFile(int key) {
  File file;
  void readFile() {
    auto filePath = "./outofpocketshit.txt";
    if (exists(filePath)) {
      file = File(filePath, "r");
    }
    else {
      writeln("no file to read dummy");
    }
  }

  readFile();
  auto lines = file.lines;
  foreach(string line ; lines) {
    // i need to decrypt this shit blyat
    // so fucking caeser
    foreach (ch ; line) {
      if(ch != '\n') {
        if(ch == ' ') { write(" ");}
        else {
        write(char(((((ch-'a'-key) + 26) % 26 ) + 'a')));
        }
      }
      else {
        writeln("");
      }
    }
  }
}

void writeToFile(int key, string buff) {
  File file;
  void openFile() {
    auto filePath = "./outofpocketshit.txt";
    if (exists(filePath)) {
      file = File(filePath, "w");
    }
    else {
      writeln("no file to write dummy");
      file = File(filePath, "w");
    }
  }

  openFile();
  foreach(ch; buff) {
    if(ch == ' ') {
      file.write(" ");
    } else {
      file.write(char((((ch - 'a' + key) % 26) + 'a')));
    }
  }
  
  // Add a newline at the end
  file.writeln();
  
  // Close the file
  file.close();

}

void main() {
  // menu first
  string a;
  string buff;
  writeln("Read file (r) or edit file (e)");
  a = readln().strip();
  switch (a) {
    case "r":
      readEncryptedFile(7);
      break;
    case "e":
      buff = readln().strip();
      writeToFile(7, buff);
      break;
    default:
      writeln("idiot");
      break;
  }
}
