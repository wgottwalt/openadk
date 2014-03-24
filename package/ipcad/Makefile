# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		ipcad
PKG_VERSION:=		3.7.3
PKG_RELEASE:=		2
PKG_MD5SUM:=		125605249958894148ec26d3c88189f5
PKG_DESCR:=		IP Cisco Accounting Daemon
PKG_SECTION:=		net
PKG_DEPENDS:=		libpcap
PKG_BUILDDEP:=		libpcap
PKG_URL:=		http://lionet.info/ipcad
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=ipcad/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,IPCAD,ipcad,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-ifst=linux \
			--with-psrc=pcap \
			--with-pcap-include="${STAGING_TARGET_DIR}/usr/include" \
			--with-pcap-libraries="${STAGING_TARGET_DIR}/usr/lib"

pre-build:
	touch $(WRKBUILD)/cfglex.c $(WRKBUILD)/cslex.c

ipcad-install:
	${INSTALL_DIR} ${IDIR_IPCAD}/usr/bin ${IDIR_IPCAD}/etc
	${INSTALL_DATA} ${WRKINST}/etc/ipcad.conf ${IDIR_IPCAD}/etc/
	${INSTALL_BIN} ${WRKINST}/usr/bin/ipcad ${IDIR_IPCAD}/usr/bin/

include ${TOPDIR}/mk/pkg-bottom.mk
