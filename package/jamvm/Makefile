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
PKG_URL:=		http://jamvm.sourceforge.net
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=jamvm/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,JAMVM,jamvm,${PKG_VERSION}-${PKG_RELEASE}))
$(eval $(call PKG_template,JAMVM,jamvm,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CONFIGURE_ARGS+=	--libdir=$(STAGING_HOST_DIR)/usr/lib/jamvm \
			--includedir=$(STAGING_HOST_DIR)/usr/include/jamvm \
			--with-classpath-install-dir=$(STAGING_HOST_DIR)/usr

BUILD_STYLE:=		manual
INSTALL_STYLE:=		manual
CONFIGURE_ARGS+=	--enable-ffi

do-build:
	${INSTALL_DIR} ${WRKINST}/usr/bin
	${INSTALL_DIR} ${WRKINST}/usr/share/jamvm
	${MAKE} -C ${WRKBUILD}/src \
	      ${TARGET_CONFIGURE_OPTS}
	${CP} ${WRKBUILD}/src/jamvm ${WRKINST}/usr/bin
	${MAKE} -C ${WRKBUILD}/lib
	${CP} ${WRKBUILD}/lib/classes.zip ${WRKINST}/usr/share/jamvm

do-install:
	${INSTALL_DIR} ${IDIR_JAMVM}/usr/bin
	${INSTALL_DIR} ${IDIR_JAMVM}/usr/share/jamvm
	${INSTALL_BIN} ${WRKINST}/usr/bin/jamvm ${IDIR_JAMVM}/usr/bin
	${CP} ${WRKINST}/usr/share/jamvm/classes.zip \
		${IDIR_JAMVM}/usr/share/jamvm

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
