#!/usr/bin/env make

# References
# https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_makefiles.html#C
# specifically section titled:
#	Another makefile (using makedepend and more advanced make syntax)

# default build in CC:
# CC -> /usr/bin/cc -> /etc/alternatives/cc -> /usr/bin/gcc

# .SUFFIXES: .o .c
# CC = gcc
# implicit rules
#.c.o:
#	$(CC) $(CFLAGS) -o $<

CFLAGS  = -O -Wall -m64 -I.
LDFLAGS = -m64
SRCS    = gcd.c
OBJS    = $(SRCS:.c=.o)
TGTS    = $(patsubst %.c, %, $(SRCS))

.PHONY: all
all: cleanall lint $(OBJS) $(TGTS)

.PHONY: lint
lint:	$(SRCS) $(SRCS:.c=.h)
	@splint *.c *.h
	@astyle --style=kr --suffix=~ *.c *.h

.PHONY: clean
clean:
	@$(RM) *~ $(OBJS)

.PHONY: cleanall
cleanall: clean
	@$(RM) *~ $(TGTS)
