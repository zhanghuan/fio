#!/usr/bin/sh

rm -rf rpmbuild
mkdir -p rpmbuild/BUILD
mkdir -p rpmbuild/SPECS
mkdir -p rpmbuild/RPMS
mkdir -p rpmbuild/SRPMS
mkdir -p rpmbuild/SOURCES

git archive --prefix=fio/ HEAD > rpmbuild/SOURCES/fio.tar.gz
release=$(date +%y%m%d%H)
rpmbuild -bb \
	--define "_topdir $(pwd)/rpmbuild" \
	--define "release $release" \
	./fio.spec

mv rpmbuild/RPMS/*/* .
