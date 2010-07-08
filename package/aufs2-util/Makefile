# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		aufs2-util
PKG_VERSION:=		130809
PKG_RELEASE:=		1
PKG_DESCR:=		aufs2 utilities
PKG_SECTION:=		fs
PKG_URL:=		http://aufs.sf.net/
PKG_HOST_DEPENDS:=	!cygwin !freebsd !openbsd !netbsd

NO_DISTFILES:=		1

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUFS2_UTIL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
MAKE_FLAGS+=		KDIR=${LINUX_DIR}

post-install:
	$(INSTALL_DIR) $(IDIR_AUFS2_UTIL)/sbin
	$(INSTALL_BIN) ${WRKINST}/sbin/{u,}mount.aufs \
		$(IDIR_AUFS2_UTIL)/sbin

include ${TOPDIR}/mk/pkg-bottom.mk
