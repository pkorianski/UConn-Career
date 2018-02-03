Describe below all errors you have identified in bugs.c and 
corrected in bug_free.c

CSE3100: Lab3 Patrick Korianski

1) First, I changed the "make_copy" function to "void" since it was not returning a char character

2) Second, since in C there is a null value at the end of a char array, I added +1 to both lengths
   in lines 14 and 15.

3) Third, you needed to make the char 's' freed in which I added "free(s)"

4) Finally, I made the main() function return 0 since I was getting an error telling me it got to
   the end of the function without returning anything
