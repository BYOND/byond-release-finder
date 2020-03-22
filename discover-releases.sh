#!/usr/bin/env bash

process_release() {
  local FOLDER=$1
  local VERSION=$2
  local MAJOR_VERSION=$(cut -d '.' -f 1 <<< "${VERSION}")

  if [ ! -d "${FOLDER}/${VERSION}" ]; then
    mkdir -p ${FOLDER}/${VERSION}
    curl -o ${FOLDER}/${VERSION}/byond.zip http://www.byond.com/download/build/${MAJOR_VERSION}/${VERSION}_byond_linux.zip
    unzip ${FOLDER}/${VERSION}/byond.zip 'byond/*' -d ${FOLDER}/${VERSION}
    rm ${FOLDER}/${VERSION}/byond.zip
    return 1
  fi
  return 0
}

VERSIONS=($(curl -s http://www.byond.com/download/version.txt))
STABLE_VERSION=${VERSIONS[0]}
BETA_VERSION=${VERSIONS[1]}
EXIT=0
echo "Stable version is ${STABLE_VERSION}"
process_release /releases/stable ${STABLE_VERSION}
EXIT=$(($?|${EXIT}))

if [ "${#VERSIONS[@]}" -gt "1" ]; then
  echo "Beta version is ${BETA_VERSION}"
  process_release /releases/beta ${STABLE_VERSION}
  EXIT=$(($?|${EXIT}))
fi

exit ${EXIT}
