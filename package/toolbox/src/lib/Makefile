LIB=		oadk_toolbox
SRCS+=		fgetln.c
SRCS+=		md5.c md5hlp.c
CLEANFILES+=	lib${LIB}.a

include ../common.mk

OBJS+=		strlcpy.o strlcat.o

all: lib${LIB}.a

lib${LIB}.a: ${OBJS}
	ar rc $@ ${OBJS}
	-ranlib $@

CFLAGS_strlcpy.o=-DOUTSIDE_OF_LIBKERN -DL_strlcpy
strlcpy.o: strlfun.c
	${COMPILE.c} -o $@ $<
CFLAGS_strlcat.o=-DOUTSIDE_OF_LIBKERN -DL_strlcat
strlcat.o: strlfun.c
	${COMPILE.c} -o $@ $<

install:
	# nothing to do here
