#!/bin/bash

set -uex

readonly DIST_DIR="dist"
readonly BINARY_NAME="app"

function build() {
  local os="${1}"
  local outputDir=$(ls -d "${DIST_DIR}"/*${1}* |head -n 1)
  v -o "${outputDir}/${BINARY_NAME}" -os "${os}" -message-limit 0 main.v
}

function main() {
  build "linux"
#  build "windows"
#  build "darwin"
}

main
