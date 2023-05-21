#!/bin/bash
###
# File: update.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2022 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

set -eu

DIR=~/src/20-debug/java/papermc
source "$DIR"/variables

PAPER_BUILD="$(/usr/bin/curl -s "https://papermc.io/api/v2/projects/paper/versions/${PAPER_VERSION}" | /usr/bin/grep -Po 'builds.*' | /usr/bin/awk -F ',' '{ print $NF }' | /usr/bin/grep -Po '\d+')"
curl -s https://papermc.io/api/v2/projects/paper/versions/$PAPER_VERSION/builds/$PAPER_BUILD/downloads/paper-$PAPER_VERSION-$PAPER_BUILD.jar >"$PAPER_TARGET"/paper.jar
VELOCITY_BUILD="$(/usr/bin/curl -s "https://papermc.io/api/v2/projects/velocity/versions/${VELOCITY_VERSION}" | /usr/bin/grep -Po 'builds.*' | /usr/bin/awk -F ',' '{ print $NF }' | /usr/bin/grep -Po '\d+')"
curl -s https://papermc.io/api/v2/projects/velocity/versions/$VELOCITY_VERSION/builds/$VELOCITY_BUILD/downloads/velocity-$VELOCITY_VERSION-$VELOCITY_BUILD.jar >"$VELOCITY_TARGET"/velocity.jar
