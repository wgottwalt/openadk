# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ppp
PKG_VERSION:=		2.4.5
PKG_RELEASE:=		5
PKG_MD5SUM:=		4621bc56167b6953ec4071043fe0ec57
PKG_DESCR:=		Point-to-Point Protocol software
PKG_SECTION:=		ppp
PKG_DEPENDS:=		kmod-ppp
PKG_URL:=		http://ppp.samba.org/
PKG_SITES:=		ftp://ftp.samba.org/pub/ppp/
PKG_MULTI:=		1

PKG_SUBPKGS:=		PPP PPP_MOD_PPPOA PPP_MOD_PPPOE PPP_MOD_RADIUS
PKG_SUBPKGS+=		PPP_MOD_CHAT PPP_MOD_PPPDUMP PPP_MOD_PPPSTATS PPP_MOD_PPPUMTS
PKG_DEPENDS_PPPOE:=	kmod-pppoe
PKG_DEPENDS_UMTS:=	comgt

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPOA,ppp-mod-pppoa,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPOE,ppp-mod-pppoe,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_PPPOE},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_RADIUS,ppp-mod-radius,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_CHAT,ppp-mod-chat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPDUMP,ppp-mod-pppdump,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPSTATS,ppp-mod-pppstats,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPUMTS,ppp-mod-pppumts,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS_UMTS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		UNAME_S="Linux"
XAKE_FLAGS+=		CC="${TARGET_CC}" \
			COPTS="${TCFLAGS}" \
			STAGING_TARGET_DIR=${STAGING_TARGET_DIR} \
			DESTDIR="${WRKINST}/usr" \
			TARGET_AR='${TARGET_CROSS}ar'

post-install:
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp
	install -m0600 ./files/etc/ppp/chap-secrets ${IDIR_PPP}/etc/ppp/
	${INSTALL_DATA} ./files/etc/ppp/options ${IDIR_PPP}/etc/ppp/
	${INSTALL_BIN} ./files/etc/ppp/ip-up ${IDIR_PPP}/etc/ppp/
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp/ip-up.d
	${INSTALL_BIN} ./files/etc/ppp/ip-up.d/0* \
		${IDIR_PPP}/etc/ppp/ip-up.d
	${INSTALL_BIN} ./files/etc/ppp/ip-down ${IDIR_PPP}/etc/ppp/
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp/ip-down.d
	${INSTALL_BIN} ./files/etc/ppp/ip-down.d/0* \
		${IDIR_PPP}/etc/ppp/ip-down.d
	${INSTALL_DIR} ${IDIR_PPP}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/pppd ${IDIR_PPP}/usr/sbin/
	${INSTALL_DIR} ${IDIR_PPP}/usr/lib/pppd
	${INSTALL_BIN} ./files/pon ${IDIR_PPP}/usr/sbin/
	${INSTALL_BIN} ./files/poff ${IDIR_PPP}/usr/sbin/
	${INSTALL_DIR} ${IDIR_PPP}/etc/ppp/peers
ifeq (${ADK_INSTALL_PACKAGE_NETWORK_SCRIPTS},y)
	$(INSTALL_DIR) ${IDIR_PPP}/etc/network/if-pre-up.d
	$(INSTALL_BIN) ./files/ppp.pre-up \
		${IDIR_PPP}/etc/network/if-pre-up.d/05-ppp
endif

mod-radius-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_RADIUS}/etc/radiusclient
	${CP} ${WRKBUILD}/pppd/plugins/radius/etc/* \
		${IDIR_PPP_MOD_RADIUS}/etc/radiusclient
	rm ${IDIR_PPP_MOD_RADIUS}/etc/radiusclient/radiusclient.conf.in
	${INSTALL_DIR} ${IDIR_PPP_MOD_RADIUS}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/radius.so \
		${IDIR_PPP_MOD_RADIUS}/usr/lib/pppd/$(PKG_VERSION)

mod-pppoe-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOE}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/rp-pppoe.so \
		${IDIR_PPP_MOD_PPPOE}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOE}/etc/ppp/templates
	${INSTALL_DATA} ./files/etc/ppp/templates/pppoe \
		${IDIR_PPP_MOD_PPPOE}/etc/ppp/templates/

mod-pppoa-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOA}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/pppoatm.so \
		${IDIR_PPP_MOD_PPPOA}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOA}/etc/ppp/templates
	${INSTALL_DATA} ./files/etc/ppp/templates/pppoa \
		${IDIR_PPP_MOD_PPPOA}/etc/ppp/templates/

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
	${INSTALL_DATA} ./files/etc/ppp/templates/umts \
		${IDIR_PPP_MOD_PPPUMTS}/etc/ppp/templates/
ifeq (${ADK_INSTALL_PACKAGE_NETWORK_SCRIPTS},y)
	$(INSTALL_DIR) ${IDIR_PPP_MOD_PPPUMTS}/etc/network/if-pre-up.d
	$(INSTALL_DIR) ${IDIR_PPP_MOD_PPPUMTS}/etc/network/if-post-down.d
	$(INSTALL_BIN) ./files/hso.if-up \
		${IDIR_PPP_MOD_PPPUMTS}/etc/network/if-pre-up.d/06-hso
	$(INSTALL_BIN) ./files/hso.if-down \
		${IDIR_PPP_MOD_PPPUMTS}/etc/network/if-post-down.d/06-hso
endif

include ${TOPDIR}/mk/pkg-bottom.mk
