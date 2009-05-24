# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mini-httpd
PKG_VERSION:=		1.19
PKG_RELEASE:=		10
PKG_MD5SUM:=		7c68293ad265ecfe2edea917912f6f1f
MASTER_SITES:=		http://www.acme.com/software/mini_httpd/
DISTFILES:=		mini_httpd-${PKG_VERSION}.tar.gz
WRKDIST=		${WRKDIR}/mini_httpd-${PKG_VERSION}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MINI_HTTPD,mini-httpd,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,MINI_HTTPD_HTPASSWD,mini-httpd-htpasswd,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,MINI_HTTPD_OPENSSL,mini-httpd-openssl,${PKG_VERSION}-${PKG_RELEASE}))

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
	${INSTALL_DIR} ${IDIR_MINI_HTTPD}/etc/init.d
	${INSTALL_DATA} ./files/mini_httpd.conf ${IDIR_MINI_HTTPD}/etc/mini_httpd.conf
	${INSTALL_BIN} ./files/mini_httpd.init ${IDIR_MINI_HTTPD}/etc/init.d/mini_httpd
	${INSTALL_DIR} ${IDIR_MINI_HTTPD}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/mini_httpd ${IDIR_MINI_HTTPD}/usr/sbin/
	${INSTALL_DIR} ${IDIR_MINI_HTTPD_HTPASSWD}/usr/sbin
	install -m0755 ${WRKBUILD}/htpasswd ${IDIR_MINI_HTTPD_HTPASSWD}/usr/sbin/
endif
	# with OpenSSL
ifneq (${ADK_PACKAGE_MINI_HTTPD_OPENSSL},)
	${INSTALL_DIR} ${IDIR_MINI_HTTPD_OPENSSL}/etc/init.d
	${INSTALL_DATA} ./files/mini_httpd-ssl.conf ${IDIR_MINI_HTTPD_OPENSSL}/etc/mini_httpd.conf
	install -m0600 ./files/mini_httpd.pem ${IDIR_MINI_HTTPD_OPENSSL}/etc/
	${INSTALL_BIN} ./files/mini_httpd.init \
		${IDIR_MINI_HTTPD_OPENSSL}/etc/init.d/mini_httpd
	${INSTALL_DIR} ${IDIR_MINI_HTTPD_OPENSSL}/usr/sbin
	${INSTALL_BIN} ${WRKBUILD}/mini_httpd-openssl ${IDIR_MINI_HTTPD_OPENSSL}/usr/sbin/mini_httpd
endif

include ${TOPDIR}/mk/pkg-bottom.mk
