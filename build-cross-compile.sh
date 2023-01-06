#!/bin/bash

function build() {
  local outputDir="${1}"
  local binaryName="${2}"
  local os="${3}"
  mkdir -p "${outputDir}"
  v -o "${outputDir}/${binaryName}" -os "${os}" -message-limit 0 main.v 
}

function main() {
  build "dist/darwin_amd64"  "app" "macos"
  build "dist/linux_amd64"   "app" "linux"
  build "dist/windows_amd64" "app" "windows"
}

main
