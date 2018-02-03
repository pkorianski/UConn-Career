Patrick Korianski- CSE3100 Lab #4

Explain the inefficiency that you have identified in filebug.c and how you have fixed it.

1) When running the tools like gprof, valgrind, and cg_annotate, I noticed that the line with
   fflush was hitting hit the most out of any of the other lines of code.

2) I moved the fflush call outside the for loop and it speed up the time of my program and was hit 
   a much smaller amount of times which had made this program more efficient. 


