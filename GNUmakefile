# $Id: GNUmakefile 255 2008-12-11 16:20:28Z wbx $
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

TOPDIR:=	$(shell pwd)
PWD:=		${TOPDIR}

ifneq (${package},)
subdir:=	package/${package}
_subdir_dep:=	${TOPDIR}/.cfg/ADK_HAVE_DOT_CONFIG
endif

ifneq (${subdir},)
${MAKECMDGOALS}: _subdir

_subdir: ${_subdir_dep}
	@if test x"$$(umask 2>/dev/null | sed 's/00*22/OK/')" != x"OK"; then \
		echo >&2 Error: you must build with “umask 022”, sorry.; \
		exit 1; \
	fi
	cd ${subdir} && TOPDIR=${TOPDIR} DEVELOPER=1 \
	    make VERBOSE=1 ${MAKEFLAGS} ${MAKECMDGOALS}

include prereq.mk
include mk/split-cfg.mk
else
include Makefile
endif
