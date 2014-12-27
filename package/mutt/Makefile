# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		mutt
PKG_VERSION:=		1.5.23
PKG_RELEASE:=		1
PKG_HASH:=		3af0701e57b9e1880ed3a0dee34498a228939e854a16cdccd24e5e502626fd37
PKG_DESCR:=		mail text client
PKG_SECTION:=		net/mail
PKG_DEPENDS:=		libncurses libopenssl
PKG_BUILDDEP:=		ncurses openssl
PKG_URL:=		http://www.mutt.org/
PKG_SITES:=		ftp://ftp.mutt.org/mutt/devel/ \
			http://ftp.hi.is/pub/mutt/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,MUTT,mutt,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

TARGET_LDFLAGS+=	-ltinfo
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

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
