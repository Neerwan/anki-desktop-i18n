#!/bin/bash

set -eu -o pipefail ${SHELLFLAGS}

for file in desktop/*/anki.po; do
  (msgmerge -q "$file" desktop/anki.pot | msgfmt - --output-file /dev/null) || (
    echo "failed to process $file"
    exit 1
  )
done
