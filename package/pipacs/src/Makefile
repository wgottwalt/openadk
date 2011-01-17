CPPFLAGS?=
CFLAGS?=
LDFLAGS?=
EXTRA_CFLAGS := -c -I.
PIPACS_OBJS := pipacs.o parser.o

all: pipacs

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(EXTRA_CFLAGS) -o $@ $^

pipacs: $(PIPACS_OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -f *.o *.so pipacs
