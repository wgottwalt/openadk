# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

aircrack-ng-compile: openssl-compile libpcap-compile
alsa-utils-compile: alsa-lib-compile
apr-util-compile: expat-compile apr-compile
arpd-compile: libpcap-compile libdnet-compile libevent-compile
arpwatch-compile: libpcap-compile
atftp-compile: readline-compile ncurses-compile
avahi-compile: libdaemon-compile expat-compile gdbm-compile glib-compile
bind-compile: openssl-compile
bitlbee-compile: libiconv-compile openssl-compile glib-compile
bluez-compile: libusb-compile dbus-compile glib-compile
bogofilter-compile: libiconv-compile libdb-compile
ifeq (${ADK_COMPILE_CBTT_WITH_UCLIBCXX},y)
cbtt-compile: uclibc++-compile
endif
cbtt-compile: mysql-compile zlib-compile
collectd-compile: libpthread-compile
cryptinit-compile: cryptsetup-compile
cryptsetup-compile: libgcrypt-compile popt-compile e2fsprogs-compile lvm-compile
ifeq (${ADK_COMPILE_CTORRENT_WITH_UCLIBCXX},y)
ctorrent-compile: uclibc++-compile
endif
ctorrent-compile: openssl-compile
cups-compile: zlib-compile
curl-compile: openssl-compile zlib-compile
cxxtools-compile: libiconv-compile
ifeq (${ADK_COMPILE_CXXTOOLS_WITH_UCLIBCXX},y)
cxxtools-compile: uclibc++-compile
endif
cyrus-sasl-compile: openssl-compile
dansguardian-compile: pcre-compile
ifneq (${ADK_PACKAGE_DAVFS2_FUSE}${ADK_PACKAGE_DAVFS2_BOTH},)
davfs2-compile: fuse-compile
endif
davfs2-compile: libiconv-compile neon-compile
dbus-compile: expat-compile
deco-compile: ncurses-compile
dhcpv6-compile: libnl-compile ncurses-compile
digitemp-compile: libusb-compile libusb-compat-compile
dsniff-compile: libnids-compile openssl-compile gdbm-compile
elinks-compile: openssl-compile
esound-compile: libaudiofile-compile
ettercap-compile: pcap-compile libnet-compile
exmap-compile: glib-compile readline-compile
fprobe-compile: libpcap-compile
freetype-compile: zlib-compile
gatling-compile: libowfat-compile libiconv-compile
gcc-compile: gmp-compile mpfr-compile
gdb-compile: ncurses-compile readline-compile
gettext-compile: libiconv-compile libpthread-compile
git-compile: openssl-compile curl-compile expat-compile
gkrellmd-compile: glib-compile
glib-compile: gettext-compile libiconv-compile
gmediaserver-compile: id3lib-compile libupnp-compile
gnutls-compile: libgcrypt-compile liblzo-compile libtasn1-compile opencdk-compile zlib-compile ncurses-compile
ifeq (${ADK_COMPILE_GPSD_WITH_UCLIBCXX},y)
gpsd-compile: uclibc++-compile
endif
gpsd-compile: ncurses-compile
ifeq (${ADK_COMPILE_HEIMDAL_WITH_DB_BDB},y)
heimdal-compile: libdb-compile
endif
ifeq (${ADK_COMPILE_HEIMDAL_WITH_DB_LDAP},y)
heimdal-compile: openldap-compile
endif
heimdal-compile: openssl-compile ncurses-compile
httping-compile: openssl-compile
icecast-compile: curl-compile libvorbis-compile libxml2-compile libxslt-compile
ifeq (${ADK_COMPILE_ID3LIB_WITH_UCLIBCXX},y)
id3lib-compile: uclibc++-compile 
endif
id3lib-compile: zlib-compile libiconv-compile
iftop-compile: libpcap-compile libpthread-compile ncurses-compile
ipcad-compile: libpcap-compile
ifeq (${ADK_COMPILE_IPERF_WITH_UCLIBCXX},y)
iperf-compile: uclibc++-compile
endif
ifneq ($(strip ${ADK_PACKAGE_TC_ATM}),)
iproute2-compile: linux-atm-compile
endif
ipsec-tools-compile: openssl-compile
iptables-snmp-compile: net-snmp-compile
iptraf-compile: ncurses-compile
irssi-compile: glib-compile ncurses-compile
iw-compile: libnl-compile
jamvm-compile: libffi-compile zlib-compile
ifeq (${ADK_COMPILE_KISMET_WITH_UCLIBCXX},y)
kismet-compile: uclibc++-compile 
endif
kismet-compile: libpcap-compile ncurses-compile
knock-compile: libpcap-compile
krb5-compile: ncurses-compile
l2tpns-compile: libcli-compile
less-compile: ncurses-compile
libgcrypt-compile: libgpg-error-compile
libgd-compile: libpng-compile jpeg-compile
libid3tag-compile: zlib-compile
libnet-compile: libpcap-compile
libnids-compile: libnet-compile libpcap-compile
libp11-compile: openssl-compile libtool-compile
libpng-compile: zlib-compile
libshout-compile: libvorbis-compile
libusb-compat-compile: libusb-compile
ifeq (${ADK_IPV6},y)
libtirpc-compile: libgssglue-compile
endif
libtorrent-compile: openssl-compile libsigc++-compile
libvorbis-compile: libogg-compile
libvirt-compile: libxml2-compile gnutls-compile python-compile
libfontenc-compile: xproto-compile zlib-compile
libICE-compile: xtrans-compile
libSM-compile: libICE-compile
libXt-compile: libSM-compile
libXv-compile: libX11-compile videoproto-compile
libXmu-compile: libXt-compile
libXext-compile: libX11-compile
libXaw-compile: libXext-compile libXmu-compile libXpm-compile
libX11-compile: xproto-compile xextproto-compile xtrans-compile libXdmcp-compile \
	libXau-compile xcmiscproto-compile bigreqsproto-compile kbproto-compile \
	inputproto-compile
