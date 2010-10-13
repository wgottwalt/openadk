# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		olsrd
PKG_VERSION:=		0.6.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		84e9295457cab50539f776118939b343
PKG_DESCR:=		Optimized Link State Routing protocol
PKG_SECTION:=		wifi
PKG_URL:=		http://www.olsr.org/
PKG_SITES:=		http://www.olsr.org/releases/0.6/
PKG_MULTI:=		1

PKG_SUBPKGS:=		OLSRD OLSRD_MOD_DYN_GW OLSRD_MOD_HTTPINFO OLSRD_MOD_NAMESERVICE
PKG_SUBPKGS+=		OLSRD_MOD_TAS

include ${TOPDIR}/mk/package.mk

define PKG_mod_template

INSTALL_MODS_$${ADK_PACKAGE_${1}}+=	${2}-install

${2}-install:
	$${INSTALL_DIR} $${IDIR_${1}}/usr/lib
	$${CP} $${WRKINST}/usr/lib/olsrd_${2}.so.* $${IDIR_${1}}/usr/lib/

endef

$(eval $(call PKG_template,OLSRD,olsrd,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OLSRD_MOD_DYN_GW,olsrd-mod-dyn-gw,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OLSRD_MOD_HTTPINFO,olsrd-mod-httpinfo,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OLSRD_MOD_NAMESERVICE,olsrd-mod-nameservice,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OLSRD_MOD_TAS,olsrd-mod-tas,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

$(eval $(call PKG_mod_template,OLSRD_MOD_DYN_GW,dyn_gw))
$(eval $(call PKG_mod_template,OLSRD_MOD_HTTPINFO,httpinfo))
$(eval $(call PKG_mod_template,OLSRD_MOD_NAMESERVICE,nameservice))
$(eval $(call PKG_mod_template,OLSRD_MOD_TAS,tas))

CONFIG_STYLE:=          manual

TCFLAGS+=		-fPIC
ALL_TARGET+=		libs
INSTALL_TARGET+=	install_libs
MAKE_ENV+=		OS="linux" NODEBUG=1 STRIP="true" OFLAGS="${TARGET_CFLAGS}"

post-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} ${IDIR_OLSRD}/usr/sbin ${IDIR_OLSRD}/etc
	${INSTALL_DATA} ${WRKINST}/etc/olsrd.conf ${IDIR_OLSRD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/olsrd ${IDIR_OLSRD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
