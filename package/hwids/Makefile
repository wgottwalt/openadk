# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		hwids
PKG_VERSION:=		20150129
PKG_RELEASE:=		1
PKG_HASH:=		33a7f4dbf14704076b0fe1d0052e86bb618e386a1ff18107097311df44f979d7
PKG_DESCR:=		Combined repository of pci.ids and usb.ids
PKG_SECTION:=		sys/hw
PKG_URL:=		https://github.com/gentoo/hwids
PKG_SITES:=		https://github.com/gentoo/hwids/archive/
DISTFILES:=             ${PKG_NAME}-${PKG_VERSION}.tar.gz

# typical problem of having tags like '<name>-<version>' in github
WRKDIST=		${WRKDIR}/${PKG_NAME}-${PKG_NAME}-${PKG_VERSION}

PKG_SUBPKGS:=		HWIDS_NET HWIDS_PCI HWIDS_USB
PKGSD_HWIDS_NET:=	HWIDS files oui.txt and iab.txt
PKGSD_HWIDS_PCI:=	HWIDS file pci.ids
PKGSD_HWIDS_USB:=	HWIDS file usb.ids

PKG_FLAVOURS_PKGNAME:=	WITH_GZIP
PKGFD_WITH_GZIP:=	gzip pci.ids and usb.ids before installation

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,HWIDS_NET,hwids-net,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_HWIDS_NET},${PKG_SECTION}))
$(eval $(call PKG_template,HWIDS_PCI,hwids-pci,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_HWIDS_PCI},${PKG_SECTION}))
$(eval $(call PKG_template,HWIDS_USB,hwids-usb,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_HWIDS_USB},${PKG_SECTION}))

CONFIG_STYLE:=		manual
XAKE_FLAGS+=		NET=yes \
			PCI=yes \
			UDEV=no \
			USB=yes
# note: Can't pass GZIP=yes to make, as this will turn it
#       into an env var automatically which makes gzip trip.
#       Therefore assume here that GZIP=yes is the default.
ifneq (${ADK_PACKAGE_HWIDS_WITH_GZIP},y)
XAKE_FLAGS+=		GZIP=no
endif

define HWIDS_INSTALL_template
$(2)-install:
	$${INSTALL_DIR} $${IDIR_$(1)}/usr/share/misc
	$${INSTALL_DATA} $$(patsubst %,$${WRKINST}/usr/share/misc/%,$(3)) \
		$${IDIR_$(1)}/usr/share/misc/
endef

$(eval $(call HWIDS_INSTALL_template,HWIDS_NET,hwids-net,oui.txt iab.txt))
ifeq (${ADK_PACKAGE_HWIDS_WITH_GZIP},y)
$(eval $(call HWIDS_INSTALL_template,HWIDS_PCI,hwids-pci,pci.ids.gz))
$(eval $(call HWIDS_INSTALL_template,HWIDS_USB,hwids-usb,usb.ids.gz))
else
$(eval $(call HWIDS_INSTALL_template,HWIDS_PCI,hwids-pci,pci.ids))
$(eval $(call HWIDS_INSTALL_template,HWIDS_USB,hwids-usb,usb.ids))
endif

include ${ADK_TOPDIR}/mk/pkg-bottom.mk
