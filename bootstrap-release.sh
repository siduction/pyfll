#!/bin/sh

set -e

CODENAME="Shine on ..."
CODENAME_SAFE="shine-on"
FLAVOURS="kde lxqt nox xfce xorg"
RELEASE="shine-on"
VERSION="2024.1.0"


cd pyfll/templates
for FLAVOUR in ${FLAVOURS};  do
    for ARCH  in amd64; do
        case $ARCH in
            "amd64") KERNEL="amd64"
            ;;
            "i386") KERNEL="686"
            ;;
        esac
        sed -e "s/\@ARCH\@/${ARCH}/g" \
            -e "s/\@CODENAME\@/${CODENAME}/g" \
            -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
            -e "s/\@FLAVOUR\@/${FLAVOUR}/g" \
            -e "s/\@KERNEL\@/${KERNEL}/g" \
            -e "s/\@RELEASE\@/${RELEASE}/g" \
            -e "s/\@VERSION\@/${VERSION}/g" \
             ${RELEASE}.conf \
             > ../conf/${FLAVOUR}_${RELEASE}_${ARCH}.conf
   done
done
