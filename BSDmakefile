# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

ADK_TOPDIR=		${.CURDIR}
PWD=		${.CURDIR}

.include "${.CURDIR}/Makefile.inc"

.if defined(package) && !empty(package)
subdir:=	package/${package}
.  if !make(clean)
_subdir_dep:=	${ADK_TOPDIR}/.config
.  endif
.endif

.if defined(subdir) && !empty(subdir)
_subdir:=	${.TARGETS}
${.TARGETS}: _subdir

_subdir: ${_subdir_dep}
	@if test x"$$(umask 2>/dev/null | sed 's/00*22/OK/')" != x"OK"; then \
		echo >&2 Error: you must build with “umask 022”, sorry.; \
		exit 1; \
	fi
	cd ${.CURDIR}/${subdir} && ADK_TOPDIR=${.CURDIR} DEVELOPER=1 \
	    ${GMAKE} VERBOSE=1 ${.MFLAGS} ${_subdir}

.  include "${.CURDIR}/prereq.mk"
.else
.  include "${.CURDIR}/Makefile"
.endif
