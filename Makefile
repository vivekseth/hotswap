make: libtest.dylib hardlink softlink

dylib: libtest.dylib

libtest.dylib: libtest.o
	clang -o libtest.dylib -dynamiclib -std=gnu99 -fvisibility=hidden libtest.o

libtest.o: libtest.c
	clang -o libtest.o -c libtest.c

hardlink: hardlink.o
	clang -o hardlink -ltest hardlink.o -L./

hardlink.o: hardlink.c
	clang -o hardlink.o -c hardlink.c

softlink: softlink.o
	clang -o softlink softlink.o

softlink.o: softlink.c
	clang -o softlink.o -c softlink.c

clean:
	rm -f softlink
	rm -f hardlink
	rm -f libtest.dylib
	rm -f *.o

