#!/bin/bash
# Download the parsec benchmark inputs from the backup source
# Provide an argument '1' if you want the native inputs as well
mkdir -p inputstmp
cd inputstmp

baseurl="https://github.com/cirosantilli/parsec-benchmark/releases/download/3.0/"

wget "${baseurl}parsec-3.0-core.tar.gz"
wget "${baseurl}parsec-3.0-input-sim.tar.gz"
tar -zxf "parsec-3.0-core.tar.gz" -C "../" --skip-old-files --strip-components=1
tar -zxf "parsec-3.0-input-sim.tar.gz" -C "../" --skip-old-files --strip-components=1

native=0

if [ -n "$1" ];then
	native="$1"
fi

if [ $native -gt 0 ];then
	for i in {0..4}
	do
		echo "$i"
		wget "${baseurl}parsec-3.0-input-native.tar.gz.${i}"
		tar -xz -f "parsec-3.0-input-native.tar.gz.${i}" -C "../"  --skip-old-files --strip-components=1
	done
fi

cd ..
rm -rf inputstmp
