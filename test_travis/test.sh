#!/bin/bash

function clean {
	rm test.dsk
}

function test_create {
	echo test_create
	clean

	./iDSK test.dsk -n
	test -e test.dsk || exit -1

}

function test_ascii {
	echo test_ascii
	clean

	echo "HELLO WORLD" > /tmp/hello.asc
	./iDSK test.dsk -n

	echo " > Add file"
	./iDSK test.dsk -i /tmp/hello.asc -t 0 || exit -1

	echo " > Check file presence"
	./iDSK test.dsk -l | grep "HELLO   .ASC 0" || exit -1

	echo " > Retreive file"
	./iDSK test.dsk -g "HELLO.ASC" && test -e HELLO.ASC || exit -1

	echo " > Check file content"
	test "$(cat HELLO.ASC)" = "HELLO WORLD"
}

cmake .. \
	&& make \
	&& test_create \
	&& test_ascii
