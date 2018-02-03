CC=cc

#CFLAGS=-g
CFLAGS=-g -pg --coverage

LIBS=-lgcov

all: fib mat isort filebug

clean:
	rm -f fib mat isort filebug \
          *.o *.gcda *.gcno gmon.out *.gcov callgrind.out.* cachegrind.out.*

fresh: clean all

