include $(TOPDIR)/mk/kernel-ver.mk
ARCH:=			$(shell uname -m|sed -e "s/i.*86/x86/" -e "s/_\?64//")
CPU_ARCH:=		$(shell gcc -dumpmachine | sed -e s'/-.*//' \
			 -e 's/sparc.*/sparc/' \
	   		 -e 's/arm.*/arm/g' \
	 		 -e 's/m68k.*/m68k/' \
			 -e 's/ppc/powerpc/g' \
			 -e 's/sh[234]/sh/' \
	   		 -e 's/mips-.*/mips/' \
	  		 -e 's/mipsel-.*/mipsel/' \
			 -e 's/i[3-9]86/i686/' \
	    		)
TARGET_OPTIMIZATION:=	-Os -pipe
TARGET_CFLAGS_ARCH:=    -march=native
