set -e

pkg_dir=$1

if [[ -z $pkg_dir || ! -d $pkg_dir ]]; then
	echo "Usage: ipkg-make-index <package_directory>"
	exit 1
fi

find "$pkg_dir" -name '*.ipk' | sort | while IFS= read pkg; do
	dpkg=${pkg##*/}
	#echo "Generating index for package $dpkg" >&2
	file_size=$(ls -l $pkg | awk '{print $5}')
	md5sum=$(md5sum $pkg)
	tar -xzOf "$pkg" ./control.tar.gz | \
	    tar -xzOf - ./control | \
	    sed -e "s^Description:Filename: $dpkg\\
Size: $file_size\\
MD5Sum: ${md5sum%% *}\\
Description:"
	echo ""
done
exit 0
