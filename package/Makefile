# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# Main makefile for the packages

include $(TOPDIR)/rules.mk
include $(TOPDIR)/package/Depends.mk

ifneq (${ADK_PACKAGE_CGILIB},)
ADK_COMPILE_CGILIB=${ADK_PACKAGE_CGILIB}
else
ifneq (${ADK_COMPILE_RRDTOOL},)
ADK_COMPILE_CGILIB=m
else
ADK_COMPILE_CGILIB=
endif
endif

package-$(ADK_PACKAGE_6TUNNEL) += 6tunnel
package-$(ADK_PACKAGE_AICCU) += aiccu
package-$(ADK_PACKAGE_AIRCRACK_NG) += aircrack-ng
package-$(ADK_PACKAGE_ALSA_LIB) += alsa-lib
package-$(ADK_PACKAGE_ALSA_UTILS) += alsa-utils
package-$(ADK_PACKAGE_APR) += apr
package-$(ADK_PACKAGE_APR_UTIL) += apr-util
package-$(ADK_PACKAGE_ARPD) += arpd
package-$(ADK_PACKAGE_ARPWATCH) += arpwatch
package-$(ADK_PACKAGE_ASTERISK) += asterisk
package-$(ADK_COMPILE_ATFTP) += atftp
package-$(ADK_PACKAGE_AUFS_UTIL) += aufs2-util
package-$(ADK_PACKAGE_AUTOCONF) += autoconf
package-$(ADK_PACKAGE_AUTOMAKE) += automake
package-$(ADK_PACKAGE_AUTOSSH) += autossh
package-$(ADK_COMPILE_AVAHI) += avahi
package-$(ADK_COMPILE_AXTLS) += axtls
package-$(ADK_PACKAGE_BASH) += bash
package-$(ADK_COMPILE_BC) += bc
package-$(ADK_PACKAGE_BISON) += bison
package-$(ADK_PACKAGE_BZIP2) += bzip2
package-$(ADK_PACKAGE_CA_CERTS) += ca-certificates
package-$(ADK_PACKAGE_CFGFS) += cfgfs
package-$(ADK_PACKAGE_CFINSTALL) += cfinstall
package-$(ADK_PACKAGE_CPIO) += cpio
package-$(ADK_PACKAGE_CRYPTINIT) += cryptinit
package-$(ADK_PACKAGE_BIGREQSPROTO) += bigreqsproto
package-$(ADK_COMPILE_BIND) += bind
package-$(ADK_PACKAGE_BINUTILS) += binutils
package-$(ADK_PACKAGE_BITLBEE) += bitlbee
package-$(ADK_PACKAGE_BOGOFILTER) += bogofilter
package-$(ADK_PACKAGE_BLUEZ_FIRMWARE) += bluez-firmware
package-$(ADK_PACKAGE_BLUEZ) += bluez
package-$(ADK_PACKAGE_BRIDGE_UTILS) += bridge-utils
package-$(ADK_PACKAGE_BUSYBOX) += busybox
package-$(ADK_PACKAGE_BWM) += bwm
package-$(ADK_PACKAGE_CBTT) += cbtt
package-$(ADK_COMPILE_CGILIB) += cgilib
package-$(ADK_PACKAGE_CHILLISPOT) += chillispot
package-$(ADK_PACKAGE_CLICK) += click
package-$(ADK_PACKAGE_COLLECTD) += collectd
package-$(ADK_PACKAGE_COMGT) += comgt
package-$(ADK_PACKAGE_COMPOSITEPROTO) += compositeproto
package-$(ADK_PACKAGE_CTORRENT) += ctorrent
package-$(ADK_PACKAGE_CUPS) += cups
package-$(ADK_COMPILE_CURL) += curl
package-$(ADK_PACKAGE_CUTTER) += cutter
package-$(ADK_PACKAGE_CRYPTSETUP) += cryptsetup
package-$(ADK_COMPILE_CYRUS_SASL) += cyrus-sasl
package-$(ADK_PACKAGE_CXXTOOLS) += cxxtools
package-$(ADK_PACKAGE_DAMAGEPROTO) += damageproto
package-$(ADK_PACKAGE_DANSGUARDIAN) += dansguardian
package-$(ADK_PACKAGE_DAVFS2) += davfs2
package-$(ADK_PACKAGE_DBUS) += dbus
package-$(ADK_PACKAGE_DECO) += deco
package-$(ADK_COMPILE_DHCP) += dhcp
package-$(ADK_PACKAGE_DHCP_FORWARDER) += dhcp-forwarder
package-$(ADK_PACKAGE_DIFFUTILS) += diffutils
package-$(ADK_PACKAGE_DIGITEMP) += digitemp
package-$(ADK_PACKAGE_DNSMASQ) += dnsmasq
package-$(ADK_PACKAGE_DOSFSTOOLS) += dosfstools
package-$(ADK_PACKAGE_DOVECOT) += dovecot
package-$(ADK_PACKAGE_DROPBEAR) += dropbear
package-$(ADK_PACKAGE_DSNIFF) += dsniff
package-$(ADK_PACKAGE_E2FSPROGS) += e2fsprogs
package-$(ADK_PACKAGE_LIBUUID) += e2fsprogs
package-$(ADK_PACKAGE_LIBBLKID) += e2fsprogs
package-$(ADK_PACKAGE_ELINKS) += elinks
package-$(ADK_PACKAGE_ESOUND) += esound
package-$(ADK_PACKAGE_ETHER_WAKE) += ether-wake
package-$(ADK_PACKAGE_ETHTOOL) += ethtool
package-$(ADK_PACKAGE_EVIEEXT) += evieext
package-$(ADK_COMPILE_EXPAT) += expat
package-$(ADK_COMPILE_EXMAP) += exmap
package-$(ADK_PACKAGE_EZIPUPDATE) += ez-ipupdate
package-$(ADK_COMPILE_FAAD2) += faad2
package-$(ADK_PACKAGE_FAKEIDENTD) += fakeidentd
package-$(ADK_PACKAGE_FBSET) += fbset
package-$(ADK_PACKAGE_FETCHMAIL) += fetchmail
package-$(ADK_PACKAGE_FFMPEG) += ffmpeg
package-$(ADK_PACKAGE_FILE) += file
package-$(ADK_PACKAGE_FIXESPROTO) += fixesproto
package-$(ADK_COMPILE_FLAC) += flac
package-$(ADK_PACKAGE_FLEX) += flex
package-$(ADK_PACKAGE_FONTSPROTO) += fontsproto
package-$(ADK_PACKAGE_FONTCACHEPROTO) += fontcacheproto
package-$(ADK_PACKAGE_FPING) += fping
package-$(ADK_PACKAGE_FPROBE) += fprobe
package-$(ADK_PACKAGE_FPROBE_ULOG) += fprobe-ulog
package-$(ADK_COMPILE_FREERADIUS_CLIENT) += freeradius-client
package-$(ADK_PACKAGE_FREERADIUS_SERVER) += freeradius-server
package-$(ADK_COMPILE_FREETYPE) += freetype
package-$(ADK_PACKAGE_FRICKIN) += frickin
package-$(ADK_COMPILE_FUSE) += fuse
package-$(ADK_PACKAGE_GATLING) += gatling
package-$(ADK_PACKAGE_GAWK) += gawk
package-$(ADK_PACKAGE_GCC) += gcc
package-$(ADK_PACKAGE_GDB) += gdb
package-$(ADK_PACKAGE_GDBSERVER) += gdbserver
package-$(ADK_PACKAGE_GETTEXT) += gettext
package-$(ADK_PACKAGE_GIT) += git
package-$(ADK_PACKAGE_GKRELLMD) += gkrellmd
package-$(ADK_PACKAGE_GLIB) += glib
ifeq (${ADK_TARGET_LIB_GLIBC},y)
package-$(ADK_PACKAGE_GLIBC) += glibc
endif
ifeq (${ADK_TARGET_LIB_EGLIBC},y)
package-$(ADK_PACKAGE_EGLIBC) += eglibc
endif
ifeq (${ADK_NATIVE},y)
package-$(ADK_PACKAGE_LIBC) += libc
endif
package-$(ADK_PACKAGE_GMEDIASERVER) += gmediaserver
package-$(ADK_COMPILE_GMP) += gmp
package-$(ADK_COMPILE_GNUTLS) += gnutls
package-$(ADK_PACKAGE_GPERF) += gperf
package-$(ADK_PACKAGE_GPG) += gpg
package-$(ADK_PACKAGE_GPM) += gpm
package-$(ADK_PACKAGE_GPSD) += gpsd
package-$(ADK_PACKAGE_GRUB_BIN) += grub-bin
package-$(ADK_COMPILE_GSM) += gsm
package-$(ADK_PACKAGE_HASERL) += haserl
package-$(ADK_PACKAGE_HDPARM) += hdparm
package-$(ADK_COMPILE_HEIMDAL) += heimdal
package-$(ADK_PACKAGE_HEYU) += heyu
package-$(ADK_COMPILE_HOSTAPD) += hostapd
package-$(ADK_PACKAGE_HTPDATE) += htpdate
package-$(ADK_PACKAGE_HTTPING) += httping
package-$(ADK_PACKAGE_HTTPTUNNEL) += httptunnel
package-$(ADK_PACKAGE_ICECAST) += icecast
package-$(ADK_PACKAGE_ID3LIB) += id3lib
package-$(ADK_PACKAGE_IFTOP) += iftop
package-$(ADK_PACKAGE_IGMPPROXY) += igmpproxy
package-$(ADK_PACKAGE_INPUTPROTO) += inputproto
package-$(ADK_PACKAGE_IPCAD) += ipcad
package-$(ADK_PACKAGE_IPERF) += iperf
package-$(ADK_COMPILE_IPROUTE2) += iproute2
package-$(ADK_PACKAGE_IPSEC_TOOLS) += ipsec-tools
package-$(ADK_PACKAGE_IPSET) += ipset
package-$(ADK_COMPILE_IPTABLES) += iptables
package-$(ADK_PACKAGE_IPTABLES_SNMP) += iptables-snmp
package-$(ADK_PACKAGE_IPTRAF) += iptraf
package-$(ADK_PACKAGE_IRSSI) += irssi
package-$(ADK_PACKAGE_IW) += iw
package-$(ADK_PACKAGE_JAMVM) += jamvm
package-$(ADK_COMPILE_JPEG) += jpeg
package-$(ADK_PACKAGE_KBPROTO) += kbproto
package-$(ADK_COMPILE_KISMET) += kismet
package-$(ADK_COMPILE_KNOCK) += knock
package-$(ADK_COMPILE_KRB5) += krb5
package-$(ADK_PACKAGE_L2TPNS) += l2tpns
package-$(ADK_COMPILE_LAME) += lame
package-$(ADK_PACKAGE_LESS) += less
package-$(ADK_PACKAGE_LIBAO) += libao
package-$(ADK_PACKAGE_LIBART) += libart
package-$(ADK_PACKAGE_LIBAUDIOFILE) += libaudiofile
package-$(ADK_PACKAGE_LIBCLI) += libcli
package-$(ADK_PACKAGE_LIBDAEMON) += libdaemon
package-$(ADK_COMPILE_DB) += libdb
package-$(ADK_PACKAGE_LIBDNET) += libdnet
package-$(ADK_PACKAGE_LIBELF) += libelf
package-$(ADK_PACKAGE_LIBEVENT) += libevent
package-$(ADK_PACKAGE_LIBFFI) += libffi
package-$(ADK_PACKAGE_LIBFONTENC) += libfontenc
package-$(ADK_PACKAGE_LIBGCRYPT) += libgcrypt
package-$(ADK_PACKAGE_LIBGD) += libgd
package-$(ADK_PACKAGE_LIBGDBM) += gdbm
package-$(ADK_PACKAGE_LIBGPG_ERROR) += libgpg-error
package-$(ADK_PACKAGE_LIBGSSGLUE) += libgssglue
package-$(ADK_PACKAGE_LIBICONV) += libiconv
package-$(ADK_PACKAGE_LIBID3TAG) += libid3tag
package-$(ADK_PACKAGE_LIBLZO) += liblzo
package-$(ADK_PACKAGE_LIBMAD) += libmad
package-$(ADK_PACKAGE_LIBMMS) += libmms
package-$(ADK_PACKAGE_LIBNET) += libnet
package-$(ADK_PACKAGE_LIBNFSIDMAP) += libnfsidmap
package-$(ADK_PACKAGE_LIBNIDS) += libnids
package-$(ADK_PACKAGE_LIBNL) += libnl
package-$(ADK_PACKAGE_LIBOGG) += libogg
package-$(ADK_PACAKGE_LIBOL) += libol
package-$(ADK_PACKAGE_LIBOSIP2) += libosip2
package-$(ADK_COMPILE_LIBOWFAT) += libowfat
package-$(ADK_PACKAGE_LIBP11) += libp11
package-$(ADK_PACKAGE_LIBPCAP) += libpcap
package-$(ADK_PACKAGE_LIBPCIACCESS) += libpciaccess
package-$(ADK_PACKAGE_LIBPNG) += libpng
package-$(ADK_PACKAGE_LIBPRI) += libpri
ifneq (${ADK_NATIVE},y)
package-$(ADK_PACKAGE_LIBPTHREAD) += libpthread
endif
package-$(ADK_COMPILE_LIBSHOUT) += libshout
package-$(ADK_PACKAGE_LIBSIGCXX) += libsigc++
package-$(ADK_PACKAGE_LIBSTDCXX) += libstdcxx
package-$(ADK_PACKAGE_LIBRPCSECGSS) += librpcsecgss
package-$(ADK_PACKAGE_LIBTASN1) += libtasn1
package-$(ADK_PACKAGE_LIBTHREAD_DB) += libthread_db
package-$(ADK_PACKAGE_LIBTIFF) += libtiff
package-$(ADK_PACKAGE_LIBTIRPC) += libtirpc
package-$(ADK_PACKAGE_LIBTORRENT) += libtorrent
package-$(ADK_COMPILE_LIBTOOL) += libtool
package-$(ADK_PACKAGE_LIBUPNP) += libupnp
package-$(ADK_PACKAGE_LIBUSB) += libusb
package-$(ADK_PACKAGE_LIBUSB_COMPAT) += libusb-compat
package-$(ADK_PACKAGE_LIBVIRT) += libvirt
package-$(ADK_PACKAGE_LIBVORBIS) += libvorbis
package-$(ADK_PACKAGE_LIBVORBISIDEC) += libvorbisidec
package-$(ADK_PACKAGE_LIBICE) += libICE
package-$(ADK_PACKAGE_LIBSM) += libSM
package-$(ADK_PACKAGE_LIBX11) += libX11
package-$(ADK_PACKAGE_LIBXAU) += libXau
package-$(ADK_PACKAGE_LIBXAW) += libXaw
package-$(ADK_PACKAGE_LIBXPM) += libXpm
package-$(ADK_PACKAGE_LIBXV) += libXv
package-$(ADK_PACKAGE_LIBXDMCP) += libXdmcp
package-$(ADK_PACKAGE_LIBXEXT) += libXext
package-$(ADK_PACKAGE_LIBXFONT) += libXfont
package-$(ADK_PACKAGE_LIBXKBFILE) += libxkbfile
package-$(ADK_PACKAGE_LIBXXF86DGA) += libXxf86dga
package-$(ADK_PACKAGE_LIBXML2) += libxml2
package-$(ADK_PACKAGE_LIBXMU) += libXmu
package-$(ADK_PACKAGE_LIBXSLT) += libxslt
package-$(ADK_PACKAGE_LIBXT) += libXt
package-$(ADK_PACKAGE_LIGHTTPD) += lighttpd
package-$(ADK_PACKAGE_LINKS) += links
package-$(ADK_COMPILE_LINUX_ATM) += linux-atm
package-$(ADK_PACKAGE_LOGROTATE) += logrotate
package-$(ADK_PACKAGE_LRZSZ) += lrzsz
package-${ADK_PACKAGE_LYNX} += lynx
package-$(ADK_COMPILE_LUA) += lua
package-$(ADK_COMPILE_LVM) += lvm
package-$(ADK_PACKAGE_MACCHANGER) += macchanger
package-$(ADK_PACKAGE_MADPLAY) += madplay
package-$(ADK_PACKAGE_M4) += m4
package-$(ADK_PACKAGE_MAKE) += make
package-$(ADK_PACKAGE_MARADNS) += maradns
package-$(ADK_PACKAGE_MGETTY) += mgetty
package-$(ADK_PACKAGE_MC) += mc
package-$(ADK_PACKAGE_MDADM) += mdadm
package-$(ADK_PACKAGE_MIAU) += miau
package-$(ADK_PACKAGE_MIAX) += miax
package-$(ADK_PACKAGE_MICROPERL) += microperl
package-$(ADK_COMPILE_MINI_HTTPD) += mini_httpd
package-$(ADK_PACKAGE_MINI_SENDMAIL) += mini_sendmail
package-$(ADK_COMPILE_MIREDO) += miredo
package-$(ADK_PACKAGE_MKSH) += mksh
package-$(ADK_PACKAGE_MOC) += moc
package-$(ADK_PACKAGE_MONIT) += monit
package-$(ADK_PACKAGE_MOTION) += motion
package-$(ADK_PACKAGE_MPD) += mpd
package-$(ADK_PACKAGE_MPFR) += mpfr
package-$(ADK_PACKAGE_MPLAYER) += mplayer
package-$(ADK_PACKAGE_MRD6) += mrd6
package-$(ADK_PACKAGE_MT_DAAPD) += mt-daapd
package-$(ADK_PACKAGE_MTD) += mtd
package-$(ADK_PACKAGE_MTR) += mtr
package-$(ADK_PACKAGE_MUTT) += mutt
package-$(ADK_COMPILE_MYSQL) += mysql
package-$(ADK_PACKAGE_NANO) += nano
package-$(ADK_COMPILE_NCURSES) += ncurses
package-$(ADK_PACKAGE_NUT) += nut
package-$(ADK_PACKAGE_LIBNCURSES) += ncurses
package-$(ADK_COMPILE_NDISC6) += ndisc
package-$(ADK_PACKAGE_NEON) += neon
package-$(ADK_COMPILE_NET_SNMP) += net-snmp
package-$(ADK_PACKAGE_NETPERF) += netperf
package-$(ADK_PACKAGE_NETSTAT_NAT) += netstat-nat
package-$(ADK_PACKAGE_NFS_UTILS) += nfs-utils
package-$(ADK_PACKAGE_NFS_KERNEL_NFSD) += nfs-utils
package-$(ADK_PACKAGE_NMAP) += nmap
package-$(ADK_PACKAGE_NTPCLIENT) += ntpclient
package-$(ADK_PACKAGE_NSS) += nss
package-$(ADK_COMPILE_OBEXFTP) += obexftp
package-$(ADK_PACKAGE_OLSRD) += olsrd
package-$(ADK_COMPILE_OPENCDK) += opencdk
package-$(ADK_PACKAGE_OPENCT) += openct
package-$(ADK_PACKAGE_OPENOBEX) += openobex
package-$(ADK_COMPILE_OPENLDAP) += openldap
package-$(ADK_PACKAGE_OPENNTPD) += openntpd
package-$(ADK_PACKAGE_OPENSC) += opensc
package-$(ADK_PACKAGE_OPENSIPS) += opensips
package-$(ADK_COMPILE_OPENSSH) += openssh
package-$(ADK_COMPILE_OPENSSL) += openssl
package-$(ADK_PACKAGE_OPENSSL_PKCS11) += openssl-pkcs11
package-$(ADK_PACKAGE_OPENSWAN) += openswan
package-$(ADK_PACKAGE_OPENVPN) += openvpn
package-$(ADK_PACKAGE_OPROFILE) += oprofile
package-$(ADK_COMPILE_OSIRIS) += osiris
package-$(ADK_PACKAGE_OWFS) += owfs
package-$(ADK_PACKAGE_P910ND) += p910nd
package-$(ADK_PACKAGE_PALANTIR) += palantir
package-$(ADK_PACKAGE_PARPROUTED) += parprouted
package-$(ADK_PACKAGE_PARTED) += parted
package-$(ADK_PACKAGE_PATCH) += patch
package-$(ADK_PACKAGE_PCIUTILS) += pciutils
package-$(ADK_COMPILE_PCRE) += pcre
package-$(ADK_PACKAGE_PERL) += perl
package-$(ADK_COMPILE_PHP) += php
package-$(ADK_PACKAGE_PICOCOM) += picocom
package-$(ADK_PACKAGE_PIPACS) += pipacs
package-$(ADK_PACKAGE_PIXMAN) += pixman
package-$(ADK_COMPILE_PMACCT) += pmacct
package-$(ADK_COMPILE_POPT) += popt
package-$(ADK_PACKAGE_PORTMAP) += portmap
package-$(ADK_PACKAGE_PORTSENTRY) += portsentry
package-$(ADK_COMPILE_POSTGRESQL) += postgresql
package-$(ADK_PACKAGE_PPP) += ppp
package-$(ADK_PACKAGE_PPTP) += pptp
package-$(ADK_PACKAGE_PPTPD) += pptpd
package-$(ADK_PACKAGE_PRIVOXY) += privoxy
package-$(ADK_PACKAGE_PROCMAIL) += procmail
package-$(ADK_PACKAGE_PROCPS) += procps
package-$(ADK_PACKAGE_PTUNNEL) += ptunnel
package-$(ADK_PACKAGE_PYTHON) += python
package-$(ADK_PACKAGE_QUAGGA) += quagga
package-$(ADK_PACKAGE_RADDUMP) += raddump
package-$(ADK_PACKAGE_RADVD) += radvd
package-$(ADK_PACKAGE_RANDRPROTO) += randrproto
package-$(ADK_PACKAGE_RARPD) += rarpd
package-$(ADK_PACKAGE_RDATE) += rdate
package-$(ADK_COMPILE_READLINE) += readline
package-$(ADK_PACKAGE_REAIM) += reaim
package-$(ADK_PACKAGE_RENDERPROTO) += renderproto
package-$(ADK_PACKAGE_RESOURCEPROTO) += resourceproto
package-$(ADK_COMPILE_RP_PPPOE) += rp-pppoe
package-$(ADK_PACKAGE_RPM) += rpm
package-$(ADK_PACKAGE_RRDCOLLECT) += rrdcollect
package-$(ADK_COMPILE_RRDTOOL) += rrdtool
package-$(ADK_PACKAGE_RUBY) += ruby
package-$(ADK_COMPILE_RRS) += rrs
package-$(ADK_PACKAGE_RSYNC) += rsync
package-$(ADK_PACKAGE_RTORRENT) += rtorrent
package-$(ADK_COMPILE_SAMBA) += samba
package-$(ADK_PACKAGE_SANE_BACKENDS) += sane-backends
package-$(ADK_PACKAGE_SCANLOGD) += scanlogd
package-$(ADK_PACKAGE_SCDP) += scdp
package-$(ADK_PACKAGE_SCREEN) += screen
package-$(ADK_PACKAGE_SCRNSAVERPROTO) += scrnsaverproto
package-$(ADK_PACKAGE_SCSI_SPIN) += scsi-spin
package-$(ADK_PACKAGE_SER2NET) += ser2net
package-$(ADK_PACKAGE_SERDISPLIB) += serdisplib
package-$(ADK_PACKAGE_SETPWC) += setpwc
package-$(ADK_PACKAGE_SETSERIAL) += setserial
package-$(ADK_PACKAGE_SHAT) += shat
package-$(ADK_PACKAGE_SHOREWALL) += shorewall-common
package-${ADK_PACKAGE_SHOREWALL_SHELL} += shorewall-shell
package-$(ADK_PACKAGE_SIPROXD) += siproxd
package-$(ADK_PACKAGE_SIPSAK) += sipsak
package-$(ADK_PACKAGE_SISPMCTL) += sispmctl
package-$(ADK_COMPILE_SNORT) += snort
package-$(ADK_COMPILE_SNORT_WIRELESS) += snort-wireless
package-$(ADK_PACKAGE_SOCAT) += socat
package-$(ADK_COMPILE_SPEEX) += speex
package-$(ADK_COMPILE_SQLITE) += sqlite
package-$(ADK_PACKAGE_SQUID) += squid
package-$(ADK_PACKAGE_SRELAY) += srelay
package-$(ADK_PACKAGE_SSLTUNNEL) += ssltunnel
package-$(ADK_PACKAGE_SSMTP) += ssmtp
package-$(ADK_PACKAGE_STRACE) += strace
package-$(ADK_PACKAGE_STRESS) += stress
package-$(ADK_PACKAGE_SUBVERSION) += subversion
package-$(ADK_PACKAGE_SWCONFIG) += swconfig
package-$(ADK_PACKAGE_SYSLOG_NG) += syslog-ng
package-$(ADK_PACKAGE_SYSSTAT) += sysstat
package-${ADK_PACKAGE_TCL} += tcl
package-$(ADK_PACKAGE_LIBWRAP) += tcp_wrappers
package-$(ADK_PACKAGE_TAR) += tar
package-$(ADK_PACKAGE_TCPDUMP) += tcpdump
package-$(ADK_PACKAGE_TINC) += tinc
package-$(ADK_PACKAGE_TINYPROXY) += tinyproxy
package-$(ADK_PACKAGE_TMSNC) += tmsnc
package-$(ADK_PACKAGE_TNTNET) += tntnet
package-$(ADK_PACKAGE_TOR) += tor
package-$(ADK_PACKAGE_TRAFSHOW) += trafshow
package-$(ADK_PACKAGE_TTCP) += ttcp
ifneq (${ADK_TARGET_LIB_GLIBC},y)
ifneq (${ADK_NATIVE},y)
package-$(ADK_PACKAGE_UCLIBC) += uclibc
endif
package-$(ADK_PACKAGE_UCLIBCXX) += uclibc++
endif
package-$(ADK_PACKAGE_UDEV) += udev
package-$(ADK_PACKAGE_UDP_BROADCAST_RELAY) += udp-broadcast-relay
package-$(ADK_PACKAGE_ULOGD) += ulogd
package-$(ADK_PACKAGE_UPDATEDD) += updatedd
package-$(ADK_COMPILE_USBUTILS) += usbutils
package-$(ADK_PACKAGE_USSP_PUSH) += ussp-push
package-$(ADK_PACKAGE_USTL) += ustl
package-$(ADK_COMPILE_UTIL_LINUX_NG) += util-linux-ng
package-$(ADK_PACKAGE_VALGRIND) += valgrind
package-$(ADK_PACKAGE_VGP) += vgp
package-$(ADK_PACKAGE_VIDEOPROTO) += videoproto
package-$(ADK_PACKAGE_VILISTEXTUM) += vilistextum
package-$(ADK_PACKAGE_VIM) += vim
package-$(ADK_PACKAGE_VNC_REFLECTOR) += vnc-reflector
package-$(ADK_PACKAGE_VNSTAT) += vnstat
package-$(ADK_PACKAGE_VPNC) += vpnc
package-$(ADK_PACKAGE_VRRPD) += vrrpd
package-$(ADK_PACKAGE_VSFTPD) += vsftpd
package-$(ADK_PACKAGE_VTUN) += vtun
package-$(ADK_PACKAGE_WATCHDOG) += watchdog
package-$(ADK_PACKAGE_WCCPD) += wccpd
package-$(ADK_PACKAGE_WDFS) += wdfs
package-$(ADK_PACKAGE_WEECHAT) += weechat
package-$(ADK_PACKAGE_WGET) += wget
package-$(ADK_PACKAGE_WIFIDOG) += wifidog
package-$(ADK_DOWNLOAD_WIRELESS_FIRMWARE) += wireless-firmware
package-$(ADK_PACKAGE_WOL) += wol
package-$(ADK_PACKAGE_WONDERSHAPER) += wondershaper
package-$(ADK_PACKAGE_WPA_SUPPLICANT) += wpa_supplicant
package-$(ADK_PACKAGE_WPUT) += wput
package-$(ADK_PACKAGE_XFSPROGS) += xfsprogs
package-$(ADK_PACKAGE_XINETD) += xinetd
package-$(ADK_PACKAGE_XCMISCPROTO) += xcmiscproto
package-$(ADK_PACKAGE_XEXTPROTO) += xextproto
package-$(ADK_PACKAGE_XKBCOMP) += xkbcomp
package-$(ADK_PACKAGE_XKEYBOARD_CONFIG) += xkeyboard-config
package-$(ADK_PACKAGE_XF86_VIDEO_GEODE) += xf86-video-geode
package-$(ADK_PACKAGE_XF86DGA) += xf86dga
package-$(ADK_PACKAGE_XF86DGAPROTO) += xf86dgaproto
package-$(ADK_PACKAGE_XPROTO) += xproto
package-$(ADK_PACKAGE_XORG_SERVER) += xorg-server
package-$(ADK_PACKAGE_XTRANS) += xtrans
package-$(ADK_PACKAGE_XZ) += xz
package-$(ADK_PACKAGE_ZLIB) += zlib
package-$(ADK_PACKAGE_ZLIB_DEV) += zlib
package-$(ADK_PACKAGE_ZSH) += zsh
# kernel addon packages
package-$(ADK_PACKAGE_KMOD_EM28XX) += em28xx
package-$(ADK_PACKAGE_NTFS_3G) += ntfs-3g

