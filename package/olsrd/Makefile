# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		olsrd
PKG_VERSION:=		0.5.6-r2
PKG_RELEASE:=		1
PKG_MD5SUM:=		acf15dbd0af521a6826541b567c6473a
PKG_DESCR:=		Optimized Link State Routing protocol
PKG_SECTION:=		net
PKG_MULTI:=		1
PKG_URL:=		http://www.olsr.org
PKG_SITES:=		http://www.olsr.org/releases/0.5/

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

TCFLAGS+=	-fPIC

do-build:
	rm -rf ${WRKINST}
	mkdir -p ${WRKINST}
	${MAKE} -C "${WRKBUILD}" \
		${TARGET_CONFIGURE_OPTS} \
		NODEBUG=1 \
		OFLAGS="${TARGET_CFLAGS}" \
		OS="linux" \
		DESTDIR="${WRKINST}" \
		STRIP="true" \
		all libs install install_libs

do-install: ${INSTALL_MODS_y} ${INSTALL_MODS_m}
	${INSTALL_DIR} ${IDIR_OLSRD}/usr/sbin ${IDIR_OLSRD}/etc
	${INSTALL_DATA} ${WRKINST}/etc/olsrd.conf ${IDIR_OLSRD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/sbin/olsrd ${IDIR_OLSRD}/usr/sbin/

include ${TOPDIR}/mk/pkg-bottom.mk