libXfont-compile: freetype-compile fontcacheproto-compile fontsproto-compile libfontenc-compile
libxml2-compile: zlib-compile
libxslt-compile: libxml2-compile
ifeq (${ADK_COMPILE_LIGHTTPD_WITH_OPENSSL},y)
lighttpd-compile: openssl-compile
endif
lighttpd-compile: pcre-compile libxml2-compile sqlite-compile
links-compile: openssl-compile libpng-compile jpeg-compile gpm-compile
logrotate-compile: popt-compile
lynx-compile: ncurses-compile openssl-compile
madplay-compile: libid3tag-compile libmad-compile
maradns-compile: libpthread-compile
mc-compile: glib-compile ncurses-compile
miax-compile: bluez-compile
ifeq (${ADK_COMPILE_MIREDO_WITH_UCLIBCXX},y)
miredo-compile: uclibc++-compile
endif
moc-compile: libvorbis-compile curl-compile libmad-compile flac-compile ffmpeg-compile
monit-compile: openssl-compile
ifeq (${ADK_COMPILE_MRD6_WITH_UCLIBCXX},y)
mrd6-compile: uclibc++-compile
endif
mt-daapd-compile: gdbm-compile libid3tag-compile
mtr-compile: ncurses-compile
mutt-compile: ncurses-compile openssl-compile
mysql-compile: ncurses-compile zlib-compile readline-compile
nano-compile: ncurses-compile
neon-compile: libpthread-compile libxml2-compile openssl-compile zlib-compile
net-snmp-compile: libelf-compile
ifeq (${ADK_COMPILE_NFS_UTILS_WITH_KRB5},y)
nfs-utils-compile: libnfsidmap-compile krb5-compile libevent-compile libgssglue-compile librpcsecgss-compile
endif
ifeq (${ADK_COMPILE_NFS_UTILS_WITH_HEIMDAL},y)
nfs-utils-compile: libnfsidmap-compile heimdal-compile libevent-compile librpcsecgss-compile
endif
ifeq (${ADK_IPV6},y)
nfs-utils-compile: libtirpc-compile
endif
ifeq (${ADK_COMPILE_NMAP_WITH_UCLIBCXX},y)
nmap-compile: uclibc++-compile
endif
nmap-compile: pcre-compile libpcap-compile
obexftp-compile: openobex-compile libiconv-compile
opencdk-compile: libgcrypt-compile libgpg-error-compile zlib-compile
openct-compile: libtool-compile libusb-compile
openldap-compile: cyrus-sasl-compile openssl-compile libdb-compile
openobex-compile: bluez-compile
opensips-compile: openssl-compile
ifeq (${ADK_COMPILE_OPENSSH_WITH_KRB5},y)
openssh-compile: krb5-compile
endif
ifeq (${ADK_COMPILE_OPENSSH_WITH_HEIMDAL},y)
openssh-compile: heimdal-compile
endif
openssh-compile: zlib-compile openssl-compile
openssl-compile: zlib-compile
openssl-pkcs11-compile: libp11-compile
openswan-compile: gmp-compile
oprofile-compile: popt-compile
osiris-compile: openssl-compile
palantir-compile: jpeg-compile
pciutils-compile: zlib-compile
popt-compile: libiconv-compile
ifneq ($(strip ${ADK_PACKAGE_PORTMAP_LIBWRAP}),)
portmap-compile: tcp_wrappers-compile
endif
postgresql-compile: zlib-compile
privoxy-compile: pcre-compile
procps-compile: ncurses-compile
ptunnel-compile: libpcap-compile
quagga-compile: readline-compile ncurses-compile
raddump-compile: openssl-compile libpcap-compile
radiusclient-ng-compile: openssl-compile
rarpd-compile: libnet-compile
readline-compile: ncurses-compile
nss-compile: nspr-compile zlib-compile
rpm-compile: nss-compile libdb-compile
rrdcollect-compile: rrdtool-compile
rrdtool-compile: libxml2-compile cgilib-compile freetype-compile libart-compile libpng-compile
rsync-compile: popt-compile
rtorrent-compile: ncurses-compile libtorrent-compile curl-compile
sane-backends-compile: libpthread-compile libusb-compile
scanlogd-compile: libpcap-compile libnids-compile libnet-compile
scdp-compile: libnet-compile
screen-compile: ncurses-compile
serdisplib-compile: libgd-compile libusb-compile
siproxd-compile: libosip2-compile
sipsak-compile: openssl-compile
sispmctl-compile: libusb-compile
snort-compile: libnet-compile libpcap-compile pcre-compile
snort-wireless-compile: libnet-compile libpcap-compile pcre-compile
socat-compile: openssl-compile
sqlite-compile: ncurses-compile readline-compile
squid-compile: openssl-compile
ssltunnel-compile: openssl-compile ppp-compile
subversion-compile: apr-util-compile expat-compile apr-compile zlib-compile libiconv-compile
swconfig-compile: libnl-compile
syslog-ng-compile: libol-compile tcp_wrappers-compile
tcpdump-compile: libpcap-compile
tinc-compile: zlib-compile openssl-compile liblzo-compile
tntnet-compile: cxxtools-compile zlib-compile
ifneq (${ADK_COMPILE_TNTNET_WITH_OPENSSL},)
tntnet-compile: openssl-compile
else ifneq (${ADK_COMPILE_TNTNET_WITH_GNUTLS},)
tntnet-compile: gnutls-compile
endif
tor-compile: libevent-compile openssl-compile zlib-compile
trafshow: ncurses-compile libpcap-compile
usbutils-compile: libusb-compile
ussp-push-compile: openobex-compile
util-linux-ng-compile: e2fsprogs-compile ncurses-compile
vilistextum-compile: libiconv-compile
vim-compile: ncurses-compile
vnc-reflector-compile: jpeg-compile zlib-compile
vpnc-compile: libgcrypt-compile libgpg-error-compile
vtun-compile: zlib-compile openssl-compile liblzo-compile
wdfs-compile: openssl-compile fuse-compile neon-compile glib-compile
weechat-compile: ncurses-compile gnutls-compile lua-compile libiconv-compile
wknock-compile: libpcap-compile
ifeq (${ADK_COMPILE_WPA_SUPPLICANT_WITH_OPENSSL},y)
wpa_supplicant-compile: openssl-compile 
endif
wx200d-compile: postgresql-compile
xfsprogs-compile: e2fsprogs-compile
libXxf86dga-compile: xf86dgaproto-compile libXext-compile libXaw-compile
xkeyboard-config-compile: xkbcomp-compile
xf86-video-geode-compile: xorg-server-compile
xf86dga-compile: libXxf86dga-compile 
xorg-server-compile: libX11-compile randrproto-compile renderproto-compile fixesproto-compile \
	damageproto-compile scrnsaverproto-compile resourceproto-compile \
	fontsproto-compile videoproto-compile compositeproto-compile \
	evieext-compile libxkbfile-compile libXfont-compile pixman-compile \
	libpciaccess-compile openssl-compile 

