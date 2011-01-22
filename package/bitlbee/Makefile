# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bitlbee
PKG_VERSION:=		1.2.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		26b9bfc5446bdf0e932e8074d117be67
PKG_DESCR:=		IRC gateway to IM chat networks
PKG_SECTION:=		chat
PKG_DEPENDS:=		glib libiconv libopenssl
PKG_BUILDDEP:=		glib libiconv openssl
PKG_URL:=		http://www.bitlbee.org/
PKG_SITES:=		http://get.bitlbee.org/src/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BITLBEE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		minimal
TARGET_CFLAGS+=		-fPIC
CONFIGURE_ARGS:=	--target=${REAL_GNU_TARGET_NAME} \
			--prefix=/usr/ \
			--bindir=/usr/sbin/ \
			--etcdir=/etc/bitlbee/ \
			--datadir=/usr/share/bitlbee/ \
			--config=/var/lib/bitlbee/ \
			--arch=Linux \
			--cpu="${ARCH}" \
			--debug=0 \
			--strip=0 \
			--ipv6=1 \
			--ssl=openssl
INSTALL_TARGET=		install-etc install-bin

post-configure:
	@echo 'CFLAGS+="-I${STAGING_TARGET_DIR}/usr/include/iconv"' >> \
		${WRKBUILD}/Makefile.settings
	@echo 'LFLAGS+=${TARGET_LDFLAGS}' >> \
		${WRKBUILD}/Makefile.settings

post-install:
	${INSTALL_DIR} ${IDIR_BITLBEE}/etc/bitlbee ${IDIR_BITLBEE}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/bitlbee/* ${IDIR_BITLBEE}/etc/bitlbee
	${INSTALL_BIN} ${WRKINST}/usr/sbin/bitlbee ${IDIR_BITLBEE}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
