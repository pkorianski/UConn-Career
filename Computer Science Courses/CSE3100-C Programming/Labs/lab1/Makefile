CFLAGS = 

all: lab1-for lab1-while

lab1-for: lab1-for.o
	$(CC) -o $@ $<

lab1-while: lab1-while.o
	$(CC) -o $@ $<

clean:
	rm -rf *.o *~ lab1-for lab1-while

fresh: clean all

