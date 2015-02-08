# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gcj
PKG_VERSION:=		4.9.2
PKG_RELEASE:=		1
PKG_HASH:=		655fe692ddd333c29c5a1418f50f63a42cdd9e9eb7ebdb7f621e33c4b8799e31
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
