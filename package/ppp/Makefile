# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ppp
PKG_VERSION:=		2.4.4
PKG_RELEASE:=		17
PKG_MD5SUM:=		183800762e266132218b204dfb428d29
PKG_DESCR:=		a PPP (Point-to-Point Protocol) software (with MPPE/MPPC support)
PKG_SECTION:=		net
PKG_DEPENDS:=		kmod-ppp
PKG_URL:=		http://ppp.samba.org
PKG_SITES:=		ftp://ftp.samba.org/pub/ppp/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPOA,ppp-mod-pppoa,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPOE,ppp-mod-pppoe,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_RADIUS,ppp-mod-radius,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_CHAT,ppp-mod-chat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPDUMP,ppp-mod-pppdump,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPSTATS,ppp-mod-pppstats,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPUMTS,ppp-mod-pppumts,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		UNAME_S="Linux"
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

XAKE_FLAGS+=		CC="${TARGET_CC}" \
			COPTS="${TCFLAGS}" \
			HAVE_INET6="1" \
			STAGING_DIR=${STAGING_DIR} \
			DESTDIR="${WRKINST}/usr" \
			TARGET_AR='${TARGET_CROSS}ar'

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_PPP_MOD_PPPOE}+=		mod-pppoe-install
SUB_INSTALLS-${ADK_PACKAGE_PPP_MOD_PPPOA}+=		mod-pppoa-install
SUB_INSTALLS-${ADK_PACKAGE_PPP_MOD_RADIUS}+=		mod-radius-install
SUB_INSTALLS-${ADK_PACKAGE_PPP_MOD_CHAT}+=		mod-chat-install
SUB_INSTALLS-${ADK_PACKAGE_PPP_MOD_PPPDUMP}+=		mod-pppdump-install
SUB_INSTALLS-${ADK_PACKAGE_PPP_MOD_PPPSTATS}+=		mod-pppstats-install
SUB_INSTALLS-${ADK_PACKAGE_PPP_MOD_PPPUMTS}+=		mod-pppumts-install

post-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	echo -------------------------------
	echo ${SUB_INSTALLS-m}
	echo ${SUB_INSTALLS-y}
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp
	ln -sf /tmp/resolv.conf ${IDIR_PPP}/etc/ppp/resolv.conf
	install -m0600 ./files/etc/ppp/chap-secrets ${IDIR_PPP}/etc/ppp/
	${INSTALL_DATA} ./files/etc/ppp/options ${IDIR_PPP}/etc/ppp/
	${INSTALL_FILTER}
	${INSTALL_BIN} ./files/etc/ppp/ip-up ${IDIR_PPP}/etc/ppp/
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp/ip-up.d
	${INSTALL_BIN} ./files/etc/ppp/ip-up.d/if-rename ${IDIR_PPP}/etc/ppp/ip-up.d/
	${INSTALL_BIN} ./files/etc/ppp/ip-down ${IDIR_PPP}/etc/ppp/
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp/ip-down.d
	${INSTALL_DIR} ${IDIR_PPP}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppd ${IDIR_PPP}/usr/sbin/
	${INSTALL_DIR} ${IDIR_PPP}/usr/lib/pppd
	${INSTALL_BIN} ./files/pon ${IDIR_PPP}/usr/sbin/
	${INSTALL_BIN} ./files/poff ${IDIR_PPP}/usr/sbin/
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp/peers
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp/templates
	${INSTALL_DATA} ./files/etc/ppp/templates/dsl ${IDIR_PPP}/etc/ppp/templates/

mod-radius-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_RADIUS}/etc/radiusclient
	${CP} ${WRKBUILD}/pppd/plugins/radius/etc/* ${IDIR_PPP_MOD_RADIUS}/etc/radiusclient
	rm ${IDIR_PPP_MOD_RADIUS}/etc/radiusclient/radiusclient.conf.in
	${INSTALL_DIR} ${IDIR_PPP_MOD_RADIUS}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/radius.so \
		${IDIR_PPP_MOD_RADIUS}/usr/lib/pppd/$(PKG_VERSION)

mod-pppoe-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOE}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/rp-pppoe.so \
		${IDIR_PPP_MOD_PPPOE}/usr/lib/pppd/$(PKG_VERSION)

mod-pppoa-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOA}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/pppoatm.so \
		${IDIR_PPP_MOD_PPPOA}/usr/lib/pppd/$(PKG_VERSION)

mod-chat-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_CHAT}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/chat ${IDIR_PPP_MOD_CHAT}/usr/sbin/

mod-pppdump-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPDUMP}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/pppdump ${IDIR_PPP_MOD_PPPDUMP}/usr/sbin/

mod-pppstats-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPSTATS}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/pppstats ${IDIR_PPP_MOD_PPPSTATS}/usr/sbin/

mod-pppumts-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPUMTS}/etc/ppp/templates
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPUMTS}/etc/ppp/ip-{down,up}.d
	${INSTALL_DATA} ./files/etc/ppp/templates/umts \
		${IDIR_PPP_MOD_PPPUMTS}/etc/ppp/templates/
	${INSTALL_BIN} ./files/etc/ppp/ip-up.d/umts \
		${IDIR_PPP_MOD_PPPUMTS}/etc/ppp/ip-up.d/
	${INSTALL_BIN} ./files/etc/ppp/ip-down.d/umts \
		${IDIR_PPP_MOD_PPPUMTS}/etc/ppp/ip-down.d/

include ${TOPDIR}/mk/pkg-bottom.mk
