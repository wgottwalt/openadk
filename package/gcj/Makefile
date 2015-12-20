# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gcj
PKG_VERSION:=		5.3.0
PKG_RELEASE:=		1
PKG_HASH:=		b7f5f56bd7db6f4fcaa95511dbf69fc596115b976b5352c06531c2fc95ece2f4
PKG_DESCR:=		java compiler
PKG_SECTION:=		dev/lang
HOST_BUILDDEP:=		zip-host
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}

PKG_CFLINE_GCJ:=	depends on ADK_HOST_ONLY

DISTFILES:=		gcc-$(PKG_VERSION).tar.gz
WRKDIST=		${WRKDIR}/gcc-${PKG_VERSION}

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GCJ,gcj,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_MAKE_ENV+=		"JAR=no LDFLAGS=-liconv"
# http://gcc.gnu.org/bugzilla/attachment.cgi?id=30880&action=diff
HOST_CONFIGURE_ARGS:=	--enable-dependency-tracking \
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

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
