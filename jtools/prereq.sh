# This file is part of the OpenADK project. OpenADK is copyrighted
# material, please see the LICENCE file in the top-level directory.

# test for existing /usr/include/asm
if [ ! -d "/usr/include/asm" ]; then
	echo "ERROR: directory \"/usr/include/asm\" not found."
	echo "on some systems this is name asm-generic."
	echo "try to create a link to the asm directory with"
	echo "\"ln -s /usr/include/asm-generic /usr/include/asm\""
	exit 1
fi

# test if all files from the files.needed file are available
for LINE in `cat files.needed`; do

	FILE=`echo ${LINE} | awk -F ";" '{print $1}'`
	LIB=`echo ${LINE} | awk -F ";" '{print $2}'`

	#echo -n "looking for development files of \"${LIB}\"..."
	FOUND=`find /usr/include /usr/lib -name "${FILE}" | wc -l`
	if [ ${FOUND} -lt 1 ]; then
		echo "not found!";
		echo "Please install the development header files for the library \"${LIB}\"."
		exit 1
	fi
	
done
