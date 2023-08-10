#!/bin/sh

set -e

CODENAME="Standing_on_the_Shoulders_of_Giants"
CODENAME_SAFE="giants"
FLAVOURS="cinnamon gnome kde lxde lxqt mate nox xfce xorg"
RELEASE="giants"
VERSION="23.1.0"


cd pyfll/templates
for FLAVOUR in ${FLAVOURS};  do
    for ARCH  in amd64 i386; do
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
