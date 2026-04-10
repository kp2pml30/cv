#!/usr/bin/env bash

set -e
# set -x

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

err () {
	echo "$@"
	exit 1
}

# NOTE: We do not build resume as it contains personal information

typst compile cv.typ

! (git diff master --name-only | grep -P '\w') || err "Uncommited changes"

git checkout artifacts

pdf2svg cv.pdf cv.svg
git add cv.pdf cv.svg --force
git commit --amend --no-edit
git checkout master
