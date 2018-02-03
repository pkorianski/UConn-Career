CFLAGS = 

all: fibonacci collatz

fibonacci: fibonacci.o
	$(CC) -o $@ $<

collatz: collatz.o
	$(CC) -o $@ $<

clean:
	rm -rf *.o *~ fibonacci collatz

fresh: clean all
