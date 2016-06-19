# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		gnupg2
PKG_VERSION:=		2.1.13
PKG_RELEASE:=		1
PKG_HASH:=		4f9d83a6221daa60130fa79f0b1d37d6c20fffdd0320b640c7a597c5b6219675
PKG_DESCR:=		gnu privacy guard (modern)
PKG_SECTION:=		app/crypto
PKG_DEPENDS:=		libreadline libncurses libgcrypt libgpg-error libassuan
PKG_DEPENDS+=		libksba npth
PKG_BUILDDEP:=		readline ncurses libgcrypt libgpg-error libassuan
PKG_BUILDDEP+=		libksba npth
PKG_URL:=		http://www.gnupg.org/
PKG_SITES:=		ftp://ftp.gnupg.org/gcrypt/gnupg/

DISTFILES:=		gnupg-$(PKG_VERSION).tar.bz2
WRKDIST=		${WRKDIR}/gnupg-${PKG_VERSION}

PKG_SUBPKGS:=		GNUPG2 GPGV2
 
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,GNUPG2,gnupg2,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))
$(eval $(call PKG_template,GPGV2,gpgv2,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

CONFIGURE_ARGS+=	--disable-asm \
			--disable-dirmngr \
			--disable-dns-srv \
			--disable-gnupg-iconv \
			--disable-card-support \
			--disable-agent-support \
			--disable-bzip2 \
			--disable-exec \
			--disable-ldap \
			--disable-hkp \
			--disable-finger \
			--disable-dns-srv \
			--disable-rpath \
			--disable-regex

gpgv2-install:
	$(INSTALL_DIR) $(IDIR_GPGV2)/usr/bin
	$(INSTALL_BIN) $(WRKBUILD)/g10/gpgv \
		$(IDIR_GPGV2)/usr/bin

gnupg2-install:
	$(INSTALL_DIR) $(IDIR_GNUPG2)/usr/bin/
	$(INSTALL_BIN) $(WRKBUILD)/g10/gpg $(IDIR_GNUPG2)/usr/bin/
	# we need root privileges for secure memory (locked pages)
	chmod u+s $(IDIR_GNUPG2)/usr/bin/gpg

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
