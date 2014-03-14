# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

MASTER_SITE_BACKUP?=	http://${ADK_HOST}/distfiles/

MASTER_SITE_OPENADK?=	\
	http://www.openadk.org/distfiles/ \

MASTER_SITE_MIRBSD?=	\
	http://www.mirbsd.org/MirOS/distfiles/ \
	http://pub.allbsd.org/MirOS/distfiles/ \

MASTER_SITE_KERNEL?=	\
	ftp://www.kernel.org/pub/linux/ \
	http://www.kernel.org/pub/linux/ \

MASTER_SITE_XORG?=	\
	http://www.x.org/releases/individual/xserver/ \
	http://www.x.org/releases/individual/proto/ \
	http://www.x.org/releases/individual/app/ \
	http://www.x.org/releases/individual/xcb/ \
	http://www.x.org/releases/individual/lib/ \
	http://www.x.org/releases/individual/driver/ \
	http://www.x.org/releases/individual/util/ \
	http://xorg.freedesktop.org/releases/individual/app/ \
	http://xorg.freedesktop.org/releases/individual/lib/ \
	http://xorg.freedesktop.org/releases/individual/driver/ \
	http://www.x.org/releases/X11R7.7/src/everything/ \
	http://ftp.gwdg.de/pub/x11/x.org/pub/X11R7.7/src/everything/ \
	http://xorg.freedesktop.org/releases/X11R7.7/src/everything/ \
	
MASTER_SITE_GNU?=	\
	http://ftp.gnu.org/gnu/ \
	ftp://ftp.gnu.org/gnu/ \
	ftp://ftp.funet.fi/pub/gnu/prep/ \
	ftp://mirrors.usc.edu/pub/gnu/ \
	ftp://ftp.cs.tu-berlin.de/pub/gnu/ \
	ftp://aeneas.mit.edu/pub/gnu/ \
	ftp://mirrors.dotsrc.org/gnu/ \
	ftp://ftp.wustl.edu/pub/gnu/ \
	ftp://ftp.kddilabs.jp/GNU/ \
	ftp://ftp.mirror.ac.uk/sites/ftp.gnu.org/gnu/ \
	ftp://sunsite.org.uk/package/gnu/ \
	ftp://ftp.informatik.hu-berlin.de/pub/gnu/ \
	ftp://ftp.rediris.es/mirror/gnu/gnu/ \
	ftp://ftp.cs.univ-paris8.fr/mirrors/ftp.gnu.org/ \
	ftp://ftp.chg.ru/pub/gnu/ \
	ftp://ftp.uvsq.fr/pub/gnu/ \
  	ftp://ftp.sunet.se/pub/gnu/ \

MASTER_SITE_SOURCEFORGE?=	\
	http://skylink.dl.sourceforge.net/sourceforge/ \
	http://garr.dl.sourceforge.net/sourceforge/ \
	http://heanet.dl.sourceforge.net/sourceforge/ \
	http://jaist.dl.sourceforge.net/sourceforge/ \
	http://nchc.dl.sourceforge.net/sourceforge/ \
	http://switch.dl.sourceforge.net/sourceforge/ \
	http://kent.dl.sourceforge.net/sourceforge/ \
	http://internap.dl.sourceforge.net/sourceforge/ \
	http://mesh.dl.sourceforge.net/sourceforge/ \
	http://ovh.dl.sourceforge.net/sourceforge/ \
	http://surfnet.dl.sourceforge.net/sourceforge/ \
	http://ufpr.dl.sourceforge.net/sourceforge/ \
	http://easynews.dl.sourceforge.net/sourceforge/ \

