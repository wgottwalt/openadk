# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		ca-certificates
PKG_VERSION:=		20141019
PKG_RELEASE:=		1
PKG_HASH:=		684902d3f4e9ad27829f4af0d9d2d588afed03667997579b9c2be86fcd1eb73a
PKG_DESCR:=		collection of common ca certificates
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		openssl-util libopenssl
PKG_URL:=		http://packages.debian.org/sid/ca-certificates
PKG_SITES:=		http://http.debian.net/debian/pool/main/c/ca-certificates/

DISTFILES:=		$(PKG_NAME)_$(PKG_VERSION).tar.xz

PKG_FLAVOURS_CA_CERTS:=	SMALL
PKGFD_SMALL:=		minimal set of CA certificates

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,CA_CERTIFICATES,ca-certificates,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION},force_etc))

CONFIG_STYLE:=		manual

ca-certificates-install:
ifeq (${ADK_PACKAGE_CA_CERTIFICATES_SMALL},y)
	${INSTALL_DIR} ${IDIR_CA_CERTIFICATES}/etc/ssl
	${INSTALL_DATA} ./extra/cert.pem ${IDIR_CA_CERTIFICATES}/etc/ssl/
else
	$(INSTALL_DIR) $(IDIR_CA_CERTIFICATES)/{etc/ssl/certs,usr/share,usr/sbin}
	$(CP) $(WRKINST)/usr/share/ca-certificates $(IDIR_CA_CERTIFICATES)/usr/share/
	( cd ${IDIR_CA_CERTIFICATES}/usr/share/ca-certificates && \
		ls */*.crt >${IDIR_CA_CERTIFICATES}/etc/ca-certificates.conf \
	)
	${INSTALL_BIN} ./extra/update-ca-certificates ${IDIR_CA_CERTIFICATES}/usr/sbin/
	-DESTDIR=${IDIR_CA_CERTIFICATES} ${BASH} ./extra/update-ca-certificates
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
