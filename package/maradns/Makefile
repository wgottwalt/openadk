# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		maradns
PKG_VERSION:=		2.0.09
PKG_RELEASE:=		1
PKG_HASH:=		e1ee80836f0fbc47b9b94ec839e112ea19c40bed0b70d672d231849a4dea1083
PKG_DESCR:=		small and secure DNS server
PKG_SECTION:=		net/dns
PKG_DEPENDS:=		libpthread librt
PKG_URL:=		http://www.maradns.org
PKG_SITES:=		http://maradns.samiam.org/download/2.0/${PKG_VERSION}/
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_FLAVOURS_MARADNS:=	WITH_IPV6
PKGFD_WITH_IPV6:=	enable IPv6 support

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MARADNS,maradns,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
FAKE_FLAGS+=		PREFIX="${WRKINST}/usr" \
			RPM_BUILD_ROOT="${WRKINST}"

CONFIGURE_ARGS:=
ifneq (${ADK_PACKAGE_MARADNS_WITH_IPV6},)
CONFIGURE_ARGS+=       --ipv6
endif

pre-install:
	@mkdir -p ${WRKINST}/usr/{sbin,bin,man/man{1,5,8}}

do-configure:
	(cd ${WRKBUILD} && ./configure ${CONFIGURE_ARGS});

maradns-install:
	${INSTALL_DIR} ${IDIR_MARADNS}/etc/maradns/logger
	${INSTALL_DIR} ${IDIR_MARADNS}/usr/bin ${IDIR_MARADNS}/usr/sbin
	${INSTALL_DATA} ./files/mararc ${IDIR_MARADNS}/etc/mararc
	${INSTALL_DATA} ./files/sample.{zone,ptr} \
		${IDIR_MARADNS}/etc/maradns/
	${CP} ${WRKINST}/usr/bin/{askmara,getzone} ${IDIR_MARADNS}/usr/bin/
	${CP} ${WRKINST}/usr/sbin/{maradns,zoneserver} \
		${IDIR_MARADNS}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
