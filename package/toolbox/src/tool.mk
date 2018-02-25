SRCS?=		${PROG:=.c}

include ./common.mk

CPPFLAGS+=	-I../src
LDFLAGS+=	-L../lib
LIBS+=		-loadk_toolbox
VPATH=		../src

all: ${PROG}

${PROG}: ${OBJS}
	${CC} ${CFLAGS} ${LDFLAGS} -o $@ \
	    -Wl,--start-group ${OBJS} ${LIBS} -Wl,--end-group

DESTDIR?=
BINDIR?=/bin
INSTALL?=/usr/bin/install

install:
	${INSTALL} -d ${DESTDIR}${BINDIR}/
	${INSTALL} -c -m 755 ${PROG} ${DESTDIR}${BINDIR}/
