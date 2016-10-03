# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		jamvm
PKG_VERSION:=		2.0.0
PKG_RELEASE:=		1
PKG_HASH:=		76428e96df0ae9dd964c7a7c74c1e9a837e2f312c39e9a357fa8178f7eff80da
PKG_DESCR:=		java virtual machine implementation
PKG_SECTION:=		dev/lang
PKG_DEPENDS:=		libffi zlib
PKG_BUILDDEP:=		libffi zlib
PKG_NEEDS:=		threads
PKG_URL:=		http://jamvm.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=jamvm/}

# use of deprecated swp{b}
PKG_SYSTEM_DEPENDS:=	!raspberry-pi3

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,JAMVM,jamvm,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,JAMVM,jamvm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CONFIGURE_ARGS+=	--libdir=$(STAGING_HOST_DIR)/usr/lib/jamvm \
			--includedir=$(STAGING_HOST_DIR)/usr/include/jamvm \
			--with-classpath-install-dir=$(STAGING_HOST_DIR)/usr

CONFIGURE_ARGS+=	--enable-ffi

jamvm-install:
	${INSTALL_DIR} ${IDIR_JAMVM}/usr/bin
	${INSTALL_DIR} ${IDIR_JAMVM}/usr/lib
	${INSTALL_DIR} ${IDIR_JAMVM}/usr/share/jamvm
	${INSTALL_BIN} ${WRKINST}/usr/bin/jamvm \
		${IDIR_JAMVM}/usr/bin
	${CP} ${WRKINST}/usr/share/jamvm/classes.zip \
		${IDIR_JAMVM}/usr/share/jamvm
	$(CP) ${WRKINST}/usr/lib/libjvm.so \
		${IDIR_JAMVM}/usr/lib
	$(CP) ${WRKINST}/usr/lib/rt.jar \
		${IDIR_JAMVM}/usr/lib

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
