# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		oprofile
PKG_VERSION:=		1.3.0
PKG_HASH:=		95ded8bde1ec39922f0af015981a67aec63e025a501e4dc04cd65d38f73647e6
PKG_RELEASE:=		1
PKG_DESCR:=		system-wide profiles
PKG_SECTION:=		app/debug
PKG_DEPENDS:=		libpopt libbfd
PKG_KDEPENDS:=		oprofile
PKG_BUILDDEP:=		popt binutils gcc
PKG_NEEDS:=		c++
PKG_URL:=		http://oprofile.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=oprofile/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_CFLINE_OPROFILE:=	select BUSYBOX_EXPR

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPROFILE,oprofile,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-binutils-libname=binutils \
			--with-binutils=${STAGING_TARGET_DIR}/usr/lib \
			--disable-werror \
			--disable-optimization

oprofile-install:
	$(INSTALL_DIR) $(IDIR_OPROFILE)/usr/{bin,lib/oprofile,share}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/ocount \
			$(WRKINST)/usr/bin/opannotate \
			$(WRKINST)/usr/bin/oparchive \
			$(WRKINST)/usr/bin/op-check-perfevents \
			$(WRKINST)/usr/bin/operf \
			$(WRKINST)/usr/bin/opgprof \
			$(WRKINST)/usr/bin/ophelp \
			$(WRKINST)/usr/bin/opimport \
			$(WRKINST)/usr/bin/opjitconv \
			$(WRKINST)/usr/bin/opreport \
			$(IDIR_OPROFILE)/usr/bin/
	${CP} ${WRKINST}/usr/share/oprofile ${IDIR_OPROFILE}/usr/share/
	${CP} ${WRKINST}/usr/lib/oprofile/libopagent.so* \
		${IDIR_OPROFILE}/usr/lib/oprofile

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
