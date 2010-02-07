# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libpcap
PKG_VERSION:=		1.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		9ad1358c5dec48456405eac197a46d3d
PKG_DESCR:=		a low-level packet capture library
PKG_SECTION:=		libs
PKG_URL:=		http://www.tcpdump.org
PKG_SITES:=		http://www.tcpdump.org/release/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBPCAP,${PKG_NAME},$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_linux_vers=26
CONFIGURE_ARGS+=	--disable-yydebug \
			--with-build-cc=$(HOSTCC) \
			--with-pcap=linux
TCFLAGS+=		${TCPPFLAGS}
INSTALL_TARGET=		install install-shared

post-install:
	${INSTALL_DIR} ${IDIR_LIBPCAP}/usr/lib/
	${CP} ${WRKINST}/usr/lib/libpcap.so* ${IDIR_LIBPCAP}/usr/lib/

include ${TOPDIR}/mk/pkg-bottom.mk
