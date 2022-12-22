#!/bin/sh -e

VERSION=$2
TAR=../portlet-api-2.0-spec_$VERSION.orig.tar.gz
DIR=portlet-api-2.0-spec-$VERSION
TAG=$(echo "portlet-api_2.0_spec-$VERSION" | sed -re's/~(alpha|beta)/-\1-/')

svn export http://svn.apache.org/repos/asf/portals/portlet-spec/tags/${TAG}/ $DIR
GZIP=--best tar -c -z -f $TAR --exclude '*.jar' --exclude '*.class' $DIR
rm -rf $DIR ../$TAG

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir && echo "moved $TAR to $origDir"
fi
