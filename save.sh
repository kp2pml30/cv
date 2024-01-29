#!/bin/bash

set -e
# set -x

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

err () {
	echo "$@"
	exit 1
}

./build.sh

! (git diff master --name-only | grep -P '\w') || err "Uncommited changes"

git checkout artifacts
cp build/cv-*.pdf .
pdf2svg cv-compiler.pdf cv.svg
git add cv-*.pdf cv.svg
git commit --amend --no-edit
git checkout master
