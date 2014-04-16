# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ruby
PKG_VERSION:=		2.1.1
PKG_RELEASE:=		1
PKG_MD5SUM:=		e57fdbb8ed56e70c43f39c79da1654b2
PKG_DESCR:=		interpreter for the ruby language
PKG_SECTION:=		lang
PKG_DEPENDS:=		librt libpthread libgcc
PKG_BUILDDEP:=		ruby-host
HOST_BUILDDEP:=		readline-host
PKG_URL:=		http://www.ruby-lang.org/
PKG_SITES:=		http://ftp.ruby-lang.org/pub/ruby/2.1/
PKG_NOPARALLEL:=	1

PKG_HOST_DEPENDS:=	!freebsd !cygwin

include ${TOPDIR}/mk/host.mk
include ${TOPDIR}/mk/package.mk

$(eval $(call HOST_template,RUBY,ruby,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,RUBY,ruby,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

# uClibc setpgrp does not take arguments
CONFIGURE_ENV+=         ac_cv_func_setpgrp_void=yes \
			rb_cv_binary_elf=yes
CONFIGURE_ARGS+=	--disable-install-doc \
			--with-baseruby=${STAGING_HOST_DIR}/usr/bin/ruby

MAKE_FILE:=		GNUmakefile
XAKE_FLAGS+=		optflags='' debugflags='' dldflags="$(TARGET_LDFLAGS)" 
ALL_TARGET:=		main
INSTALL_TARGET:=	install-nodoc

HOST_CONFIGURE_ARGS+=	--disable-install-doc \
			--disable-shared \
			--prefix=$(HOST_WRKINST)/usr \
			--bindir=$(HOST_WRKINST)/usr/bin \
			--mandir=$(HOST_WRKINST)/usr/share/man \
			--disable-rubygems
HOST_ALL_TARGET:=	main
HOST_INSTALL_TARGET:=	install-nodoc
HOST_XAKE_FLAGS:=	V=1 DESTDIR=""

ruby-hostinstall:
	$(INSTALL_BIN) $(HOST_WRKINST)/usr/bin/ruby \
		$(STAGING_HOST_DIR)/usr/bin
	$(CP) $(HOST_WRKINST)/usr/lib/ruby \
		$(STAGING_HOST_DIR)/usr/lib

ruby-install:
	${INSTALL_DIR} ${IDIR_RUBY}/usr/lib/ruby
	${INSTALL_DIR} ${IDIR_RUBY}/usr/bin
	${CP} ${WRKINST}/usr/lib/libruby.so* ${IDIR_RUBY}/usr/lib
	${CP} ${WRKINST}/usr/lib/ruby/* ${IDIR_RUBY}/usr/lib/ruby
	${INSTALL_BIN} ${WRKINST}/usr/bin/* ${IDIR_RUBY}/usr/bin

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
