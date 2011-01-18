# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ruby
PKG_VERSION:=		1.9.2
PKG_RELEASE:=		2
PKG_MD5SUM:=		755aba44607c580fddc25e7c89260460
PKG_DESCR:=		interpreter for the ruby language
PKG_SECTION:=		lang
PKG_URL:=		http://www.ruby-lang.org/
PKG_SITES:=		ftp://ftp.ruby-lang.org/pub/ruby/
PKG_NOPARALLEL:=	1

PKG_HOST_DEPENDS:=	!freebsd !cygwin

DISTFILES:= 		${PKG_NAME}-${PKG_VERSION}-p0.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-1.9.2-p0

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RUBY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FILE:=		GNUmakefile
XAKE_FLAGS+=		optflags='' debugflags='' BASERUBY="${WRKBUILD}/hostruby" \
			dldflags="$(TARGET_LDFLAGS)"
# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=         ac_cv_func_setpgrp_void=yes
CONFIGURE_ARGS+=	--disable-install-doc
ALL_TARGET:=		main
INSTALL_TARGET:=	install-nodoc

pre-configure:
	cp ${WRKBUILD}/ext/Setup ${WRKBUILD}/ext/Setup.orig
	echo "option nodynamic" >> ${WRKBUILD}/ext/Setup
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		./configure --prefix=$(STAGING_HOST_DIR) --disable-install-doc \
	);
	$(MAKE) -C ${WRKBUILD} main
	cp ${WRKBUILD}/ruby ${WRKBUILD}/hostruby
	cp ${WRKBUILD}/ext/Setup.orig ${WRKBUILD}/ext/Setup
	$(MAKE) -C ${WRKBUILD} install-nodoc
	$(MAKE) -C ${WRKBUILD} clean

post-install:
	${INSTALL_DIR} ${IDIR_RUBY}/usr/lib/ruby
	${INSTALL_DIR} ${IDIR_RUBY}/usr/bin
	${CP} ${WRKINST}/usr/lib/libruby.so* ${IDIR_RUBY}/usr/lib
	${CP} ${WRKINST}/usr/lib/ruby/* ${IDIR_RUBY}/usr/lib/ruby/
	${INSTALL_BIN} ${WRKINST}/usr/bin/* ${IDIR_RUBY}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
