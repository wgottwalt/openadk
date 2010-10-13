# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ruby
PKG_VERSION:=		1.9.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		0f6d7630f26042e00bc59875755cf879
PKG_DESCR:=		interpreter for the ruby language
PKG_SECTION:=		lang
PKG_URL:=		http://www.ruby-lang.org/
PKG_SITES:=		ftp://ftp.ruby-lang.org/pub/ruby/
PKG_NOPARALLEL:=	1

PKG_HOST_DEPENDS:=	!freebsd !cygwin !darwin

DISTFILES:= 		${PKG_NAME}-${PKG_VERSION}-p429.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-1.9.1-p429

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RUBY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FILE:=		GNUmakefile
XAKE_FLAGS+=		optflags='' debugflags='' BASERUBY="${WRKBUILD}/hostruby"
# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=         ac_cv_func_setpgrp_void=yes
INSTALL_TARGET:=	install-nodoc

pre-configure:
	cp ${WRKBUILD}/ext/Setup ${WRKBUILD}/ext/Setup.orig
	echo "option nodynamic" >> ${WRKBUILD}/ext/Setup
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure --prefix=$(STAGING_TOOLS) \
	);
	$(MAKE) -C ${WRKBUILD} ruby
	cp ${WRKBUILD}/ruby ${WRKBUILD}/hostruby
	cp ${WRKBUILD}/ext/Setup.orig ${WRKBUILD}/ext/Setup
	$(MAKE) -C ${WRKBUILD} install-nodoc
	$(MAKE) -C ${WRKBUILD} clean

post-install:
	rm -rf ${WRKINST}/usr/lib/site_ruby
	rm -rf ${WRKINST}/usr/include
	${CP} ${WRKINST}/usr ${IDIR_RUBY}/

include ${TOPDIR}/mk/pkg-bottom.mk
