# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		fprobe-ulog
PKG_VERSION:=		1.1
PKG_RELEASE:=		1
PKG_HASH:=		53b9ccbca4469dfb0e9da91f9f0789dbf732f2adac9de18842e3c210b445f2ad
PKG_DESCR:=		netflow probe
PKG_SECTION:=		net/acct
PKG_DEPENDS:=		libpcap libpthread
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=fprobe/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,FPROBE_ULOG,fprobe-ulog,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-piddir=/var \
			--with-membulk=index8 \
			--with-hash=xor8

fprobe-ulog-install:
	${INSTALL_DIR} ${IDIR_FPROBE_ULOG}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/fprobe-ulog \
		${IDIR_FPROBE_ULOG}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
