#!/usr/bin/env bash

set -ex

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

mkdir -p build

for i in headers/*
do
    pdflatex -output-directory=build "\def\bio{\input{$i}} \input{main}"
    filename="$(basename "$i")"
    filename="${filename%.*}"
    mv build/main.pdf "build/cv-$filename.pdf"
done
