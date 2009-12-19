# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

include $(TOPDIR)/rules.mk

PKG_NAME:=		asterisk
PKG_VERSION:=		1.4.27.1
PKG_RELEASE:=		1
PKG_BUILDDEP+=		ncurses openssl zlib curl popt
ifneq ($(ADK_PACKAGE_ASTERISK_CODEC_SPEEX),)
PKG_BUILDDEP+=		speex
endif
ifneq ($(ADK_PACKAGE_ASTERISK_PGSQL),)
PKG_BUILDDEP+=		postgresql
endif
PKG_MD5SUM:=		e09ca163a6e90018c92c65a50b9ec398
PKG_DESCR:=		Open Source PBX
PKG_SECTION:=		net
PKG_DEPENDS:=		libncurses libpthread libopenssl libcurl
PKG_NOPARALLEL:=	1
PKG_URL:=		http://www.asterisk.org
PKG_SITES:=		http://downloads.asterisk.org/pub/telephony/asterisk/releases/

include $(TOPDIR)/mk/package.mk

$(eval $(call PKG_template,ASTERISK,${PKG_NAME},${PKG_VERSION}-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_PGSQL,asterisk-pgsql,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_VOICEMAIL,asterisk-voicemail,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_SOUNDS,asterisk-sounds,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CHAN_MGCP,asterisk-chan-mgcp,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CHAN_SKINNY,asterisk-chan-skinny,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CHAN_IAX2,asterisk-chan-iax2,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CODEC_SPEEX,asterisk-codec-speex,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_CODEC_GSM,asterisk-codec-gsm,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_PBX_DUNDI,asterisk-pbx-dundi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))
$(eval $(call PKG_template,ASTERISK_RES_AGI,asterisk-res-agi,$(PKG_VERSION)-${PKG_RELEASE},${PKG_DEPENDS},${PKG_DESCR},${PKG_SECTION}))

SUB_INSTALLS-y:=
SUB_INSTALLS-m:=
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_PGSQL}+=		asterisk-pgsql-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_VOICEMAIL}+=	asterisk-voicemail-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_SOUNDS}+=		asterisk-sounds-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_CHAN_MGCP}+=	asterisk-chan-mgcp-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_CHAN_SKINNY}+=	asterisk-chan-skinny-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_CHAN_IAX2}+=	asterisk-chan-iax2-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_CODEC_SPEEX}+=	asterisk-codec-speex-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_CODEC_GSM}+=	asterisk-codec-gsm-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_PBX_DUNDI}+=	asterisk-pbx-dundi-install
SUB_INSTALLS-${ADK_PACKAGE_ASTERISK_RES_AGI}+=		asterisk-res-agi-install

#workaround for cris and gcc 4.4, where -Os generates ICE
ifeq ($(ARCH),cris)
TARGET_OPTIMIZATION:=$(subst Os,O2,$(TARGET_OPTIMIZATION))
endif

CONFIGURE_ARGS=		--with-z=${STAGING_DIR}/usr \
			--with-ncurses=${STAGING_DIR}/usr \
			--with-ssl=${STAGING_DIR}/usr \
			--without-zaptel \
			--without-tonezone \
			--without-asound \
			--without-curses \
			--without-gnutls \
			--without-h323 \
			--without-iksemel \
			--without-imap \
			--without-kde \
			--without-nbs \
			--without-netsnmp \
			--without-newt \
			--without-odbc \
			--without-osptk \
			--without-oss \
			--without-pri \
			--without-pwlib \
			--without-tds \
			--without-termcap \
			--without-tinfo \
			--without-vpb
ifneq (${ADK_PACKAGE_ASTERISK_CODEC_GSM},)
CONFIGURE_ARGS+=	--with-gsm=internal
else
CONFIGURE_ARGS+=	--without-gsm
endif
ifneq (${ADK_PACKAGE_ASTERISK_CODEC_SPEEX},)
CONFIGURE_ARGS+=	--with-speex=${STAGING_DIR}/usr
EXTRA_CFLAGS+=		-I$(STAGING_DIR)/usr/include/speex
endif
ifneq (${ADK_PACKAGE_ASTERISK_FORMAT_VORBIS},)
CONFIGURE_ARGS+=	--with-ogg=${STAGING_DIR}/usr \
			--with-vorbis=${STAGING_DIR}/usr