MASTER_SITE_MYSQL?=		\
	ftp://ftp.fu-berlin.de/unix/databases/mysql/ \
	http://sunsite.informatik.rwth-aachen.de/mysql/ \
	http://mysql.easynet.be/ \
	http://mysql.blic.net/ \
	http://mysql.online.bg/ \
	http://mysql.mirrors.cybercity.dk/ \
	http://mirrors.dotsrc.org/mysql/ \
	http://mysql.tonnikala.org/ \
	ftp://ftp.inria.fr/pub/MySQL/ \
	http://mirrors.ircam.fr/pub/mysql/ \
	http://mirrors.ee.teiath.gr/mysql/ \
	http://mysql.sote.hu/ \
	http://mysql.mirrors.crysys.hit.bme.hu/ \
	http://na.mirror.garr.it/mirrors/MySQL/ \
	http://mysql.bst.lt/ \
	http://mysql.proserve.nl/ \
	http://mirror.hostfuss.com/mysql/ \
	http://mysql.mirrors.webazilla.nl/ \
	http://mirror.dinpris.com/mysql/ \
	http://mysql.nfsi.pt/ \
	http://lisa.gov.pt/ftp/mysql/ \
	ftp://mirrors.fibernet.ro/1/MySQL/ \
	http://mysql.ran.ro/ \
	http://mysql.directnet.ru/ \
	ftp://ftp.dn.ru/pub/MySQL/ \
	http://mysql.dn.ru/ \
	http://mysql.mix.su/ \
	http://www.fastmirrors.org/mysql/ \
	http://mirrors.bevc.net/mysql/ \
	http://www.wsection.com/mysql/ \
	http://mysql.paknet.org/ \
	http://mysql.rediris.es/ \
	http://mysql.dataphone.se/ \
	http://mirror.switch.ch/ftp/mirror/mysql/ \
	ftp://ftp.solnet.ch/mirror/mysql/ \
	http://mysql.net.ua/ \
	ftp://ftp.tlk-l.net/pub/mirrors/mysql.com/ \
	http://mysql.infocom.ua/ \
	http://www.mirrorservice.org/sites/ftp.mysql.com/ \
	http://mirrors.dedipower.com/www.mysql.com/ \
	http://www.mirror.ac.uk/mirror/www.mysql.org/ \
	http://mysql.mirror.rafal.ca/ \
	http://mysql.serenitynet.com/ \
	ftp://mirror.mcs.anl.gov/pub/mysql/ \
	http://mirror.services.wisc.edu/mysql/ \
	http://mysql.orst.edu/ \
	http://mysql.he.net/ \
	http://mysql.mirrors.pair.com/ \
	http://mysql.mirror.redwire.net/ \
	http://mysql.mirrors.hoobly.com/ \
	http://mirror.trouble-free.net/mysql_mirror/ \
	http://mirrors.24-7-solutions.net/pub/mysql/ \
	http://www.stathy.com/mysql/ \
	http://mirror.x10.com/mirror/mysql/ \
	http://mysql.localhost.net.ar/ \
	http://mirrors.uol.com.br/pub/mysql/ \
	http://mysql.vision.cl/ \
	http://mysql.tecnoera.com/ \
	http://mysql.mirrors.arminco.com/ \
	http://mysqlmirror.netandhost.in/ \
	http://mirror.mysql-partners-jp.biz/ \
	http://ftp.iij.ad.jp/pub/db/mysql/ \
	http://mysql.oss.eznetsols.org/ \
	http://mysql.holywar.net/ \
	http://mysql.new21.com/ \
	http://mysql.byungsoo.net/ \
	http://mysql.isu.edu.tw/ \
	http://mysql.cdpa.nsysu.edu.tw/ \
	http://mysql.cs.pu.edu.tw/ \
	http://ftp.stu.edu.tw/pub/Unix/Database/Mysql/ \
	http://mysql.ntu.edu.tw/ \
	http://mysql.planetmirror.com/ \
	http://mysql.mirrors.ilisys.com.au/ \
	http://mysql.inspire.net.nz/ \
	http://mysql.mirror.ac.za/ \

MASTER_SITE_GNOME+=	\
	ftp://ftp.acc.umu.se/pub/GNOME/sources/	\
	ftp://ftp.rpmfind.net/linux/gnome.org/sources/ \
	ftp://ftp.unina.it/pub/linux/GNOME/sources/ \
	ftp://ftp.belnet.be/mirror/ftp.gnome.org/sources/ \
	ftp://ftp.dit.upm.es/linux/gnome/sources/ \
	ftp://ftp.dataplus.se/pub/linux/gnome/sources/ \
	ftp://ftp.cse.buffalo.edu/pub/Gnome/sources/ \
	ftp://ftp.linux.org.uk/mirrors/ftp.gnome.org/sources/ \
	ftp://ftp.gnome.org/pub/GNOME/sources/ \

