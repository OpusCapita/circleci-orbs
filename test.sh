#!/usr/bin/env bash

tag="v1.2.3"

[[ "$tag" =~ ^v(.*)$ ]]

version="${BASH_REMATCH[1]}"

if [ -z "$version" ]; then
  echo "Wrong tag format! Tag: $tag, but expected v1.2.3"
  exit 1
fi

echo $version