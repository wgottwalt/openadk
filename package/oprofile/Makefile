# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		oprofile
PKG_VERSION:=		0.9.9
PKG_RELEASE:=		4
PKG_MD5SUM:=		00aec1287da2dfffda17a9b1c0a01868
PKG_DESCR:=		system-wide profiles
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libpopt libbfd libstdcxx
PKG_BUILDDEP:=		popt binutils gcc
PKG_URL:=		http://oprofile.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=oprofile/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_ARCH_DEPENDS:=	!m68k
PKG_LIBC_DEPENDS:=	uclibc glibc

PKG_CFLINE_OPROFILE:=	select BUSYBOX_EXPR

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPROFILE,oprofile,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-lpthread
CONFIGURE_ARGS+=	--with-binutils-libname=binutils \
			--with-binutils=${STAGING_TARGET_DIR}/usr/lib

oprofile-install:
	$(INSTALL_DIR) $(IDIR_OPROFILE)/usr/{bin,share}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/opcontrol $(IDIR_OPROFILE)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ophelp $(IDIR_OPROFILE)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/opreport $(IDIR_OPROFILE)/usr/bin/
	$(INSTALL_BIN) $(WRKINST)/usr/bin/oprofiled $(IDIR_OPROFILE)/usr/bin/
	${CP} ${WRKINST}/usr/share/oprofile ${IDIR_OPROFILE}/usr/share/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
