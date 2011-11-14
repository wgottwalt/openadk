# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ruby
PKG_VERSION:=		1.9.3
PKG_EXTRAVER:=		0
PKG_RELEASE:=		1
PKG_MD5SUM:=		8e2fef56185cfbaf29d0c8329fc77c05
PKG_DESCR:=		interpreter for the ruby language
PKG_SECTION:=		lang
PKG_URL:=		http://www.ruby-lang.org/
PKG_SITES:=		http://ftp.ruby-lang.org/pub/ruby/1.9/
PKG_NOPARALLEL:=	1

PKG_HOST_DEPENDS:=	!freebsd !cygwin

DISTFILES:= 		${PKG_NAME}-${PKG_VERSION}-p${PKG_EXTRAVER}.tar.gz
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_VERSION}-p${PKG_EXTRAVER}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,RUBY,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

MAKE_FILE:=		GNUmakefile
XAKE_FLAGS+=		optflags='' debugflags='' dldflags="$(TARGET_LDFLAGS)" 
# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=         ac_cv_func_setpgrp_void=yes rb_cv_binary_elf=yes
CONFIGURE_ARGS+=	--disable-install-doc --with-baseruby=${WRKBUILD}/hostruby
ALL_TARGET:=		main
INSTALL_TARGET:=	install-nodoc

pre-configure:
	(cd ${WRKBUILD}; rm -rf config.{cache,status} ; \
		rb_cv_binary_elf=yes ./configure --prefix=$(STAGING_HOST_DIR) --disable-install-doc \
	);
	-$(MAKE) -C ${WRKBUILD} main Q=""
	cp ${WRKBUILD}/ruby ${WRKBUILD}/hostruby
	$(MAKE) -C ${WRKBUILD} install-nodoc
	$(MAKE) -C ${WRKBUILD} clean

post-install:
	${INSTALL_DIR} ${IDIR_RUBY}/usr/lib/ruby
	${INSTALL_DIR} ${IDIR_RUBY}/usr/bin
	${CP} ${WRKINST}/usr/lib/libruby.so* ${IDIR_RUBY}/usr/lib
	${CP} ${WRKINST}/usr/lib/ruby/* ${IDIR_RUBY}/usr/lib/ruby
	${INSTALL_BIN} ${WRKINST}/usr/bin/* ${IDIR_RUBY}/usr/bin

include ${TOPDIR}/mk/pkg-bottom.mk
