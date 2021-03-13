#!/usr/bin/env bash


################################################################################
##
#

# * https://github.com/rxi/lite/blob/master/build.sh

#
##
################################################################################


cflags="-Wall -O3 -g -std=gnu11 -fno-strict-aliasing -Isrc"
lflags="-lSDL2 -lm"


platform="unix"
outfile="app"
compiler="gcc"
cflags="$cflags -DLUA_USE_POSIX"
lflags="$lflags -o $outfile"



mkdir -p build/obj

echo "compiling ($platform)..."

for f in $(find src -name "*.c"); do


	## https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash

	#string='My long string'
	#if [[ $string == *"My long"* ]]; then
	#	echo "It's there!"
	#fi

	#if [[ $f == *"testes"* ]]; then
	#	echo "ignore testes!"
	#	continue;
	#fi


	if [[ $f == "src/vendor/lua/testes"* ]]; then
		echo
		##echo "==> ignore testes!"
		echo "==> ignore $f"
		continue;
	fi

	if [[ $f == "src/vendor/lua/lua.c"* ]]; then
		echo
		echo "==> ignore $f"
		continue;
	fi

	if [[ $f == "src/vendor/lua/onelua.c"* ]]; then
		echo
		echo "==> ignore $f"
		continue;
	fi


	echo
	echo $f
	echo "build/obj/${f//\//_}.o"

	$compiler -c $cflags $f -o "build/obj/${f//\//_}.o"
	if [[ $? -ne 0 ]]; then
		got_error=true
	fi
done


if [[ ! $got_error ]]; then
	echo
	echo "linking..."
	$compiler build/obj/*.o $lflags
fi


echo
echo "cleaning up..."

rm build/obj/*.o
