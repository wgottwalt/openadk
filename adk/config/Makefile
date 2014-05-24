# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

ifneq ($(filter-out clean,${MAKECMDGOALS}),)
include ${TOPDIR}/rules.mk
endif

CP=cp -fpR
CFLAGS_FOR_BUILD:=-DKBUILD_NO_NLS -O0 -g0 -w

all: ncurses conf mconf

LIBS=		-lncurses
ifeq (/usr/include/ncurses/ncurses.h, $(wildcard /usr/include/ncurses/ncurses.h))
CFLAGS_FOR_BUILD+=	-I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"
else
ifeq (/usr/include/ncurses/curses.h, $(wildcard /usr/include/ncurses/curses.h))
CFLAGS_FOR_BUILD+=	-I/usr/include/ncurses -DCURSES_LOC="<ncurses/curses.h>"
else
ifeq (/usr/local/include/ncurses/ncurses.h, $(wildcard /usr/local/include/ncurses/ncurses.h))
CFLAGS_FOR_BUILD+=	-I/usr/local/include/ncurses -DCURSES_LOC="<ncurses.h>"
else
ifeq (/usr/local/include/ncurses/curses.h, $(wildcard /usr/local/include/ncurses/curses.h))
CFLAGS_FOR_BUILD+=	-I/usr/local/include/ncurses -DCURSES_LOC="<ncurses/curses.h>"
else
ifeq (/usr/pkg/include/ncurses.h, $(wildcard /usr/pkg/include/ncurses.h))
CFLAGS_FOR_BUILD+=	-I/usr/pkg/include -DCURSES_LOC="<ncurses.h>"
LIBS+=		-L/usr/pkg/lib -Wl,-rpath -Wl,/usr/pkg/lib
else
ifeq (/usr/include/ncurses.h, $(wildcard /usr/include/ncurses.h))
CFLAGS_FOR_BUILD+=	-DCURSES_LOC="<ncurses.h>"
else
CFLAGS_FOR_BUILD+=	-DCURSES_LOC="<curses.h>"
LIBS=		-lcurses
endif
endif
endif
endif
endif
endif

CONF_SRC  =conf.c
MCONF_SRC =mconf.c $(wildcard lxdialog/*.c)
SHARED_SRC=zconf.tab.c
SHARED_DEPS:=lkc.h lkc_proto.h lkc_defs.h expr.h zconf.tab.h
CONF_OBJS =$(patsubst %.c,%.o, $(CONF_SRC))
MCONF_OBJS=$(patsubst %.c,%.o, $(MCONF_SRC))
SHARED_OBJS=$(patsubst %.c,%.o, $(SHARED_SRC))

conf: $(CONF_OBJS) $(SHARED_OBJS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $^ -o $@

mconf: $(MCONF_OBJS) $(SHARED_OBJS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) $^ -o $@ $(LIBS)

$(CONF_OBJS): %.o : %.c $(SHARED_DEPS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -I. -c $< -o $@

$(MCONF_OBJS): %.o : %.c $(SHARED_DEPS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -I. -c $< -o $@

glob.o: glob.c $(SHARED_DEPS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -I. -c glob.c -o $@

lkc_defs.h: lkc_proto.h
	@sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'

###
# The following requires flex/bison
# By default we use the _shipped versions, uncomment the
# following line if you are modifying the flex/bison src.
#LKC_GENPARSER:=	1

ifdef LKC_GENPARSER

%.tab.c %.tab.h: %.y
	bison -t -d -v -b $* -p $(notdir $*) $<

%.hash.c: %.gperf
	gperf < $< > $@

lex.%.c: %.l
	flex -P$(notdir $*) -o$@ $<

lex.zconf.o: lex.zconf.c $(SHARED_DEPS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -I. -c $< -o $@

zconf.tab.o: zconf.tab.c zconf.hash.c lex.zconf.c confdata.c expr.c symbol.c menu.c $(SHARED_DEPS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -I. -c $< -o $@

else

lex.zconf.o: lex.zconf.c $(SHARED_DEPS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -I. -c $< -o $@

lex.zconf.c: lex.zconf.c_shipped
	@$(CP) lex.zconf.c_shipped lex.zconf.c

zconf.hash.c: zconf.hash.c_shipped
	@$(CP) zconf.hash.c_shipped zconf.hash.c

zconf.tab.o: zconf.tab.c zconf.hash.c lex.zconf.c confdata.c expr.c symbol.c menu.c $(SHARED_DEPS)
	@$(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) -I. -c $< -o $@

zconf.tab.c: zconf.tab.c_shipped
	@$(CP) zconf.tab.c_shipped zconf.tab.c

zconf.tab.h: zconf.tab.h_shipped
	@$(CP) zconf.tab.h_shipped zconf.tab.h
endif

.PHONY: ncurses

ncurses:
	@echo "int main(void) { return -1; }" > lxtemp.c
	@if $(CC_FOR_BUILD) $(CFLAGS_FOR_BUILD) lxtemp.c $(LIBS) ; then \
		rm -f lxtemp.c a.out; \
	else \
		rm -f lxtemp.c; \
		printf '\007'; \
		echo ">> Unable to find the Ncurses libraries." ;\
		echo ">>" ;\
		echo ">> You must have Ncurses installed in order" ;\
		echo ">> to use 'make menuconfig'" ;\
		echo ;\
		exit 1 ;\
	fi

clean:
	@rm -f *.o *~ core $(TARGETS) $(MCONF_OBJS) $(CONF_OBJS) zconf.hash.c \
		conf mconf zconf.tab.c zconf.tab.h lex.zconf.c lkc_defs.h
