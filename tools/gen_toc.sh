#! /bin/bash

PREFIX='https://twinkling-gecko.github.io/intelligent-gecko/'

cp assets/index.md index.md

for file in public/*; do
  slide=${file/public\/}
  echo "- [${slide%.*}]($PREFIX${slide})" >> index.md
done

mv index.md public/index.md