ifeq ($(ADK_PACKAGE_APR_THREADING),y)
apr-compile: libpthread-compile
endif

asterisk-compile: ncurses-compile openssl-compile zlib-compile curl-compile popt-compile
ifneq ($(ADK_PACKAGE_ASTERISK_CODEC_SPEEX),)
asterisk-compile: speex-compile
endif
ifneq ($(ADK_PACKAGE_ASTERISK_PGSQL),)
asterisk-compile: postgresql-compile
endif

freeradius-client-compile: openssl-compile
freeradius-server-compile: libtool-compile openssl-compile
ifneq ($(ADK_PACKAGE_FREERADIUS_MOD_LDAP),)
freeradius-server-compile: openldap-compile
endif
ifneq ($(ADK_PACKAGE_FREERADIUS_MOD_SQL_MYSQL),)
freeradius-server-compile: mysql-compile
endif
ifneq ($(ADK_PACKAGE_FREERADIUS_MOD_SQL_PGSQL),)
freeradius-server-compile: postgresql-compile
endif

hostapd-compile: libnl-compile openssl-compile

ifneq ($(ADK_PACKAGE_MINI_HTTPD_OPENSSL),)
mini_httpd-compile: openssl-compile
endif

ifneq ($(ADK_PACKAGE_MOTION),)
motion-compile: jpeg-compile
endif

