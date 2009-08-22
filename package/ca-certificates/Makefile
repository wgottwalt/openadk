# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		ca-certificates
PKG_VERSION:=		20090814
PKG_RELEASE:=		1
PKG_MD5SUM:=		307052c985bec7f9a00eb84293eef779
PKG_DESCR:=		Collection of common CA certificates
PKG_SECTION:=		shells
PKG_URL:=		http://packages.debian.org/sid/ca-certificates
PKG_SITES:=		http://ftp.debian.org/debian/pool/main/c/ca-certificates/

DISTFILES:=		${PKG_NAME}_${PKG_VERSION}.tar.gz

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CA_CERTS,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

BUILD_STYLE=		auto
INSTALL_STYLE=		auto


post-install:
ifeq (${ADK_DO_MINIMAL_CA_CERTS},n)
	$(INSTALL_DIR) $(IDIR_CA_CERTS)/{etc/ssl/certs,usr/share,usr/sbin}
	$(CP) $(WRKINST)/usr/share/ca-certificates $(IDIR_CA_CERTS)/usr/share/
	( cd ${IDIR_CA_CERTS}/usr/share/ca-certificates && \
		ls */*.crt >${IDIR_CA_CERTS}/etc/ca-certificates.conf \
	)
	${INSTALL_BIN} ./extra/update-ca-certificates ${IDIR_CA_CERTS}/usr/sbin/
	-DESTDIR=${IDIR_CA_CERTS} sh ./extra/update-ca-certificates
else
	${INSTALL_DIR} ${IDIR_CA_CERTS}/etc/ssl
	${INSTALL_DATA} ./cert.pem ${IDIR_CA_CERTS}/etc/ssl/
endif


include ${TOPDIR}/mk/pkg-bottom.mk
