# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mrd6
PKG_VERSION:=		0.9.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		93ada53bb414b9d622f80a717bc2694b
PKG_DESCR:=		IPv6 multicast routing daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		kmod-ipv6
PKG_SITES:=		http://www.openadk.org/distfiles/

WRKBUILD=		${WRKSRC}/src

include ${TOPDIR}/mk/package.mk

ifeq (${ADK_COMPILE_MRD6_WITH_UCLIBCXX},y)
PKG_DEPENDS:=		uclibc++
else
PKG_DEPENDS:=		libstdcxx
endif

$(eval $(call PKG_template,MRD6,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

ifeq (${ADK_COMPILE_MRD6_WITH_UCLIBCXX},y)
TCXXFLAGS+=		-fno-builtin -nostdinc++ -nodefaultlibs -I${STAGING_DIR}/usr/include/uClibc++
TLDFLAGS+=		-nodefaultlibs -luClibc++ -shared
endif

XAKE_FLAGS+=		EXTRA_FLAGS="${TCFLAGS}" 
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_MRD6}/usr/sbin ${IDIR_MRD6}/etc
	${INSTALL_DIR} ${IDIR_MRD6}/usr/lib/mrd6 ${IDIR_MRD6}/bin
	${INSTALL_DATA} ./files/${PKG_NAME}.conf ${IDIR_MRD6}/etc
	${INSTALL_BIN} ${WRKINST}/usr/local/sbin/mrd \
		 ${IDIR_MRD6}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/local/bin/mrd6sh \
		 ${IDIR_MRD6}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/local/lib/mrd6/bgp.so \
		 ${IDIR_MRD6}/usr/lib/mrd6/

include ${TOPDIR}/mk/pkg-bottom.mk
