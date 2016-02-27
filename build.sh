#!/bin/sh

usage()
{
cat << EOF
  This script can clean and build

  usage: $0 options

  OPTIONS:
    -h This message
    -c Clean the packages
EOF
}

deletePackages()
{
    rm -rf Packages
    rm -rf .build
}

buildIt()
{
    swift build -Xcc -I/usr/local/include/libbson-1.0
}

runIt()
{
  if [ -f ".build/debug/Site" ]; then
    .build/debug/Site
  else
    echo "File not built"
  fi
}

while getopts ":hc" OPTION; do
  case $OPTION in
    h)
      usage
      exit
      ;;
    c)
      deletePackages
      ;;
  esac
done

clear

buildIt
runIt
