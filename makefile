# hellomake: hellomake.c hellofunc.c
# 	gcc -o hellomake.c hellofunc.c -I.

#makefile 2
# CC = gcc
# CFLAGS = -I.
# hellomake: hellomake.o hellofunc.o
# 	$(CC) -o hellomake hellomake.o hellofunc.o


#makefile 3
CC = gcc
CFLAGS = -I.
DEPS = hellomake.h
# This addition first creates the macro DEPS, which is the set of .h files on which the .c files depend. 
# Then we define a rule that applies to all files ending in the .o suffix. 
# The rule says that the .o file depends upon the .c version of the file and the .h files included in the DEPS macro. 
# The rule then says that to generate the .o file, make needs to compile the .c file using the compiler defined in the CC macro. 
# The -c flag says to generate the object file, the -o $@ says to put the output of the compilation in the file named on the left side of the :, the $< is the first item in the dependencies list, and the CFLAGS macro is defined as above.


%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: hellomake.o hellofunc.o
	$(CC) -o hellomake hellomake.o hellofunc.o