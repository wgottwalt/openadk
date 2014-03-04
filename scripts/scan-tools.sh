# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

shopt -s extglob
topdir=$(pwd)
opath=$PATH
out=0
if [ -z $(which gmake 2>/dev/null ) ];then
	makecmd=$(which make 2>/dev/null )
else
	makecmd=$(which gmake 2>/dev/null )
fi

if [[ $NO_ERROR != @(0|1) ]]; then
	echo Please do not invoke this script directly!
	exit 1
fi

set -e
rm -rf $topdir/tmp
mkdir -p $topdir/tmp
cd $topdir/tmp

os=$(uname)

rm -f foo
echo >FOO
if [[ -e foo ]]; then
	cat >&2 <<-EOF
		ERROR: OpenADK cannot be built in a case-insensitive file system. 
	EOF
	case $os in
		CYG*)
			echo "Building OpenADK on $os needs a small registry change."
			echo 'http://cygwin.com/cygwin-ug-net/using-specialnames.html'
			;;
		Darwin*)
			echo "Building OpenADK on $os needs a case-sensitive disk partition."
			echo "For Snow Leopard and above you can use diskutil to resize your existing disk."
			echo "For older versions you might consider to use a disk image."
			echo "Example: sudo diskutil resizeVolume disk0s2 90G 1 jhfsx adk 30G"
			;;
	esac
	exit 1
fi
rm -f FOO

case $os in
Linux)
	;;
FreeBSD)
	;;
MirBSD)
	;;
CYG*)
	;;
NetBSD)
	;;
OpenBSD)
	;;
Darwin*)
	;;
*)
	# unsupported
	echo "Building OpenADK on $os is currently unsupported."
	echo "Sorry."
	exit 1
	;;
esac

set +e

cat >Makefile <<'EOF'
include ${TOPDIR}/prereq.mk
all: run-test

test: test.c
	${CC_FOR_BUILD} ${CFLAGS_FOR_BUILD} -o $@ $^ ${LDADD}

run-test: test
	./test
EOF
cat >test.c <<-'EOF'
	#include <stdio.h>
	int
	main()
	{
		printf("Yay! Native compiler works.\n");
		return (0);
	}
EOF
X=$($makecmd TOPDIR=$topdir 2>&1)
if [[ $X != *@(Native compiler works)* ]]; then
	echo "$X" | sed 's/^/| /'
	echo Cannot compile a simple test programme.
	echo You must install a host make and C compiler,
	echo usually GCC, to proceed.
	echo
	out=1
fi
rm test 2>/dev/null

if ! which tar >/dev/null 2>&1; then
	echo You must install tar to continue.
	echo
	out=1
fi

if ! which gzip >/dev/null 2>&1; then
	echo You must install gzip to continue.
	echo
	out=1
fi

if ! which patch >/dev/null 2>&1; then
	echo You must install patch to continue.
	echo
	out=1
fi

cat >test.c <<-'EOF'
	#include <stdio.h>
	#include <zlib.h>

	#ifndef STDIN_FILENO
	#define STDIN_FILENO 0
	#endif

	int
	main()
	{
		gzFile zstdin;
		char buf[1024];
		int i;

		zstdin = gzdopen(STDIN_FILENO, "rb");
		i = gzread(zstdin, buf, sizeof (buf));
		if ((i > 0) && (i < sizeof (buf)))
			buf[i] = '\0';
		buf[sizeof (buf) - 1] = '\0';
		printf("%s\n", buf);
		return (0);
	}
EOF
X=$(echo 'Yay! Native compiler works.' | gzip | \
    $makecmd TOPDIR=$topdir LDADD=-lz 2>&1)
if [[ $X != *@(Native compiler works)* ]]; then
	echo "$X" | sed 's/^/| /'
	echo Cannot compile a libz test programm.
	echo You must install the zlib development package,
	echo usually called libz-dev, and the run-time library.
	echo
	out=1
fi

if [[ ! -s /usr/include/ncurses.h ]]; then
	if [[ ! -s /usr/include/curses.h ]]; then
		if [[ ! -s /usr/include/ncurses/ncurses.h ]]; then
			echo Install ncurses header files, please.
			echo
			out=1
		fi
	fi
fi

if ! which gawk >/dev/null 2>&1; then
	echo You must install GNU awk to continue.
	echo
	out=1
fi

if ! which sed >/dev/null 2>&1; then
	echo You must install GNU sed to continue.
	echo
	out=1
fi

if ! sed --version 2>/dev/null|grep GNU >/dev/null;then
	if ! which gsed >/dev/null 2>&1; then
		echo You must install GNU sed to continue.
		echo
		out=1
	fi
fi

if ! which wget >/dev/null 2>&1; then
	echo You must install wget to continue.
	echo
	out=1
fi

if ! which perl >/dev/null 2>&1; then
	echo You must install perl to continue.
	echo
	out=1
fi

if ! which xargs >/dev/null 2>&1; then
	echo  "You need xargs to continue."
	echo
	out=1
fi

if ! which g++ >/dev/null 2>&1; then
	echo  "You need g++ (GNU C++ compiler) to continue."
	echo
	out=1
fi

cd $topdir
rm -rf tmp

exit $out
