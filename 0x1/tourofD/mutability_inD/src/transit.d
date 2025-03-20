import std.stdio;

void main()
{
    string s = "hi";
    s ~= " there";
    // s[0] = 'a'; gives ERROR
    writeln(s);
}
