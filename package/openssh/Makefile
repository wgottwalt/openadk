# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		openssh
PKG_VERSION:=		5.2p1
PKG_RELEASE:=		1
PKG_MD5SUM:=		ada79c7328a8551bdf55c95e631e7dad
MASTER_SITES:=		ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/ \
			ftp://openbsd.wiretapped.net/pub/OpenBSD/OpenSSH/portable/ \
			ftp://ftp.belnet.be/packages/openbsd/OpenSSH/portable/ \
			ftp://ftp.de.openbsd.org/pub/unix/OpenBSD/OpenSSH/portable/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,OPENSSH_CLIENT,openssh-client,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,OPENSSH_CLIENT_UTILS,openssh-client-utils,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,OPENSSH_SERVER,openssh-server,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,OPENSSH_SFTP_CLIENT,openssh-sftp-client,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))
$(eval $(call PKG_template,OPENSSH_SFTP_SERVER,openssh-sftp-server,${PKG_VERSION}-${PKG_RELEASE},${ARCH}))

PKG_DEPENDS:=		zlib, libopenssl,

ifeq ($(ADK_COMPILE_OPENSSH_WITH_KERBEROS),y)
CONFIGURE_ARGS+=	--with-kerberos5="${STAGING_DIR}/usr"
PKG_DEPENDS+=		heimdal-libs
else
CONFIGURE_ARGS+=	--without-kerberos5
endif
CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		LD='${TARGET_CC}' \
			ac_cv_func_setlogin=no
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
			--with-privsep-path=/var/run/sshd
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_OPENSSH_SERVER}/etc/ssh
	${INSTALL_DIR} ${IDIR_OPENSSH_SERVER}/etc/init.d
	${INSTALL_DIR} ${IDIR_OPENSSH_SERVER}/usr/bin
	${INSTALL_DIR} ${IDIR_OPENSSH_SERVER}/usr/sbin
	${INSTALL_SCRIPT} files/sshd.init \
	    ${IDIR_OPENSSH_SERVER}/etc/init.d/sshd
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
	${INSTALL_BIN} ${WRKINST}/usr/sbin/sftp-server \
		${IDIR_OPENSSH_SFTP_SERVER}/usr/sbin
	chmod 0700 {${IDIR_OPENSSH_CLIENT},${IDIR_OPENSSH_SERVER}}/etc/ssh
	echo 'Depends: ${PKG_DEPENDS}' >>${IDIR_OPENSSH_SERVER}/CONTROL/control

include ${TOPDIR}/mk/pkg-bottom.mk
