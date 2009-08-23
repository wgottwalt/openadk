
# Copyright (C) 2005-2009 Junjiro Okajima
#
# This program, aufs is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301	 USA

ifndef KDIR
KDIR = /lib/modules/$(shell uname -r)/build
endif

CFLAGS += -I${KDIR}/include
CFLAGS += -O -Wall

Cmd = umount.aufs auchk aubrsync
Man = aufs.5
Etc = etc_default_aufs
Bin = auplink mount.aufs #auctl
BinObj = $(addsuffix .o, ${Bin})
LibSo = libau.so
LibSoObj = rdu.o
LibSoHdr = compat.h
LibUtil = libautil.a
LibUtilObj = proc_mnt.o br.o plink.o mtab.o
LibUtilHdr = au_util.h

all: ${Man} ${Bin} ${Etc} #${LibSo}

${Bin}: LDFLAGS += -static -s
${Bin}: LDLIBS = -L. -lautil
${BinObj}: %.o: %.c ${LibUtilHdr} ${LibUtil}

${LibUtilObj}: %.o: %.c ${LibUtilHdr}
${LibUtil}: ${LibUtil}(${LibUtilObj})

${LibSoObj}: CFLAGS += -fPIC
${LibSoObj}: %.o: %.c ${LibSolHdr}

# in order to reuse the default rule
Dummy = $(basename $(word 1,${LibSoObj}))
${Dummy}: LDFLAGS += --shared
${Dummy}: LDLIBS += -ldl -lpthread
${Dummy}: ${LibSoObj}
${LibSo}: ${Dummy}
	ln -f $< $@

etc_default_aufs: c2sh aufs.shlib
	${RM} $@
	echo '# aufs variables for shell scripts' > $@
	./c2sh >> $@
	echo >> $@
	sed -e '0,/^$$/d' aufs.shlib >> $@

aufs.5: aufs.in.5 c2tmac
	${RM} $@
	./c2tmac > $@
	awk '{ \
		gsub(/\140[^\047]*\047/, "\\[oq]&\\[cq]"); \
		gsub(/\\\[oq\]\140/, "\\[oq]"); \
		gsub(/\047\\\[cq\]/, "\\[cq]"); \
		gsub(/\047/, "\\[aq]"); \
		print; \
	}' aufs.in.5 >> $@
	chmod a-w $@

.INTERMEDIATE: c2sh c2tmac

install_sbin: File = mount.aufs umount.aufs auplink
install_sbin: Tgt = ${DESTDIR}/sbin
install_ubin: File = auchk aubrsync #auctl
install_ubin: Tgt = ${DESTDIR}/usr/bin
install_man: File = aufs.5
install_man: Tgt = ${DESTDIR}/usr/share/man/man5
install_ulib: Opt = -s
install_ulib: File = ${LibSo}
install_ulib: Tgt = ${DESTDIR}/ulib
install_sbin install_ubin install_man install_ulib: ${File}
	install -d ${Tgt}
	install -m 755 -o root -g root -p ${Opt} ${File} ${Tgt}
install_etc: File = etc_default_aufs
install_etc: Tgt = ${DESTDIR}/etc/default/aufs
install_etc: ${File}
	install -d $(dir ${Tgt})
	install -m 644 -o root -g root -p -T ${File} ${Tgt}

# do not inlcude install_ulib here
install: install_man install_sbin install_ubin install_etc

clean:
	${RM} ${Man} ${Bin} ${Etc} ${LibUtil} ${LibSo} *~
	${RM} ${BinObj} ${LibUtilObj} ${LibSoObj} ${Dummy}

-include priv.mk
