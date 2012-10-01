# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${TOPDIR}/rules.mk

PKG_NAME:=		subversion
PKG_VERSION:=		1.7.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		bf8ce4b6bd8d807719a531d01a605bef
PKG_DESCR:=		revision control program
PKG_SECTION:=		scm
PKG_DEPENDS:=		zlib apr apr-util libiconv libexpat libsqlite neon
PKG_BUILDDEP:=		apr-util expat apr zlib libiconv sqlite neon
PKG_SITES:=		http://apache.lauf-forum.at/subversion/
PKG_URL:=		http://subversion.apache.org/

include ${TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SUBVERSION,subversion,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ARGS+=	--with-apr=${STAGING_TARGET_DIR}/usr/bin/apr-1-config \
			--with-apr-util=${STAGING_TARGET_DIR}/usr/bin/apr-1-config \
			--with-neon=${STAGING_TARGET_DIR}/usr \
			--disable-mod-activation \
			--disable-keychain \
			--without-apxs \
			--without-swig \
			--disable-experimental-libtool \
			--without-jikes \
			--without-jdk \
			--disable-javahl \
			--without-berkeley-db
CONFIGURE_ENV+=		LIBS='-lsqlite3 -laprutil-1 -lapr-1 -lexpat -liconv'
INSTALL_TARGET:=	external-install local-install

subversion-install:
	${INSTALL_DIR} ${IDIR_SUBVERSION}/usr/{bin,lib}
	${INSTALL_BIN} ${WRKINST}/usr/bin/svn ${IDIR_SUBVERSION}/usr/bin
	${CP} ${WRKINST}/usr/lib/libsvn*.so* ${IDIR_SUBVERSION}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
