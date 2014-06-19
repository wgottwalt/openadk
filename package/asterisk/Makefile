# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		asterisk
PKG_VERSION:=		12.3.0
PKG_RELEASE:=		1
PKG_MD5SUM:=		4a5bdeb8e4ab6633a5e1a3c0efbf158c
PKG_DESCR:=		open source pbx
PKG_SECTION:=		net/voip
PKG_DEPENDS:=		libncurses libpthread libopenssl libcurl libstdcxx
PKG_DEPENDS+=		libsqlite
PKG_BUILDDEP:=		ncurses openssl zlib curl popt libjansson sqlite
PKG_URL:=		http://www.asterisk.org/
PKG_SITES:=		http://downloads.asterisk.org/pub/telephony/asterisk/releases/

PKG_LIBC_DEPENDS:=	glibc

DISTFILES:=		${PKG_NAME}-${PKG_VERSION}.tar.gz

PKG_SUBPKGS:=		ASTERISK ASTERISK_PGSQL ASTERISK_VOICEMAIL ASTERISK_SOUNDS
PKG_SUBPKGS+=		ASTERISK_CHAN_SKINNY ASTERISK_CHAN_IAX2 ASTERISK_CODEC_SPEEX ASTERISK_CODEC_GSM
PKG_SUBPKGS+=		ASTERISK_PBX_DUNDI ASTERISK_RES_AGI
PKGSD_ASTERISK_VOICEMAIL:=	voicemail support
PKGSN_ASTERISK_VOICEMAIL:=	asterisk
PKGSD_ASTERISK_CODEC_GSM:=	GSM codec support
PKGSN_ASTERISK_CODEC_GSM:=	asterisk
PKGSD_ASTERISK_PBX_DUNDI:=	PBX dundi support
PKGSN_ASTERISK_PBX_DUNDI:=	asterisk
PKGSD_ASTERISK_RES_AGI:=	res agi support
PKGSN_ASTERISK_RES_AGI:=	asterisk
PKGSD_ASTERISK_PGSQL:=		postgresql support
PKGSB_ASTERISK_PGSQL:=		postgresql
PKGSN_ASTERISK_PGSQL:=		asterisk
PKGSD_ASTERISK_CHAN_MGCP:=	Media Gateway Control Protocol implementation
PKGSN_ASTERISK_CHAN_MGCP:=	asterisk
PKGSD_ASTERISK_CHAN_SKINNY:=	skinny client control protocol implementation
PKGSN_ASTERISK_CHAN_SKINNY:=	asterisk
PKGSD_ASTERISK_CHAN_IAX2:=	support for the Inter Asterisk Protocol
PKGSN_ASTERISK_CHAN_IAX2:=	asterisk
PKGSD_ASTERISK_CODEC_SPEEX:=	speex/PCM16 Codec translator
PKGSB_ASTERISK_CODEC_SPEEX:=	speex
PKGSN_ASTERISK_CODEC_SPEEX:=	asterisk
PKGSD_ASTERISK_SOUNDS:=		various soundfiles in GSM format
PKGSN_ASTERISK_SOUNDS:=		asterisk
PKGSS_ASTERISK_SOUNDS:=		asterisk-codec-gsm

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ASTERISK,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_PGSQL,asterisk-pgsql,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_PGSQL},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_VOICEMAIL,asterisk-voicemail,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_VOICEMAIL},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_SOUNDS,asterisk-sounds,$(PKG_VERSION)-${PKG_RELEASE},${PKGSS_ASTERISK_SOUNDS},${PKGSD_ASTERISK_SOUNDS},${PKG_SECTION}))
#$(eval $(call PKG_template,ASTERISK_CHAN_MGCP,asterisk-chan-mgcp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_CHAN_MGCP},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CHAN_SKINNY,asterisk-chan-skinny,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_CHAN_SKINNY},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CHAN_IAX2,asterisk-chan-iax2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_CHAN_IAX2},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CODEC_SPEEX,asterisk-codec-speex,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_CODEC_SPEEX},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CODEC_GSM,asterisk-codec-gsm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_CODEC_GSM},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_PBX_DUNDI,asterisk-pbx-dundi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_PBX_DUNDI},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_RES_AGI,asterisk-res-agi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKGSD_ASTERISK_RES_AGI},${PKG_SECTION}))

