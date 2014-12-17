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
	cd ${subdir} && ADK_TOPDIR=${ADK_TOPDIR} DEVELOPER=1 \
	    make VERBOSE=1 ${MAKEFLAGS} ${MAKECMDGOALS}

include prereq.mk
else
include Makefile
endif
