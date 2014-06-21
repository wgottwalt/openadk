# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

ADK_TOPDIR:=	$(shell pwd)
PWD:=		${ADK_TOPDIR}

include Makefile.inc

ifneq (${package},)
subdir:=	package/${package}
_subdir_dep:=	${ADK_TOPDIR}/.config
endif

ifneq (${subdir},)
${MAKECMDGOALS}: _subdir

_subdir: ${_subdir_dep}
	@if test x"$$(umask 2>/dev/null | sed 's/00*22/OK/')" != x"OK"; then \
		echo >&2 Error: you must build with “umask 022”, sorry.; \
		exit 1; \
	fi
	cd ${subdir} && ADK_TOPDIR=${ADK_TOPDIR} DEVELOPER=1 \
	    make VERBOSE=1 ${MAKEFLAGS} ${MAKECMDGOALS}

include prereq.mk
else
include Makefile
endif
