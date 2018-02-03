CFLAGS = -Wall -g

all: eval super

LIBS=-lm

eval: eval.o
	$(CC) -o $@ $< $(LIBS)

super: super.o
	$(CC) -o $@ $<

clean:
	rm -rf *.o *~ eval super

fresh: clean all

