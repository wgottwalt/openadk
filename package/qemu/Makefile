# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		qemu
PKG_VERSION:=		2.0.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		2790f44fd76da5de5024b4aafeb594c2
PKG_DESCR:=		cpu and system emulator
PKG_SECTION:=		sys/misc
PKG_DEPENDS:=		zlib glib
PKG_BUILDDEP:=		gettext-tiny
PKG_BUILDDEP+=		zlib glib
HOST_BUILDDEP:=		glib-host
PKG_URL:=		http://wwww.qemu.org/
PKG_SITES:=		http://wiki.qemu.org/download/

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.bz2

PKG_ARCH_DEPENDS:=	x86 x86_64

include $(TOPDIR)/mk/host.mk
include $(TOPDIR)/mk/package.mk

$(eval $(call HOST_template,QEMU,qemu,$(PKG_VERSION)-${PKG_RELEASE}))
$(eval $(call PKG_template,QEMU,qemu,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

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
CONFIGURE_ARGS+=	--host-cc=$(CC_FOR_BUILD) \
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

CFLAGS_FOR_BUILD+=	-DNATIVE
HOST_STYLE:=		manual
HOST_CONFIGURE_ARGS+=	--host-cc=$(CC_FOR_BUILD) \
			--prefix=${STAGING_HOST_DIR}/usr \
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

include ${TOPDIR}/mk/host-bottom.mk
include ${TOPDIR}/mk/pkg-bottom.mk
