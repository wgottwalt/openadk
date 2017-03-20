#!/usr/bin/env bash
#
# make-module-ipkgs.sh - scan through modules directory and create a package
#                        for each of them automatically.
#
# Copyright (C) 2015 - Phil Sutter <phil@nwl.cc>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
# Usage:
# $0 <ARCH> <KERNEL_VERSION> <LINUX_BUILD_DIR> <pkg-build-cmd> <PACKAGE_DIR>

ARCH="$1"
VER="$2"
BUILD_DIR="$3"
PKG_BUILD="$4"
PACKAGE_DIR="$5"

# declare associative arrays
declare -A modpaths moddeps modlevels

# recursively find a level for given module which is high enough so all
# dependencies are in a lower level
find_modlevel() { # (modname)
	local dep level=0
	for dep in ${moddeps[$1]}; do
		[[ -n "${modlevels[$dep]}" ]] || find_modlevel $dep
		[[ ${modlevels[$dep]} -lt $level ]] || level=$((modlevels[$dep] + 1))
	done
	modlevels[$1]=$level
}

# sanitize modname, ipkg does not allow uppercase or underscores
pkgname() { # (modname)
	tr 'A-Z_' 'a-z-' <<< "kmod-$1"
}

for modpath in $(find ${BUILD_DIR}/modules -name \*.ko | xargs); do
	modname="$(basename $modpath .ko)"
	moddep="$(strings $modpath | awk -F= '/^depends=/{print $2}' | sed 's/,/ /g')"
	modpaths[$modname]="$modpath"
	moddeps[$modname]="$moddep"
done

#echo "modpaths:"
#for modname in ${!modpaths[@]}; do
#	echo "$modname: ${modpaths[$modname]}"
#done
#echo
#echo "moddeps:"
#for modname in ${!moddeps[@]}; do
#	echo "$modname: ${moddeps[$modname]}"
#done
#echo

# start with empty directory, avoid leftovers after version change
rm -rf ${BUILD_DIR}/linux-modules

for modname in ${!modpaths[@]}; do
	find_modlevel $modname

	ctrlfile=${BUILD_DIR}/kmod-control/kmod-${modname}.control
	ipkgdir=${BUILD_DIR}/linux-modules/ipkg/$modname

	cat >$ctrlfile <<-EOF
		Package: $(pkgname $modname)
		Priority: optional
		Section: sys
		Description: kernel module $modname
	EOF
	sh $(dirname $0)/make-ipkg-dir.sh $ipkgdir $ctrlfile $VER $ARCH

	depline="kernel ($VER)"
	for m in ${moddeps[$modname]}; do
		depline+=", $(pkgname ${m})"
	done
	echo "Depends: $depline" >>${ipkgdir}/CONTROL/control
	mkdir -p ${ipkgdir}/lib/modules/${VER}
	cp ${modpaths[$modname]} ${ipkgdir}/lib/modules/${VER}
	cat >${ipkgdir}/CONTROL/postinst <<EOF
#!/bin/sh
if [ -z \${IPKG_INSTROOT} ]; then
	. /etc/functions.sh
	load_modules /etc/modules.d/${modlevels[$modname]}-$modname
fi
EOF
	chmod 0755 ${ipkgdir}/CONTROL/postinst
	mkdir -p ${ipkgdir}/etc/modules.d
	echo $modname >${ipkgdir}/etc/modules.d/${modlevels[$modname]}-$modname
	env ${PKG_BUILD} ${ipkgdir} ${PACKAGE_DIR} || exit 1
done
