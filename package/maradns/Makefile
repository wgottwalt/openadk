# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		maradns
PKG_VERSION:=		1.4.05
PKG_RELEASE:=		1
PKG_MD5SUM:=		aff277f6ba0e1ff46d32a60ab84f16cb
PKG_DESCR:=		small and secure DNS server
PKG_SECTION:=		net/dns
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.maradns.org
PKG_SITES:=		http://www.maradns.org/download/1.4/${PKG_VERSION}/
PKG_NOPARALLEL:=	1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MARADNS,maradns,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
FAKE_FLAGS+=		PREFIX="${WRKINST}/usr" \
			RPM_BUILD_ROOT="${WRKINST}"

pre-install:
	@mkdir -p ${WRKINST}/usr/{sbin,bin,man/man{1,5,8}}

do-configure:
	(cd ${WRKBUILD} && ./configure);

maradns-install:
	${INSTALL_DIR} ${IDIR_MARADNS}/etc/maradns
	${INSTALL_DIR} ${IDIR_MARADNS}/usr/bin ${IDIR_MARADNS}/usr/sbin
	${INSTALL_DATA} ./files/mararc ${IDIR_MARADNS}/etc/mararc
	${INSTALL_DATA} ./files/sample.{zone,ptr} \
		${IDIR_MARADNS}/etc/maradns/
	${CP} ${WRKINST}/usr/bin/{askmara,getzone} ${IDIR_MARADNS}/usr/bin/
	${CP} ${WRKINST}/usr/sbin/{maradns,zoneserver} \
		${IDIR_MARADNS}/usr/sbin/

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
