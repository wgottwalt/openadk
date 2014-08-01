# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

all: cpio

SRCS:=		ib_open.c \
		ib_close.c \
		ib_read.c \
		ib_alloc.c \
		ib_free.c \
		ib_getlin.c \
		sfile.c \
		gmatch.c \
		sigset.c \
		memalign.c \
		version.c \
		blast.c \
		crc32.c \
		expand.c \
		explode.c \
		flags.c \
		inflate.c \
		unshrink.c \
		nonpax.c \
		cpio.c

cpio: ${SRCS}
	$(CC) $(CFLAGS) -D_GNU_SOURCE -I. -o $@ $^
