# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

install: ${BIN_DIR}/cpio

SRCS:=		src/ib_open.c \
		src/ib_close.c \
		src/ib_read.c \
		src/ib_alloc.c \
		src/ib_free.c \
		src/ib_getlin.c \
		src/sfile.c \
		src/gmatch.c \
		src/sigset.c \
		src/memalign.c \
		src/version.c \
		src/blast.c \
		src/crc32.c \
		src/expand.c \
		src/explode.c \
		src/flags.c \
		src/inflate.c \
		src/unshrink.c \
		src/nonpax.c \
		src/cpio.c

${BIN_DIR}/cpio: ${SRCS}
	${CC_FOR_BUILD} ${FLAGS_FOR_BUILD} -D_GNU_SOURCE -Isrc -o $@ $^

include $(TOPDIR)/mk/tools.mk
