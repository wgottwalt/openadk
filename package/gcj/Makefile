# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gcj
PKG_VERSION:=		4.7.3
PKG_RELEASE:=		1
PKG_MD5SUM:=		86f428a30379bdee0224e353ee2f999e
PKG_DESCR:=		GNU java compiler
PKG_SECTION:=		lang
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}
DISTFILES:=		gcc-$(PKG_VERSION).tar.bz2

PKG_ARCH_DEPENDS:=	native
WRKDIST=		${WRKDIR}/gcc-${PKG_VERSION}

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GCJ,gcj,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		auto
HOST_MAKE_ENV+=		"JAR=no LDFLAGS=-liconv"
HOST_CONFIGURE_ARGS:=	\
			--enable-java-home \
			--enable-languages=java \
			--enable-shared \
			--with-ffi \
			--with-mpc=$(STAGING_HOST_DIR) \
			--with-mpfr=$(STAGING_HOST_DIR) \
			--with-gmp=$(STAGING_HOST_DIR) \
			--disable-nls \
			--without-libiconv-prefix \
			--disable-libmudflap \
			--disable-libgomp \
			--disable-biarch \
			--disable-decimal-float \
			--disable-multilib \
			--disable-bootstrap

post-extract:
	(cd $(DISTDIR); wget -O ecj.jar ftp://sourceware.org/pub/java/ecj-4.9.jar)
	(cd $(WRKBUILD); $(CP) $(DISTDIR)/ecj.jar .)

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