AUTOTOOL_STYLE:=	bootstrap
CONFIGURE_ARGS=		--with-z=${STAGING_TARGET_DIR}/usr \
			--with-ncurses=${STAGING_TARGET_DIR}/usr \
			--with-ssl=${STAGING_TARGET_DIR}/usr \
			--disable-xmldoc \
			--without-tonezone \
			--without-asound \
			--without-curses \
			--without-gtk2 \
			--without-h323 \
			--without-iksemel \
			--without-imap \
			--without-nbs \
			--without-netsnmp \
			--without-newt \
			--without-osptk \
			--without-oss \
			--without-popt \
			--without-pri \
			--without-pwlib \
			--without-tds \
			--without-termcap \
			--without-vpb \
			--without-misdn \
			--without-isdnnet \
			--without-suppserv

ifneq (${ADK_PACKAGE_ASTERISK_CODEC_GSM},)
CONFIGURE_ARGS+=	--with-gsm=internal
else
CONFIGURE_ARGS+=	--without-gsm
endif
ifneq (${ADK_PACKAGE_ASTERISK_CODEC_SPEEX},)
CONFIGURE_ARGS+=	--with-speex=${STAGING_TARGET_DIR}/usr
EXTRA_CFLAGS+=		-I$(STAGING_TARGET_DIR)/usr/include/speex
endif
ifneq (${ADK_PACKAGE_ASTERISK_FORMAT_VORBIS},)
CONFIGURE_ARGS+=	--with-ogg=${STAGING_TARGET_DIR}/usr \
			--with-vorbis=${STAGING_TARGET_DIR}/usr
TARGET_LDFLAGS+=	-logg
endif
ifneq (${ADK_PACKAGE_ASTERISK_CURL},)
CONFIGURE_ARGS+=	--with-libcurl=${STAGING_TARGET_DIR}/usr
else
CONFIGURE_ARGS+=	--without-libcurl
endif
ifneq (${ADK_PACKAGE_ASTERISK_PGSQL},)
CONFIGURE_ARGS+=	--with-postgres=${STAGING_TARGET_DIR}/usr
else
CONFIGURE_ARGS+=	--without-postgres
endif

MAKE_FLAGS+=		NOISY_BUILD=1

post-build:
	cd ${WRKBUILD}/sounds ; \
	tar xzf asterisk-core-sounds-en-gsm-1.4.25.tar.gz; \
	rm asterisk-core-sounds-en-gsm-1.4.25.tar.gz

asterisk-pgsql-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_PGSQL)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKINST)/usr/lib/asterisk/modules/cdr_pgsql.so \
		$(IDIR_ASTERISK_PGSQL)/usr/lib/asterisk/modules/

