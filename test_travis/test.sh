#!/bin/bash

IDSK=../iDSK

function clean {
	rm test.dsk
}

function test_create {
	echo test_create
	clean

	$(IDSK) test.dsk -n
	test -e test.dsk || exit -1

}

function test_ascii {
	echo test_ascii
	clean

	echo "HELLO WORLD" > /tmp/hello.asc
	$(IDSK) test.dsk -n

	echo " > Add file"
	$(IDSK) test.dsk -i /tmp/hello.asc -t 0 || exit -1

	echo " > Check file presence"
	$(IDSK) test.dsk -l | grep "HELLO   .ASC 0" || exit -1

	echo " > Retreive file"
	$(IDSK) test.dsk -g "HELLO.ASC" && test -e HELLO.ASC || exit -1

	echo " > Check file content"
	test "$(cat HELLO.ASC)" = "HELLO WORLD"
}


test_create && \
test_ascii
