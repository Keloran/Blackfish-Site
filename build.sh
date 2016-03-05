#!/bin/sh

usage()
{
cat << EOF
  This script can clean and build

  usage: $0 options

  OPTIONS:
    -h This message
    -c Clean the packages
    -b Clean build
EOF
}

deleteBuild()
{
  rm -rf .build
}

deletePackages()
{
    rm -rf Packages
    deleteBuild
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

while getopts ":hcb" OPTION; do
  case $OPTION in
    h)
      usage
      exit
      ;;
    b)
      deleteBuild
      ;;
    c)
      deletePackages
      ;;
  esac
done

clear

buildIt
runIt
