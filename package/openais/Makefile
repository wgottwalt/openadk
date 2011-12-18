# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		openais
PKG_VERSION:=		1.1.4
PKG_RELEASE:=		1
PKG_MD5SUM:=		e500ad3c49fdc45d8653f864e80ed82c
PKG_DESCR:=		AIS implementation
PKG_SECTION:=		ha
PKG_BUILDDEP:=		corosync
PKG_DEPENDS:=		corosync
PKG_URL:=		http://www.openais.org/
PKG_SITES:=		ftp://ftp:download@ftp.openais.org/downloads/openais-1.1.4/

PKG_ARCH_DEPENDS:=	!avr32

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,OPENAIS,openais,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

CONFIGURE_ENV+=		ac_cv_func_fnmatch_works=yes

openais-install:
	$(INSTALL_DIR) $(IDIR_OPENAIS)/usr/lib
	$(CP) $(WRKINST)/usr/lib/lib*.so* \
		$(IDIR_OPENAIS)/usr/lib
	$(INSTALL_DIR) $(IDIR_OPENAIS)/usr/sbin
	$(CP) $(WRKINST)/usr/sbin/* \
		$(IDIR_OPENAIS)/usr/sbin
	$(INSTALL_DIR) $(IDIR_OPENAIS)/usr/libexec
	$(CP) $(WRKINST)/usr/libexec/* \
		$(IDIR_OPENAIS)/usr/libexec

include ${TOPDIR}/mk/pkg-bottom.mk