mplayer-compile: alsa-lib-compile libmad-compile libvorbis-compile faad2-compile ncurses-compile zlib-compile

mpd-compile: alsa-lib-compile glib-compile curl-compile
ifneq ($(ADK_PACKAGE_MPD_MP3),)
mpd-compile: libid3tag-compile libmad-compile
endif
ifneq ($(ADK_PACKAGE_MPD_MP4),)
mpd-compile: libfaad2
endif
ifneq ($(ADK_COMPILE_MPD_WITH_OGG),)
mpd-compile: libvorbis-compile
endif
ifneq ($(ADK_COMPILE_MPD_WITH_TREMOR),)
mpd-compile: libvorbisidec-compile
endif
ifneq ($(ADK_PACKAGE_MPD_FLAC),)
mpd-compile: flac-compile
endif
ifneq ($(ADK_COMPILE_MPD_WITH_SHOUT),)
mpd-compile: lame-compile
endif

ifneq (${ADK_PACKAGE_NUT_SSL},)
nut-compile: openssl-compile
endif
ifneq (${ADK_PACKAGE_NUT_USB},)
nut-compile: libusb-compile
endif
ifneq (${ADK_PACKAGE_NUT_SNMP},)
nut-compile: net-snmp-compile
endif

ifeq ($(ADK_PACKAGE_LIBOPENSSL),y)
openvpn-compile: openssl-compile
endif
ifeq ($(ADK_PACKAGE_OPENVPN_LZO),y)
openvpn-compile: liblzo-compile
endif

php-compile: openssl-compile zlib-compile
ifneq ($(ADK_PACKAGE_PHP_MOD_CURL),)
php-compile: curl-compile
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GD),)
php-compile: libgd-compile libpng-compile
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_GMP),)
php-compile: gmp-compile
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_LDAP),)
php-compile: openldap-compile
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_MYSQL),)
php-compile: mysql-compile
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_PCRE),)
php-compile: pcre-compile
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_PGSQL),)
php-compile: postgresql-compile
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_SQLITE),)
php-compile: sqlite-compile
endif
ifneq ($(ADK_PACKAGE_PHP_MOD_XML),)
php-compile: expat-compile
endif

pmacct-compile: libpcap-compile
ifneq ($(ADK_COMPILE_PMACCT_MYSQL),)
pmacct-compile: mysql-compile
endif
ifneq ($(ADK_COMPILE_PMACCT_PGSQL),)
pmacct-compile: postgresql-compile
endif
ifneq ($(ADK_COMPILE_PMACCT_SQLITE),)
pmacct-compile: sqlite-compile
endif

ifeq (${ADK_COMPILE_RRS_WITH_UCLIBCXX},y)
rrs-compile: uclibc++-compile 
endif
rrs-compile: zlib-compile
ifneq ($(ADK_PACKAGE_RRS),)
rrs-compile: openssl-compile
endif

ifneq ($(ADK_PACKAGE_SUBVERSION_NEON),)
subversion-compile: neon-compile
endif

ulogd-compile: iptables-compile
ifneq ($(ADK_PACKAGE_ULOGD_MOD_MYSQL),)
ulogd-compile: mysql-compile
endif
ifneq ($(ADK_PACKAGE_ULOGD_MOD_PCAP),)
ulogd-compile: libpcap-compile
endif
ifneq ($(ADK_PACKAGE_ULOGD_MOD_PGSQL),)
ulogd-compile: postgresql-compile
endif
ifneq ($(ADK_PACKAGE_ULOGD_MOD_SQLITE),)
ulogd-compile: sqlite-compile
endif
ifeq (${ADK_PACKAGE_FETCHMAIL_SSL},y)
fetchmail-compile: openssl-compile
endif
ifeq (${ADK_PACKAGE_IRSSI_SSL},y)
irssi-compile: openssl-compile
endif

