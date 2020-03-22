#!/usr/bin/env bash

mkdir -p /releases/stable /releases/beta

VERSIONS=($(curl -s http://www.byond.com/download/version.txt))
echo "Stable version is ${VERSIONS[0]}"
if [ "${#VERSIONS[@]}" -gt "1" ]; then
  echo "Beta version is ${VERSIONS[1]}"
fi
exit 1