asterisk-sounds-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_SOUNDS)/usr/lib/asterisk/sounds
	$(CP) $(WRKBUILD)/sounds/* \
		$(IDIR_ASTERISK_SOUNDS)/usr/lib/asterisk/sounds/
	(cd $(IDIR_ASTERISK_SOUNDS)/usr/lib/asterisk/sounds; \
		rm -f *.mp3 vm-*; \
		rm -f CHANGES* CREDITS* LICENSE* *.txt ; \
		rm -f *.tar.gz Makefile ; \
	)

asterisk-voicemail-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_VOICEMAIL)/etc/asterisk
	${INSTALL_DIR} $(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/modules
	${INSTALL_DATA} $(WRKBUILD)/configs/voicemail.conf.sample \
		$(IDIR_ASTERISK_VOICEMAIL)/etc/asterisk/voicemail.conf
	${CP} $(WRKBUILD)/apps/*voicemail.so \
		$(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/modules/
	${INSTALL_BIN} $(WRKBUILD)/res/res_adsi.so \
		$(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/modules/
	${INSTALL_DIR} $(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/sounds
	$(CP) $(WRKBUILD)/sounds/vm-*.gsm \
		$(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/sounds/

asterisk-chan-mgcp-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_MGCP)/etc/asterisk
	${INSTALL_DATA} $(WRKBUILD)/configs/mgcp.conf.sample \
		$(IDIR_ASTERISK_CHAN_MGCP)/etc/asterisk/mgcp.conf
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_MGCP)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/channels/chan_mgcp.so \
		$(IDIR_ASTERISK_CHAN_MGCP)/usr/lib/asterisk/modules/

asterisk-chan-skinny-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_SKINNY)/etc/asterisk
	${INSTALL_DATA} $(WRKBUILD)/configs/skinny.conf.sample \
		$(IDIR_ASTERISK_CHAN_SKINNY)/etc/asterisk/skinny.conf
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_SKINNY)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/channels/chan_skinny.so \
		$(IDIR_ASTERISK_CHAN_SKINNY)/usr/lib/asterisk/modules/

asterisk-chan-iax2-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_IAX2)/etc/asterisk
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_IAX2)/usr/lib/asterisk/modules
	${INSTALL_DATA} $(WRKBUILD)/configs/iax.conf.sample \
		$(IDIR_ASTERISK_CHAN_IAX2)/etc/asterisk/iax.conf
	${INSTALL_DATA} $(WRKBUILD)/configs/iaxprov.conf.sample \
		$(IDIR_ASTERISK_CHAN_IAX2)/etc/asterisk/iaxprov.conf
	${INSTALL_BIN} $(WRKBUILD)/channels/chan_iax2.so \
		$(IDIR_ASTERISK_CHAN_IAX2)/usr/lib/asterisk/modules/

asterisk-codec-speex-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CODEC_SPEEX)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/codecs/codec_speex.so \
		$(IDIR_ASTERISK_CODEC_SPEEX)/usr/lib/asterisk/modules/

asterisk-codec-gsm-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CODEC_GSM)/usr/lib/asterisk/modules/
	${INSTALL_BIN} $(WRKBUILD)/codecs/codec_gsm.so \
		$(IDIR_ASTERISK_CODEC_GSM)/usr/lib/asterisk/modules/

asterisk-pbx-dundi-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_PBX_DUNDI)/etc/asterisk
	${INSTALL_DATA} $(WRKBUILD)/configs/dundi.conf.sample \
		$(IDIR_ASTERISK_PBX_DUNDI)/etc/asterisk/dundi.conf
	${INSTALL_DIR} $(IDIR_ASTERISK_PBX_DUNDI)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/pbx/pbx_dundi.so \
		$(IDIR_ASTERISK_PBX_DUNDI)/usr/lib/asterisk/modules/

asterisk-res-agi-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_RES_AGI)/usr/lib/asterisk/agi-bin
	${INSTALL_DIR} $(IDIR_ASTERISK_RES_AGI)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/res/res_agi.so \
		$(IDIR_ASTERISK_RES_AGI)/usr/lib/asterisk/modules/

asterisk-meetme-install:
	${INSTALL_DIR} ${IDIR_ASTERISK_MEETME}/etc/asterisk/
	${INSTALL_DIR} ${IDIR_ASTERISK_MEETME}/usr/lib/asterisk/modules
	${INSTALL_DATA} ${WRKBUILD}/configs/meetme.conf.sample \
		${IDIR_ASTERISK_MEETME}/etc/asterisk/meetme.conf
	${INSTALL_BIN} ${WRKBUILD}/apps/app_meetme.so \
		${IDIR_ASTERISK_MEETME}/usr/lib/asterisk/modules

include ${TOPDIR}/mk/pkg-bottom.mk
