# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		maradns
PKG_VERSION:=		1.4.03
PKG_RELEASE:=		1
PKG_MD5SUM:=		9e715104234cc9bf01e2afaad27eb787
PKG_DESCR:=		small and secure DNS server
PKG_SECTION:=		net
PKG_NOPARALLEL:=	1
PKG_DEPENDS:=		libpthread
PKG_URL:=		http://www.maradns.org
PKG_SITES:=		http://www.maradns.org/download/1.4/${PKG_VERSION}/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MARADNS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual

FAKE_FLAGS+=		PREFIX="${WRKINST}/usr" \
			RPM_BUILD_ROOT="${WRKINST}"

pre-install:
	@mkdir -p ${WRKINST}/usr/man/man{1,5,8}

do-configure:
	(cd ${WRKBUILD} && ./configure);

post-install:
	${INSTALL_DIR} ${IDIR_MARADNS}/etc/maradns
	${INSTALL_DIR} ${IDIR_MARADNS}/usr/bin ${IDIR_MARADNS}/usr/sbin
	${INSTALL_DATA} ./files/mararc ${IDIR_MARADNS}/etc/mararc
	${INSTALL_DATA} ./files/sample.{zone,ptr} \
		${IDIR_MARADNS}/etc/maradns/
	${CP} ${WRKINST}/usr/bin/{askmara,getzone} ${IDIR_MARADNS}/usr/bin/
	${CP} ${WRKINST}/usr/sbin/{maradns,zoneserver} \
		${IDIR_MARADNS}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
