#!/bin/bash
IFS="
"
for i in $(find . -name '*)' -print );do
	j=$(printf "$i"|sed -e 's# ##' -e 's#(#_#' -e 's#)##')
	mv $i $j
done
