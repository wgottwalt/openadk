SH = sh
SHOBJS = sash.o cmds.o cmd_uclinux.o ls.o hexdump.o df.o free.o \
	hostname.o date.o

SHUTDOWN = shutdown
SHUTDOWNOBJS = shutdown.o

REBOOT = reboot
REBOOTOBJS = reboot.o

SHOBJS += ps.o

LIBSASH = libsash/libsash.a

all: $(SH) $(SHUTDOWN) $(REBOOT)

$(SH): $(SHOBJS) $(LIBSASH)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(SHOBJS) $(LIBSASH) $(LDLIBS$(LDLIBS_$@))

$(SHUTDOWN): $(SHUTDOWNOBJS) $(LIBSASH)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(SHUTDOWNOBJS) $(LIBSASH) $(LDLIBS)

$(REBOOT): $(REBOOTOBJS) $(LIBSASH)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(REBOOTOBJS) $(LIBSASH) $(LDLIBS$(LDLIBS_$@))

dummy_target:

$(LIBSASH): dummy_target
	$(MAKE) -C libsash

clean:
	-rm -f $(SH) $(SHUTDOWN) $(REBOOT) *.elf *.gdb *.o
	$(MAKE) -C libsash clean
