# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mini-httpd
PKG_VERSION:=		1.19
PKG_RELEASE:=		10
PKG_MD5SUM:=		7c68293ad265ecfe2edea917912f6f1f
PKG_DESCR:=		A small HTTP server
PKG_MULTI:=		1
PKG_SECTION:=		www
ifneq ($(ADK_PACKAGE_MINI_HTTPD_OPENSSL),)
PKG_DEPENDS:=		libopenssl
PKG_BUILDDEP+=		openssl
endif
PKG_URL:=		http://www.acme.com/software/mini_httpd
PKG_SITES:=		http://www.acme.com/software/mini_httpd/

PKG_DESCR_1:=		htpasswd utility
PKG_DESCR_2:=		A small HTTP server with SSL support

DISTFILES:=		mini_httpd-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/mini_httpd-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MINI_HTTPD,mini-httpd,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,MINI_HTTPD_HTPASSWD,mini-httpd-htpasswd,${PKG_VERSION}-${PKG_RELEASE},,${PKG_DESCR_1},${PKG_SECTION}))
$(eval $(call PKG_template,MINI_HTTPD_OPENSSL,mini-httpd-openssl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_2},${PKG_SECTION}))

CONFIG_STYLE:=		manual
BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual

do-build:
	# with OpenSSL
ifneq (${ADK_PACKAGE_MINI_HTTPD_OPENSSL},)
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" \
		SSL_DEFS="-DUSE_SSL -DHAVE_OPENSSL" \
		SSL_INC="-I${STAGING_DIR}/usr/include" \
		SSL_LIBS="-L${STAGING_DIR}/usr/lib -lssl -lcrypto" \
		all
	(cd ${WRKBUILD}; mv mini_httpd mini_httpd-openssl; )
	${MAKE} -C ${WRKBUILD} clean
endif
	# without SSL
ifneq (${ADK_PACKAGE_MINI_HTTPD},)
	${MAKE} -C ${WRKBUILD} \
		CC="${TARGET_CC}" \
		all
endif

do-install:
	# without SSL
ifneq (${ADK_PACKAGE_MINI_HTTPD},)
	${INSTALL_DIR} ${IDIR_MINI_HTTPD}/etc
	${INSTALL_DATA} ./files/mini_httpd.conf \
		${IDIR_MINI_HTTPD}/etc/mini_httpd.conf
	${INSTALL_DIR} ${IDIR_MINI_HTTPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/mini_httpd ${IDIR_MINI_HTTPD}/usr/sbin/
	${INSTALL_DIR} ${IDIR_MINI_HTTPD_HTPASSWD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/htpasswd \
		${IDIR_MINI_HTTPD_HTPASSWD}/usr/sbin/
endif
	# with OpenSSL
ifneq (${ADK_PACKAGE_MINI_HTTPD_OPENSSL},)
	${INSTALL_DIR} ${IDIR_MINI_HTTPD_OPENSSL}/etc
	${INSTALL_DATA} ./files/mini_httpd-ssl.conf \
		${IDIR_MINI_HTTPD_OPENSSL}/etc/mini_httpd.conf
	install -m0600 ./files/mini_httpd.pem ${IDIR_MINI_HTTPD_OPENSSL}/etc/
	${INSTALL_DIR} ${IDIR_MINI_HTTPD_OPENSSL}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/mini_httpd-openssl \
		${IDIR_MINI_HTTPD_OPENSSL}/usr/sbin/mini_httpd
endif

include ${TOPDIR}/mk/pkg-bottom.mk
