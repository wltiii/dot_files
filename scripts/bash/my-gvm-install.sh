#!/bin/bash

	CANDIDATE="$1"
	VERSION="$2"
	__gvmtool_download "${CANDIDATE}" "${VERSION}" || return 1
	echo "Installing: ${CANDIDATE} ${VERSION}"

	mkdir -p "${GVM_DIR}/${CANDIDATE}"

	unzip -oq "${GVM_DIR}/archives/${CANDIDATE}-${VERSION}.zip" -d "${GVM_DIR}/tmp/"
	mv "${GVM_DIR}"/tmp/*-${VERSION} "${GVM_DIR}/${CANDIDATE}/${VERSION}"
	echo "Done installing!"
	echo ""

