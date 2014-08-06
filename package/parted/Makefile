# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		parted
PKG_VERSION:=		3.2
PKG_RELEASE:=		1
PKG_MD5SUM:=		0247b6a7b314f8edeb618159fa95f9cb
PKG_DESCR:=		partition table editor
PKG_SECTION:=		sys/fs
PKG_DEPENDS:=		libblkid libuuid libreadline libpthread
PKG_DEPENDS+=		libdevmapper
PKG_BUILDDEP:=		util-linux readline lvm
PKG_URL:=		http://www.gnu.org/software/parted/index.shtml
PKG_SITES:=		${MASTER_SITE_GNU:=parted/}

PKG_BUILDDEP_UCLIBC:=	libiconv-tiny
PKG_BUILDDEP_UCLIBC_NG:=libiconv-tiny

include $(ADK_TOPDIR)/mk/package.mk

ifeq ($(ADK_TARGET_LIB_UCLIBC)$(ADK_TARGET_LIB_UCLIBC_NG),y)
TARGET_LDFLAGS+=	-liconv
endif

$(eval $(call PKG_template,PARTED,parted,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

parted-install:
	${INSTALL_DIR} $(IDIR_PARTED)/usr/sbin $(IDIR_PARTED)/usr/lib
	${CP} $(WRKINST)/usr/lib/libparted*so* $(IDIR_PARTED)/usr/lib
	${INSTALL_BIN} $(WRKINST)/usr/sbin/parted $(IDIR_PARTED)/usr/sbin

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
