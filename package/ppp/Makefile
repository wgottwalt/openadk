# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ppp
PKG_VERSION:=		2.4.5
PKG_RELEASE:=		7
PKG_MD5SUM:=		4621bc56167b6953ec4071043fe0ec57
PKG_DESCR:=		Point-to-Point Protocol software
PKG_SECTION:=		ppp
PKG_DEPENDS:=		kmod-ppp
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://ppp.samba.org/
PKG_SITES:=		ftp://ftp.samba.org/pub/ppp/
PKG_MULTI:=		1

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		PPP PPP_MOD_PPPOA PPP_MOD_PPPOE PPP_MOD_RADIUS
PKG_SUBPKGS+=		PPP_MOD_CHAT PPP_MOD_PPPDUMP PPP_MOD_PPPSTATS PPP_MOD_PPPUMTS
PKGSS_PPP_MOD_PPPOE:=	kmod-pppoe
PKGSS_PPP_MOD_PPPUMTS:=	comgt

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,PPP,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPOA,ppp-mod-pppoa,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPOE,ppp-mod-pppoe,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_PPP_MOD_PPPOE},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_RADIUS,ppp-mod-radius,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_CHAT,ppp-mod-chat,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPDUMP,ppp-mod-pppdump,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPSTATS,ppp-mod-pppstats,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,PPP_MOD_PPPUMTS,ppp-mod-pppumts,${PKG_VERSION}-${PKG_RELEASE},${PKGSS_PPP_MOD_PPPUMTS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--system=Linux --prefix="/usr"
CONFIGURE_ENV+=		UNAME_S="Linux"
TARGET_LDFLAGS+=	-lcrypt
XAKE_FLAGS+=		STAGING_TARGET_DIR=${STAGING_TARGET_DIR} \
			DESTDIR="${WRKINST}/usr" STRIP='' \
			TARGET_AR='${TARGET_CROSS}ar'

ppp-install:
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
	$(INSTALL_DIR) ${IDIR_PPP}/etc/network/if-pre-up.d
	$(INSTALL_BIN) ./files/ppp.pre-up \
		${IDIR_PPP}/etc/network/if-pre-up.d/05-ppp

ppp-mod-radius-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_RADIUS}/etc/radiusclient
	${CP} ${WRKBUILD}/pppd/plugins/radius/etc/* \
		${IDIR_PPP_MOD_RADIUS}/etc/radiusclient
	rm ${IDIR_PPP_MOD_RADIUS}/etc/radiusclient/radiusclient.conf.in
	${INSTALL_DIR} ${IDIR_PPP_MOD_RADIUS}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/radius.so \
		${IDIR_PPP_MOD_RADIUS}/usr/lib/pppd/$(PKG_VERSION)

ppp-mod-pppoe-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOE}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/rp-pppoe.so \
		${IDIR_PPP_MOD_PPPOE}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOE}/etc/ppp/templates
	${INSTALL_DATA} ./files/etc/ppp/templates/pppoe \
		${IDIR_PPP_MOD_PPPOE}/etc/ppp/templates/

ppp-mod-pppoa-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOA}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_BIN} $(WRKINST)/usr/lib/pppd/$(PKG_VERSION)/pppoatm.so \
		${IDIR_PPP_MOD_PPPOA}/usr/lib/pppd/$(PKG_VERSION)
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPOA}/etc/ppp/templates
	${INSTALL_DATA} ./files/etc/ppp/templates/pppoa \
		${IDIR_PPP_MOD_PPPOA}/etc/ppp/templates/

ppp-mod-chat-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_CHAT}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/chat ${IDIR_PPP_MOD_CHAT}/usr/sbin/

ppp-mod-pppdump-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPDUMP}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/pppdump ${IDIR_PPP_MOD_PPPDUMP}/usr/sbin/

ppp-mod-pppstats-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPSTATS}/usr/sbin
	${CP} ${WRKINST}/usr/sbin/pppstats ${IDIR_PPP_MOD_PPPSTATS}/usr/sbin/

ppp-mod-pppumts-install:
	${INSTALL_DIR} ${IDIR_PPP_MOD_PPPUMTS}/etc/ppp/templates
	${INSTALL_DATA} ./files/etc/ppp/templates/umts \
		${IDIR_PPP_MOD_PPPUMTS}/etc/ppp/templates/
	$(INSTALL_DIR) ${IDIR_PPP_MOD_PPPUMTS}/etc/network/if-pre-up.d
	$(INSTALL_DIR) ${IDIR_PPP_MOD_PPPUMTS}/etc/network/if-post-down.d
	$(INSTALL_BIN) ./files/hso.if-up \
		${IDIR_PPP_MOD_PPPUMTS}/etc/network/if-pre-up.d/06-hso
	$(INSTALL_BIN) ./files/hso.if-down \
		${IDIR_PPP_MOD_PPPUMTS}/etc/network/if-post-down.d/06-hso

include ${TOPDIR}/mk/pkg-bottom.mk
