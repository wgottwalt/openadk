# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		libhugetlbfs
PKG_VERSION:=		2.6
PKG_RELEASE:=		1
PKG_MD5SUM:=		cda489010e5bb89eb59994f689f8693e
PKG_DESCR:=		easy hugepage access
PKG_SECTION:=		libs
PKG_URL:=		http://libhugetlbfs.ozlabs.org/
PKG_SITES:=		${MASTER_SITE_SOURCEFORGE:=libhugetlbfs/}

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,LIBHUGETLBFS,$(PKG_NAME),$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		PREFIX=/usr DESTDIR=${WRKINST} ADK_ARCH=${CPU_ARCH}
ALL_TARGET:=		libs tools

post-install:
	$(INSTALL_DIR) $(IDIR_LIBHUGETLBFS)/usr/{bin,lib,share/libhugetlbfs/ldscripts}
	$(INSTALL_BIN) $(WRKINST)/usr/bin/{cpupcstat,huge{adm,ctl,edit},pagesize} \
		$(IDIR_LIBHUGETLBFS)/usr/bin
	${INSTALL_DATA} ${WRKINST}/usr/lib/libhugetlbfs* \
		${IDIR_LIBHUGETLBFS}/usr/lib
	${INSTALL_BIN} ${WRKINST}/usr/share/libhugetlbfs/ld.hugetlbfs \
		${IDIR_LIBHUGETLBFS}/usr/share/libhugetlbfs
	${INSTALL_DATA} ${WRKINST}/usr/share/libhugetlbfs/ldscripts/* \
		${IDIR_LIBHUGETLBFS}/usr/share/libhugetlbfs/ldscripts
	${CP} ${WRKINST}/usr/share/libhugetlbfs/ld \
		${IDIR_LIBHUGETLBFS}/usr/share/libhugetlbfs

include ${TOPDIR}/mk/pkg-bottom.mk