TLDFLAGS+=		-logg
endif
ifneq (${ADK_PACKAGE_ASTERISK_CURL},)
CONFIGURE_ARGS+=	--with-curl=${STAGING_DIR}/usr
else
CONFIGURE_ARGS+=	--without-curl
endif
ifneq (${ADK_PACKAGE_ASTERISK_PGSQL},)
CONFIGURE_ARGS+=	--with-postgres=${STAGING_DIR}/usr
else
CONFIGURE_ARGS+=	--without-postgres
endif
ifneq (${ADK_PACKAGE_LIBPOPT},)
CONFIGURE_ARGS+=	--with-popt=${STAGING_DIR}/usr
else
CONFIGURE_ARGS+=	--without-popt
endif
CONFIGURE_ARGS+=	--without-misdn \
			--without-isdnnet \
			--without-suppserv

CONFIGURE_STYLE:=	gnu
CONFIGURE_ENV+=		STRIP=${STRIP}
BUILD_STYLE:=		auto
MAKE_ENV=		ASTCFLAGS="${TCPPFLAGS} -DHAVE_STRTOQ" \
			ASTLDFLAGS="${TLDFLAGS}"
MAKE_FLAGS+=		DESTDIR="$(WRKINST)" \
			OPTIMIZE="${TARGET_OPTIMIZATION}" \
			CXX="${TARGET_CC}" \
			STRIP="${TARGET_CROSS}strip" \
			NOISY_BUILD=1
ALL_TARGET:=		all install samples

pre-configure:
	rm ${WRKBUILD}/apps/app_followme.c
	cd "$(WRKBUILD)/menuselect"; ./configure 

post-build:
	cd ${WRKBUILD}/sounds ; \
	tar xzf asterisk-core-sounds-en-gsm-1.4.16.tar.gz ; \
	rm asterisk-core-sounds-en-gsm-1.4.16.tar.gz
	@echo
	@echo "---> have to install ${SUB_INSTALLS-m} ${SUB_INSTALLS-y} <---"
	@echo

