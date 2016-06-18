# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		sispmctl
PKG_VERSION:=		4.0
PKG_RELEASE:=		1
PKG_HASH:=		442d9bb9774da7214c222144035ac68ad5d25171040ce2731cfdf49b3365cfd5
PKG_DESCR:=		control application for power sockets
PKG_SECTION:=		sys/hw
PKG_DEPENDS:=		libusb libusb-compat
PKG_BUILDDEP:=		libusb libusb-compat
PKG_URL:=		http://sispmctl.sourceforge.net/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=sispmctl/}

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call PKG_template,SISPMCTL,sispmctl,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=         ac_cv_func_malloc_0_nonnull=yes \
			ac_cv_func_realloc_0_nonnull=yes

sispmctl-install:
	${INSTALL_DIR} ${IDIR_SISPMCTL}/usr/bin
	${INSTALL_BIN} ${WRKINST}/usr/bin/sispmctl ${IDIR_SISPMCTL}/usr/bin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
