#!/bin/bash

RETVAL=0
GENERATED_FILES="zz_generated.*.go"
for file in $(find . -path ./vendor -prune -o -type f -name '*.go' -print | grep -E -v "$GENERATED_FILES"); do
	golint -set_exit_status "$file"
	if [[ $? -eq 1 ]]; then
		RETVAL=1
	fi
done
exit $RETVAL