do-install: ${SUB_INSTALLS-m} ${SUB_INSTALLS-y}
	$(CP) $(WRKINST)/* $(IDIR_ASTERISK)
	rm -rf $(IDIR_ASTERISK)/usr/sbin/astgenkey
	rm -rf $(IDIR_ASTERISK)/usr/bin
	rm -rf $(IDIR_ASTERISK)/usr/share
	rm -rf $(IDIR_ASTERISK)/usr/include
	rm -rf $(IDIR_ASTERISK)/var
	(cd $(IDIR_ASTERISK)/usr/lib/asterisk; \
		rm -rf agi-bin; \
		rm -rf images; \
		rm -rf keys/*; \
		rm -rf mohmp3/*.mp3; \
		rm -rf sounds/*; \
		cd modules; \
		rm -rf	*adsi* *festival* *modem* *meetme* *oss* *phone* *intercom* \
			*mp3* *nbscat* *mysql* *postgres* *pgsql* *voicemail* *speex* \
			*zapateller* *jpeg*; \
		rm -f chan_bluetooth.so ; \
		rm -f chan_h323.so ; \
		rm -f chan_iax2.so ; \
		rm -f chan_mgcp.so ; \
		rm -f chan_skinny.so ; \
		rm -f {codec,format}_ilbc.so ; \
		rm -f codec_gsm.so ; \
		rm -f codec_lpc10.so ; \
		rm -f pbx_dundi.so ; \
		rm -f res_agi.so ; \
	)
	(cd $(IDIR_ASTERISK)/etc/asterisk; \
		rm -f 	*iax* *odbc* *mysql* *postgres* *pgsql* *voicemail* *adsi* *oss* *alsa* \
			*festival* *modem* *meetme* *phone* *tds* *vofr* *rpt* *vpb* \
			*zapata*; \
		rm -f bluetooth.conf ; \
		rm -f mgcp.conf ; \
		rm -f skinny.conf ; \
		rm -f dundi.conf ; \
	)
	${INSTALL_DATA} ./files/modules.conf $(IDIR_ASTERISK)/etc/asterisk/
	$(SED) 's|/var/lib/asterisk|/usr/lib/asterisk|g' $(WRKINST)/etc/asterisk/musiconhold.conf

asterisk-pgsql-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_PGSQL)/etc/asterisk
	${INSTALL_DATA} $(WRKBUILD)/configs/cdr_pgsql.conf.sample $(IDIR_ASTERISK_PGSQL)/etc/asterisk/cdr_pgsql.conf
	${INSTALL_DIR} $(IDIR_ASTERISK_PGSQL)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/cdr/cdr_pgsql.so $(IDIR_ASTERISK_PGSQL)/usr/lib/asterisk/modules/

asterisk-sounds-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_SOUNDS)/usr/lib/asterisk/sounds
	$(CP) $(WRKBUILD)/sounds/* $(IDIR_ASTERISK_SOUNDS)/usr/lib/asterisk/sounds/
	rm -f $(IDIR_ASTERISK_SOUNDS)/usr/lib/asterisk/sounds/*.mp3
	rm -f $(IDIR_ASTERISK_SOUNDS)/usr/lib/asterisk/sounds/vm-*

asterisk-voicemail-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_VOICEMAIL)/etc/asterisk
	${INSTALL_DIR} $(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/modules
	${INSTALL_DATA} $(WRKBUILD)/configs/voicemail.conf.sample $(IDIR_ASTERISK_VOICEMAIL)/etc/asterisk/voicemail.conf
	${CP} $(WRKBUILD)/apps/*voicemail.so $(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/modules/
	${INSTALL_BIN} $(WRKBUILD)/res/res_adsi.so $(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/modules/
	${INSTALL_DIR} $(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/sounds
	$(CP) $(WRKBUILD)/sounds/vm-*.gsm $(IDIR_ASTERISK_VOICEMAIL)/usr/lib/asterisk/sounds/

asterisk-chan-mgcp-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_MGCP)/etc/asterisk
	${INSTALL_DATA} $(WRKBUILD)/configs/mgcp.conf.sample $(IDIR_ASTERISK_CHAN_MGCP)/etc/asterisk/mgcp.conf
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_MGCP)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/channels/chan_mgcp.so $(IDIR_ASTERISK_CHAN_MGCP)/usr/lib/asterisk/modules/

asterisk-chan-skinny-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_SKINNY)/etc/asterisk
	${INSTALL_DATA} $(WRKBUILD)/configs/skinny.conf.sample $(IDIR_ASTERISK_CHAN_SKINNY)/etc/asterisk/skinny.conf
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_SKINNY)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/channels/chan_skinny.so $(IDIR_ASTERISK_CHAN_SKINNY)/usr/lib/asterisk/modules/

asterisk-chan-iax2-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_IAX2)/etc/asterisk
	${INSTALL_DIR} $(IDIR_ASTERISK_CHAN_IAX2)/usr/lib/asterisk/modules
	${INSTALL_DATA} $(WRKBUILD)/configs/iax.conf.sample $(IDIR_ASTERISK_CHAN_IAX2)/etc/asterisk/iax.conf
	${INSTALL_DATA} $(WRKBUILD)/configs/iaxprov.conf.sample $(IDIR_ASTERISK_CHAN_IAX2)/etc/asterisk/iaxprov.conf
	${INSTALL_BIN} $(WRKBUILD)/channels/chan_iax2.so $(IDIR_ASTERISK_CHAN_IAX2)/usr/lib/asterisk/modules/

asterisk-codec-speex-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CODEC_SPEEX)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/codecs/codec_speex.so $(IDIR_ASTERISK_CODEC_SPEEX)/usr/lib/asterisk/modules/

asterisk-codec-gsm-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_CODEC_GSM)/usr/lib/asterisk/modules/
	${INSTALL_BIN} $(WRKBUILD)/codecs/codec_gsm.so $(IDIR_ASTERISK_CODEC_GSM)/usr/lib/asterisk/modules/

asterisk-pbx-dundi-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_PBX_DUNDI)/etc/asterisk
	${INSTALL_DATA} $(WRKBUILD)/configs/dundi.conf.sample $(IDIR_ASTERISK_PBX_DUNDI)/etc/asterisk/dundi.conf
	${INSTALL_DIR} $(IDIR_ASTERISK_PBX_DUNDI)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/pbx/pbx_dundi.so $(IDIR_ASTERISK_PBX_DUNDI)/usr/lib/asterisk/modules/

asterisk-res-agi-install:
	${INSTALL_DIR} $(IDIR_ASTERISK_RES_AGI)/usr/lib/asterisk/agi-bin
	${INSTALL_DIR} $(IDIR_ASTERISK_RES_AGI)/usr/lib/asterisk/modules
	${INSTALL_BIN} $(WRKBUILD)/res/res_agi.so $(IDIR_ASTERISK_RES_AGI)/usr/lib/asterisk/modules/

asterisk-meetme-install:
	${INSTALL_DIR} ${IDIR_ASTERISK_MEETME}/etc/asterisk/
	${INSTALL_DIR} ${IDIR_ASTERISK_MEETME}/usr/lib/asterisk/modules
	${INSTALL_DATA} ${WRKBUILD}/configs/meetme.conf.sample ${IDIR_ASTERISK_MEETME}/etc/asterisk/meetme.conf
	${INSTALL_BIN} ${WRKBUILD}/apps/app_meetme.so ${IDIR_ASTERISK_MEETME}/usr/lib/asterisk/modules

include ${TOPDIR}/mk/pkg-bottom.mk
