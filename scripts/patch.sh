#!/usr/bin/env bash
# A little script I whipped up to make it easy to
# patch source trees and have sane error handling
# -Erik
#
# (c) 2006, 2007 Thorsten Glaser <tg@freewrt.org>
# (c) 2002 Erik Andersen <andersen@codepoet.org>

[[ -n $BASH_VERSION ]] && shopt -s extglob

# Set directories from arguments, or use defaults.
targetdir=${1-.}
patchdir=${2-../patches}
patchpattern=${3-*}

if [ ! -d "${targetdir}" ] ; then
    echo "Aborting.  '${targetdir}' is not a directory."
    exit 1
fi
if [ ! -d "${patchdir}" ] ; then
    echo "Aborting.  '${patchdir}' is not a directory."
    exit 0
fi

wd=$(pwd)
cd $patchdir
rm -f $targetdir/.patch.tmp
for i in $(eval echo ${patchpattern}); do
    test -e "$i" || continue
    i=$patchdir/$i
    cd $wd
    case $i in
	*.gz)
	type="gzip"; uncomp="gunzip -dc"; ;;
	*.bz)
	type="bzip"; uncomp="bunzip -dc"; ;;
	*.bz2)
	type="bzip2"; uncomp="bunzip2 -dc"; ;;
	*.zip)
	type="zip"; uncomp="unzip -d"; ;;
	*.Z)
	type="compress"; uncomp="uncompress -c"; ;;
	*)
	type="plaintext"; uncomp="cat"; ;;
    esac
    [ -d "${i}" ] && echo "Ignoring subdirectory ${i}" && continue
    echo ""
    echo "Applying ${i} using ${type}: "
    ${uncomp} ${i} | tee $targetdir/.patch.tmp | patch -p1 -E -d ${targetdir}
    fgrep '@@ -0,0 ' $targetdir/.patch.tmp >/dev/null 2>&1 && \
      touch $targetdir/.patched-newfiles
    rm -f $targetdir/.patch.tmp
    if [ $? != 0 ] ; then
        echo "Patch failed!  Please fix $i!"
	exit 1
    fi
    cd $patchdir
done

# Check for rejects...
if [ "`find $targetdir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
    echo "Aborting.  Reject files found."
    exit 1
fi

# Remove backup files
find $targetdir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
