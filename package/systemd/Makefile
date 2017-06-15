# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		systemd
PKG_VERSION:=		233
PKG_RELEASE:=		1
PKG_HASH:=		8b3e99da3d4164b66581830a7f2436c0c8fe697b5fbdc3927bdb960646be0083
PKG_DESCR:=		system and service manager
PKG_SECTION:=		base/init
PKG_DEPENDS:=		libcap libmount libuuid libblkid libncurses libkmod
PKG_BUILDDEP:=		intltool-host gperf-host libcap util-linux gettext-host kmod
PKG_KDEPENDS:=		cgroups namespaces fhandle tmpfs-posix-acl tmpfs-xattr
PKG_URL:=		https://wiki.freedesktop.org/www/Software/systemd/
PKG_SITES:=		https://github.com/systemd/systemd/archive/

PKG_CFLINE_SYSTEMD:=	select BUSYBOX_SULOGIN
PKG_LIBC_DEPENDS:=	!musl

DISTFILES:=             v$(PKG_VERSION).tar.gz

include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call PKG_template,SYSTEMD,systemd,$(PKG_VERSION)-$(PKG_RELEASE),$(PKG_DEPENDS),$(PKG_DESCR),$(PKG_SECTION)))

XAKE_FLAGS+=		V=1

AUTOTOOL_STYLE:=	autogen
CONFIGURE_ENV+=		ac_cv_path_SULOGIN=/sbin/sulogin \
			ac_cv_path_MOUNT_PATH=/bin/mount
CONFIGURE_ARGS+=	--disable-static \
			--disable-manpages \
			--disable-selinux \
			--enable-split-usr \
			--disable-pam \
			--disable-ima \
			--disable-efi \
			--disable-gnuefi \
			--disable-ldconfig \
			--disable-tests \
			--disable-coverage \
			--with-default-dnssec=no \
			--without-python \
			--disable-acl \
			--disable-idn \
			--disable-libidn \
			--disable-libidn2 \
			--disable-libcryptsetup \
			--disable-seccomp \
			--disable-xkbcommon \
			--disable-localed \
			--disable-coredump \
			--disable-polkit \
			--disable-bzip2 \
			--disable-lz4 \
			--disable-xz \
			--disable-zlib \
			--disable-libcurl \
			--disable-gcrypt \
			--disable-microhttpd \
			--disable-qrencode \
			--disable-quotacheck \
			--disable-utmp \
			--disable-rfkill \
			--disable-smack \
			--disable-backlight \
			--disable-binfmt \
			--disable-vconsole \
			--disable-hibernate \
			--disable-audit \
			--disable-hwdb \
			--disable-machined \
			--disable-myhostname \
			--disable-resolved \
			--disable-importd \
			--disable-sysusers \
			--enable-randomseed \
			--enable-timedated \
			--enable-timesyncd \
			--enable-tmpfiles \
			--enable-firstboot

systemd-install:
	$(INSTALL_DIR) $(IDIR_SYSTEMD)/etc
	touch $(IDIR_SYSTEMD)/etc/machine-id
	$(CP) $(WRKINST)/etc/* \
		$(IDIR_SYSTEMD)/etc
	$(INSTALL_DIR) $(IDIR_SYSTEMD)/usr/lib
	$(CP) $(WRKINST)/usr/lib/*.so* \
		$(IDIR_SYSTEMD)/usr/lib
	$(CP) $(WRKINST)/usr/lib/{systemd,kernel,udev,sysctl.d,tmpfiles.d} \
		$(IDIR_SYSTEMD)/usr/lib
	$(INSTALL_DIR) $(IDIR_SYSTEMD)/usr/bin
	$(CP) $(WRKINST)/usr/bin/* \
		$(IDIR_SYSTEMD)/usr/bin
	$(INSTALL_DIR) $(IDIR_SYSTEMD)/usr/share
	$(CP) $(WRKINST)/usr/share/* \
		$(IDIR_SYSTEMD)/usr/share
	$(CP) ./files/*.network \
		$(IDIR_SYSTEMD)/etc/systemd/network
	(cd $(IDIR_SYSTEMD)/usr/lib/systemd/system && ln -sf multi-user.target default.target)

include $(ADK_TOPDIR)/mk/pkg-bottom.mk