DOWNLOAD:=$(patsubst %,%-download,$(package-y) $(package-m))
COMPILE_PACKAGES:=$(patsubst %,%-compile,$(package-y) $(package-m))
INSTALL_PACKAGES:=$(patsubst %,%-install,$(package-y))

all: compile
clean: $(patsubst %,%-clean,$(package-) $(package-y) $(package-m) base-files)
ifeq ($(ADK_TOOLCHAIN_ONLY),y)
compile: $(COMPILE_PACKAGES)
install: $(INSTALL_PACKAGES)
else
compile: base-files-compile $(COMPILE_PACKAGES)
install: base-files-install $(INSTALL_PACKAGES)
endif
download: $(DOWNLOAD)

$(COMPILE_PACKAGES): base-files-compile
$(INSTALL_PACKAGES): base-files-install

$(TARGET_DIR):
	mkdir -p $(TARGET_DIR)

%-download:
	$(START_TRACE) "package/$(patsubst %-download,%,$@)-download: "
	$(MAKE) -C $(patsubst %-download,%,$@) fetch
	$(CMD_TRACE) " done"
	$(END_TRACE)

%-compile:
	$(START_TRACE) "package/$(patsubst %-compile,%,$@)-compile: "
	$(MAKE) -C $(patsubst %-compile,%,$@) fake build-all-pkgs
	$(CMD_TRACE) " done"
	$(END_TRACE)

%-install: %-compile
	@$(START_TRACE) "package/$(patsubst %-install,%,$@)-install: "
	@$(MAKE) -C $(patsubst %-install,%,$@) install
	@$(CMD_TRACE) " done"
	@$(END_TRACE)

%-clean:
	@$(START_TRACE) "package/$(patsubst %-clean,%,$@)-clean: "
	@$(MAKE) -C $(patsubst %-clean,%,$@) clean
	@$(CMD_TRACE) " done"
	@$(END_TRACE)
