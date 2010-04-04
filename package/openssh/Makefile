# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openssh
PKG_VERSION:=		5.4p1
PKG_RELEASE:=		1
PKG_MD5SUM:=		da10af8a789fa2e83e3635f3a1b76f5e
PKG_DESCR:=		OpenSSH server
PKG_SECTION:=		net
PKG_DEPENDS:=		zlib libopenssl libpthread
PKG_BUILDDEP+=		zlib openssl
ifeq (${ADK_COMPILE_OPENSSH_WITH_KRB5},y)
PKG_DEPENDS+=		libkrb5 libcom-err
PKG_BUILDDEP+=		krb5
endif
ifeq (${ADK_COMPILE_OPENSSH_WITH_HEIMDAL},y)
PKG_DEPENDS+=		libheimdal libcom-err
PKG_BUILDDEP+=		heimdal
endif
PKG_URL:=		http://www.openssh.com
PKG_SITES:=		ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/

PKG_DESCR_CLIENT:=	OpenSSH client
PKG_DESCR_CLIENT_UTILS:=OpenSSH client utilities
PKG_DESCR_SFTP_CLIENT:=	OpenSSH sftp client
PKG_DESCR_SFTP_SERVER:=	OpenSSH sftp server

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSSH_SERVER,openssh-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,OPENSSH_CLIENT,openssh-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_CLIENT},${PKG_SECTION}))
$(eval $(call PKG_template,OPENSSH_CLIENT_UTILS,openssh-client-utils,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_CLIENT_UTILS},${PKG_SECTION}))
$(eval $(call PKG_template,OPENSSH_SFTP_CLIENT,openssh-sftp-client,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_SFTP_CLIENT},${PKG_SECTION}))
$(eval $(call PKG_template,OPENSSH_SFTP_SERVER,openssh-sftp-server,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR_SFTP_SERVER},${PKG_SECTION}))

ifeq ($(ADK_COMPILE_OPENSSH_WITH_KERBEROS),y)
CONFIGURE_ARGS+=	--with-kerberos5="${STAGING_DIR}/usr"
else
CONFIGURE_ARGS+=	--without-kerberos5
endif
CONFIGURE_ENV+=		LD='${TARGET_CC}' \
			ac_cv_func_setlogin=no \
			ac_cv_lib_nsl_yp_match=no
CONFIGURE_ARGS+=	--disable-strip \
			--disable-etc-default-login \
			--disable-lastlog \
			--disable-utmp \
			--disable-utmpx \
			--disable-wtmp \
			--disable-wtmpx \
			--without-bsd-auth \
			--without-pam \
			--without-x \
			--without-zlib-version-check \
			--sysconfdir=/etc/ssh \
			--with-privsep-user=sshd \
			--with-privsep-path=/var/run/sshd \
			--with-ssl-dir="${STAGING_DIR}/usr"

post-install:
	${INSTALL_DIR} ${IDIR_OPENSSH_SERVER}/etc/ssh
	${INSTALL_DIR} ${IDIR_OPENSSH_SERVER}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSH_SERVER}/usr/sbin
	${CP} ./files/sshd_config ${IDIR_OPENSSH_SERVER}/etc/ssh
	${INSTALL_BIN} ${WRKINST}/usr/bin/ssh-keygen \
		${IDIR_OPENSSH_SERVER}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/sbin/sshd \
	 	${IDIR_OPENSSH_SERVER}/usr/sbin
	${INSTALL_DIR} ${IDIR_OPENSSH_CLIENT}/etc/ssh
	${INSTALL_DIR} ${IDIR_OPENSSH_CLIENT}/usr/bin
	${INSTALL_DATA} ${WRKINST}/etc/ssh/ssh_config \
	    ${IDIR_OPENSSH_CLIENT}/etc/ssh
	${INSTALL_BIN} ${WRKINST}/usr/bin/{ssh,scp} \
	    ${IDIR_OPENSSH_CLIENT}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSH_CLIENT_UTILS}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/ssh-{add,agent,keyscan} \
	    ${IDIR_OPENSSH_CLIENT_UTILS}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSH_SFTP_CLIENT}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSH_SFTP_SERVER}/usr/sbin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sftp \
		${IDIR_OPENSSH_SFTP_CLIENT}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSH_SFTP_SERVER}/usr/libexec
	${INSTALL_BIN} ${WRKINST}/usr/libexec/sftp-server \
		${IDIR_OPENSSH_SFTP_SERVER}/usr/libexec
	chmod 0700 {${IDIR_OPENSSH_CLIENT},${IDIR_OPENSSH_SERVER}}/etc/ssh

include ${TOPDIR}/mk/pkg-bottom.mk
