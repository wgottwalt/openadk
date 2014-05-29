# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		gcj
PKG_VERSION:=		4.8.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		a3d7d63b9cb6b6ea049469a0c4a43c9d
PKG_DESCR:=		java compiler
PKG_SECTION:=		dev/lang
PKG_SITES:=		${MASTER_SITE_GNU:=gcc/gcc-${PKG_VERSION}/}

PKG_CFLINE_GCJ:=	depends on ADK_HOST_ONLY
DISTFILES:=		gcc-$(PKG_VERSION).tar.bz2
WRKDIST=		${WRKDIR}/gcc-${PKG_VERSION}

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,GCJ,gcj,$(PKG_VERSION)-${PKG_RELEASE}))

HOST_STYLE:=		auto
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

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
