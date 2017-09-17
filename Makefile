make: libtest.dylib dynamiclink hotswap

dylib: libtest.dylib

libtest.dylib: libtest.o
	clang -o libtest.dylib -dynamiclib -std=gnu99 -fvisibility=hidden libtest.o

libtest.o: libtest.c
	clang -o libtest.o -c libtest.c

dynamiclink: dynamiclink.o
	clang -o dynamiclink -ltest dynamiclink.o -L./

dynamiclink.o: dynamiclink.c
	clang -o dynamiclink.o -c dynamiclink.c

hotswap: hotswap.o
	clang -o hotswap hotswap.o

hotswap.o: hotswap.c
	clang -o hotswap.o -c hotswap.c

clean:
	rm -f hotswap
	rm -f dynamiclink
	rm -f libtest.dylib
	rm -f *.o

