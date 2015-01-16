# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(ADK_TOPDIR)/rules.mk

PKG_NAME:=		qemu
PKG_VERSION:=		2.2.0
PKG_RELEASE:=		1
PKG_HASH:=		b68c9b6c7c694f5489b5a6bffe993cd976ffbb78e7d178eb3bc016caf460039c
PKG_DESCR:=		cpu and system emulator
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		zlib glib alsa-lib
PKG_BUILDDEP:=		gettext-tiny alsa-lib zlib glib
HOST_BUILDDEP:=		glib-host
PKG_URL:=		http://wwww.qemu.org/
PKG_SITES:=		http://wiki.qemu.org/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_ARCH_DEPENDS:=	x86 x86_64

include $(ADK_TOPDIR)/mk/host.mk
include $(ADK_TOPDIR)/mk/package.mk

$(eval $(call HOST_template,QEMU,qemu,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,QEMU,qemu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

HOST_CFLAGS+=		-DNATIVE

ifeq ($(ADK_TARGET_LIB_MUSL),y)
TARGET_CFLAGS+=		-DF_EXLCK=4 -DF_SHLCK=8 -D__SIGRTMIN=32 -D__SIGRTMAX=\(NSIG-1\)
endif

ifeq ($(ADK_TARGET_USE_SSP),y)
CONFIGURE_ARGS+=	--enable-stack-protector
else
CONFIGURE_ARGS+=	--disable-stack-protector
endif

ifeq ($(ADK_TARGET_USE_PIE),y)
CONFIGURE_ARGS+=	--enable-pie
else
CONFIGURE_ARGS+=	--disable-pie
endif

CONFIG_STYLE:=		minimal
CONFIGURE_ARGS+=	--host-cc=$(HOST_CC) \
			--cross-prefix=$(GNU_TARGET_NAME)- \
			--prefix=/usr \
			--sysconfdir=/etc \
			--enable-kvm \
			--audio-drv-list=alsa \
			--disable-libssh2 \
			--disable-gtk \
			--disable-vnc \
			--disable-spice \
			--disable-libnfs \
			--disable-docs \
			--disable-sdl \
			--disable-strip \
			--bindir=/usr/bin

HOST_STYLE:=		manual
HOST_CONFIGURE_ARGS+=	--host-cc=$(HOST_CC) \
			--prefix=${STAGING_HOST_DIR}/usr \
			--audio-drv-list=alsa \
			--disable-stack-protector \
			--disable-pie \
			--disable-docs \
			--disable-werror \
			--disable-system \
			--disable-sdl

host-configure:
	cd ${WRKBUILD}; rm -f config.{cache,status}; \
		env ${HOST_CONFIGURE_ENV} \
		${BASH} ${WRKSRC}/${CONFIGURE_PROG} \
		${HOST_CONFIGURE_ARGS} $(MAKE_TRACE)

host-build:
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_MAKE_FLAGS} ${HOST_ALL_TARGET} $(MAKE_TRACE)
       
qemu-hostinstall:
	cd ${WRKBUILD} && env ${HOST_MAKE_ENV} ${MAKE} -f ${MAKE_FILE} \
		${HOST_FAKE_FLAGS} ${HOST_INSTALL_TARGET} $(MAKE_TRACE)

qemu-install:
	$(INSTALL_DIR) $(IDIR_QEMU)/usr/share/qemu
	$(INSTALL_DIR) $(IDIR_QEMU)/usr/bin
	$(INSTALL_BIN) $(WRKINST)/usr/bin/qemu* \
		$(IDIR_QEMU)/usr/bin
	$(CP) $(WRKINST)/usr/share/qemu/* \
		$(IDIR_QEMU)/usr/share/qemu

include ${ADK_TOPDIR}/mk/host-bottom.mk
include ${ADK_TOPDIR}/mk/pkg-bottom.mk
