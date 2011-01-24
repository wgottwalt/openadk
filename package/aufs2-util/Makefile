# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		aufs2-util
PKG_VERSION:=		2-100111
PKG_RELEASE:=		1
PKG_MD5SUM:=		1854f5ab560dd375b22f6e2b747cb412
PKG_DESCR:=		aufs2 utilities
PKG_SECTION:=		fs
PKG_URL:=		http://aufs.sf.net/

# created from git via:
# $ git archive --format tar aufs2.1 | \
#          gzip -9 -c >../aufs2-util-2-$(date +%d%m%g).tar.gz

PKG_SITES:=		http://nwl.cc/~n0-1/
WRKDIST=		${WRKDIR}

PKG_HOST_DEPENDS:=	!cygwin !freebsd !openbsd !netbsd

PKG_SUBPKGS:=		AUFS2_UTIL LIBAU
PKGSD_LIBAU:=		aufs2 userspace library

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,AUFS2_UTIL,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,LIBAU,libau,${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_LIBAU},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		Install=install CPPFLAGS_FOR_BUILD="-I${LINUX_HEADER_DIR}/include"

post-install:
	$(INSTALL_DIR) $(IDIR_AUFS2_UTIL)/sbin
	$(INSTALL_BIN) ${WRKINST}/sbin/{{u,}mount.aufs,auplink} \
		$(IDIR_AUFS2_UTIL)/sbin
	$(INSTALL_DIR) $(IDIR_AUFS2_UTIL)/usr/bin
	$(INSTALL_BIN) ${WRKINST}/usr/bin/au{brsync,chk} \
		$(IDIR_AUFS2_UTIL)/usr/bin
	$(INSTALL_DIR) $(IDIR_AUFS2_UTIL)/etc/default
	$(INSTALL_DATA) ${WRKINST}/etc/default/aufs \
		$(IDIR_AUFS2_UTIL)/etc/default
	$(INSTALL_DIR) $(IDIR_LIBAU)/usr/lib
	${CP} ${WRKINST}/usr/lib/libau* ${IDIR_LIBAU}/usr/lib

include ${TOPDIR}/mk/pkg-bottom.mk
