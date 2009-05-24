# $Id$
#-
# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		dovecot
PKG_VERSION:=		1.1.14
PKG_RELEASE:=		1
PKG_MD5SUM:=		60b1deccc0ae77e5669060d2b1894e5e
MASTER_SITES:=		http://www.dovecot.org/releases/1.1/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,DOVECOT,dovecot,${PKG_VERSION}-${PKG_RELEASE}))

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		ignore_signed_size=1 \
			have_rquota=no \
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
			--with-ssl \
                	--with-moduledir=/usr/lib/dovecot/modules
BUILD_STYLE:=		auto
INSTALL_STYLE:=		auto

post-install:
	${INSTALL_DIR} ${IDIR_DOVECOT}/etc
	${INSTALL_DIR} ${IDIR_DOVECOT}/usr/sbin/dovecot
	${INSTALL_DATA} ./files/dovecot.conf ${IDIR_DOVECOT}/etc
	${INSTALL_DIR} ${IDIR_DOVECOT}/usr/lib/dovecot/modules/{imap,lda,pop3}
	$(CP) ${WRKINST}/usr/lib/dovecot/modules/*.so \
		${IDIR_DOVECOT}/usr/lib/dovecot/modules/
	$(CP) ${WRKINST}/usr/lib/dovecot/modules/imap/*.so \
		${IDIR_DOVECOT}/usr/lib/dovecot/modules/imap/
	$(CP) ${WRKINST}/usr/lib/dovecot/modules/lda/*.so \
		${IDIR_DOVECOT}/usr/lib/dovecot/modules/lda/
	$(CP) ${WRKINST}/usr/lib/dovecot/modules/pop3/*.so \
		${IDIR_DOVECOT}/usr/lib/dovecot/modules/pop3/
	$(CP) ${WRKINST}/usr/sbin/dovecot/* \
	    ${IDIR_DOVECOT}/usr/sbin/dovecot/

include ${TOPDIR}/mk/pkg-bottom.mk
