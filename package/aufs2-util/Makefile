# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		aufs2-util
PKG_VERSION:=		2-301210
PKG_RELEASE:=		1
PKG_MD5SUM:=		83b07d6a6d43362dfc234ecff11367f3
PKG_DESCR:=		aufs2 utilities
PKG_SECTION:=		fs
PKG_URL:=		http://aufs.sf.net/

# created from git via:
# $ git archive --format tar origin/aufs2 | \
#          gzip -9 -c >aufs2-util-2-$(date +%d%m%g).tar.gz

PKG_SITES:=		http://nwl.cc/~n0-1/
WRKDIST=		${WRKDIR}

PKG_HOST_DEPENDS:=	!cygwin !freebsd !openbsd !netbsd

PKG_SUBPKGS:=		AUFS2_UTIL LIBAU
PKGSD_LIBAU:=		aufs2 userspace library

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUFS2_UTIL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBAU,libau,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBAU},${PKG_SECTION}))

CONFIG_STYLE:=		manual
TCFLAGS+=		-I${LINUX_DIR}/include
XAKE_FLAGS+=		Install=install

post-install:
	$(INSTALL_DIR) $(IDIR_AUFS2_UTIL)/sbin
	$(INSTALL_BIN) ${WRKINST}/sbin/{{u,}mount.aufs,auplink} \
		$(IDIR_AUFS2_UTIL)/sbin
	$(INSTALL_DIR) $(IDIR_AUFS2_UTIL)/usr/bin
	$(INSTALL_BIN) ${WRKINST}/usr/bin/au{brsync,chk} \
		$(IDIR_AUFS2_UTIL)/usr/bin
	$(INSTALL_DIR) $(IDIR_AUFS2_UTIL)/etc/default
	$(INSTALL_BIN) ${WRKINST}/etc/default/aufs \
		$(IDIR_AUFS2_UTIL)/etc/default
	$(INSTALL_DIR) $(IDIR_LIBAU)/usr/lib
	${CP} ${WRKINST}/usr/lib/libau* ${IDIR_LIBAU}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
