COMPILE = $(CC_FOR_BUILD) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
	$(CPPFLAGS_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD)
LINK = $(CC_FOR_BUILD) $(AM_CFLAGS) $(CFLAGS_FOR_BUILD) $(AM_LDFLAGS) $(LDFLAGS_FOR_BUILD) -o $@

noinst_PROGRAMS = rpcgen

rpcgen_SOURCES = \
	rpc_clntout.c \
	rpc_cout.c \
	rpc_hout.c \
	rpc_main.c \
	rpc_parse.c \
	rpc_sample.c \
	rpc_scan.c \
	rpc_svcout.c \
	rpc_tblout.c \
	rpc_util.c \
	rpc_parse.h \
	rpc_scan.h \
	rpc_util.h

dist_man1_MANS = rpcgen.1
