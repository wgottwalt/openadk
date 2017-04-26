# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include ${ADK_TOPDIR}/rules.mk

PKG_NAME:=		autoconf
PKG_VERSION:=		2.13
PKG_RELEASE:=		2
PKG_HASH:=		f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e
PKG_DESCR:=		automatically configure software source code packages
PKG_SECTION:=		dev/tools
HOST_BUILDDEP:=		m4-host
PKG_URL:=		http://www.gnu.org/software/autoconf/
PKG_SITES:=		${MASTER_SITE_GNU:=autoconf/}
PKG_OPTS:=		noscripts

PKG_CFLINE_AUTOCONF:=	depends on ADK_HOST_ONLY

DISTFILES:=		$(PKG_NAME)-$(PKG_VERSION).tar.gz

include ${ADK_TOPDIR}/mk/host.mk
include ${ADK_TOPDIR}/mk/package.mk

$(eval $(call HOST_template,AUTOCONF_OLD,autoconf-old,${PKG_VERSION}-${PKG_RELEASE}))

HOST_CONFIGURE_ARGS+=	--program-suffix=2.13

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
