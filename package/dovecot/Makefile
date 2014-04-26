# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dovecot
PKG_VERSION:=		2.2.12
PKG_RELEASE:=		1
PKG_MD5SUM:=		25395269fa2e0525e2d144d71d0450eb
PKG_DESCR:=		minimal and secure imap server
PKG_BUILDDEP:=		openssl
PKG_DEPENDS:=		libopenssl
PKG_SECTION:=		mail
PKG_URL:=		http://www.dovecot.org/
PKG_SITES:=		http://www.dovecot.org/releases/2.2/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DOVECOT,dovecot,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		RPCGEN='' \
			ignore_signed_size=1 \
			signed_size_t=no \
			gmtime_max_time_t=32 \
			fd_passing=yes \
			lib_cv_va_copy=yes \
			lib_cv___va_copy=yes \
			lib_cv_va_val_copy=yes \
			mmap_plays_with_write=yes \
			i_cv_gmtime_max_time_t=31 \
			i_cv_posix_fallocate_works=no \
			i_cv_epoll_works=yes \
			i_cv_signed_time_t=yes \
			i_cv_mmap_plays_with_write=yes \
			i_cv_signed_size_t=yes \
			i_cv_c99_vsnprintf=yes \
			i_cv_fd_passing=yes
CONFIGURE_ARGS+=	--with-notify=none \
			--without-gssapi \
			--without-pam \
			--with-ioloop=epoll \
                	--with-moduledir=/usr/lib/dovecot/modules \
			--with-ssl=openssl

dovecot-install:
	${INSTALL_DIR} ${IDIR_DOVECOT}/etc
	${INSTALL_DIR} ${IDIR_DOVECOT}/usr/sbin
	${INSTALL_DIR} ${IDIR_DOVECOT}/usr/libexec/dovecot
	${INSTALL_DIR} ${IDIR_DOVECOT}/usr/lib/dovecot/modules
	${INSTALL_DATA} ./files/dovecot.conf ${IDIR_DOVECOT}/etc
	$(CP) ${WRKINST}/usr/lib/dovecot/modules/*.so \
		${IDIR_DOVECOT}/usr/lib/dovecot/modules/
	$(CP) ${WRKINST}/usr/libexec/dovecot/* \
		${IDIR_DOVECOT}/usr/libexec/dovecot/
	$(INSTALL_BIN) ${WRKINST}/usr/sbin/dovecot* \
		${IDIR_DOVECOT}/usr/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
