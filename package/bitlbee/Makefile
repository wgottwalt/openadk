# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		bitlbee
PKG_VERSION:=		1.2.3
PKG_RELEASE:=		1
PKG_BUILDDEP+=		libiconv openssl glib
PKG_MD5SUM:=		2b1674d98804970809de3da3edf0bed2
PKG_DESCR:=		IRC gateway to IM chat networks
PKG_SECTION:=		net
PKG_DEPENDS:=		glib libopenssl libiconv
PKG_URL:=		http://www.bitlbee.org
PKG_SITES:=		http://get.bitlbee.org/src/ \
			http://get.bitlbee.be/src/ \
			http://get.us.bitlbee.org/src/ \
			http://ftp.snt.utwente.nl/pub/software/bitlbee/src/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,BITLBEE,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

do-configure:
		(cd $(WRKBUILD); \
			$(TARGET_CONFIGURE_OPTS) \
			CFLAGS="$(TARGET_CFLAGS) -fPIC" \
			CPPFLAGS="-I$(STAGING_DIR)/usr/include" \
			LDFLAGS="-L$(STAGING_DIR)/usr/lib" \
			STAGING_DIR="$(STAGING_DIR)" \
			STRIP="$(STRIP)" \
			./configure \
			--target=${REAL_GNU_TARGET_NAME} \
			--prefix=/usr/ \
			--bindir=/usr/sbin/ \
			--etcdir=/etc/bitlbee/ \
			--datadir=/usr/share/bitlbee/ \
			--config=/var/lib/bitlbee/ \
			--arch=Linux \
			--cpu="${ARCH}" \
			--debug=0 \
			--strip=1 \
			--ipv6=1 \
			--ssl=openssl \
		);

BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto
INSTALL_TARGET=		install-etc install-bin

post-configure:
	@echo 'CFLAGS+="-I${STAGING_DIR}/usr/include/iconv"' >> \
		${WRKBUILD}/Makefile.settings
	@echo 'LFLAGS+="-L${STAGING_DIR}/usr/lib/iconv"' >> \
		${WRKBUILD}/Makefile.settings

post-install:
	${INSTALL_DIR} ${IDIR_BITLBEE}/etc/bitlbee ${IDIR_BITLBEE}/usr/sbin
	${INSTALL_DATA} ${WRKINST}/etc/bitlbee/* ${IDIR_BITLBEE}/etc/bitlbee
	${INSTALL_BIN} ${WRKINST}/usr/sbin/bitlbee ${IDIR_BITLBEE}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
