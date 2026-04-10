#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

if [ ! -s resume_jp/personal.typ ]; then
  echo "resume_jp/personal.typ not found, copying example data..."
  cp resume_jp/personal_example.typ resume_jp/personal.typ
  echo "Please edit resume_jp/personal.typ with your real information."
fi

typst compile resume_jp.typ
