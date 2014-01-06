# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		mutt
PKG_VERSION:=		1.5.20
PKG_RELEASE:=		2
PKG_MD5SUM:=		027cdd9959203de0c3c64149a7ee351c
PKG_DESCR:=		Mail text client
PKG_SECTION:=		mail
PKG_DEPENDS:=		libncurses libopenssl
PKG_BUILDDEP:=		ncurses openssl
PKG_URL:=		http://www.mutt.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=mutt/}

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MUTT,mutt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-tinfo
CONFIGURE_ARGS+=	--includedir=${WRKBUILD}/. \
			--oldincludedir=${WRKBUILD}/. \
			--with-homespool="~/Maildir" \
			--enable-pop \
			--enable-imap \
			--with-ssl

mutt-install:
	${INSTALL_DIR} ${IDIR_MUTT}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/mutt ${IDIR_MUTT}/usr/bin/
ifeq (${ADK_PACKAGE_GPG},y)
	${INSTALL_BIN} ${WRKINST}/usr/bin/pgpewrap ${IDIR_MUTT}/usr/bin/
endif

include ${TOPDIR}/mk/pkg-bottom.mk
