ifndef CFLAGS
CFLAGS = -O2 -g -I ../src
endif
LIBS=-lnl-3 -lnl-genl-3

all: swconfig

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

swconfig: cli.o swlib.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
