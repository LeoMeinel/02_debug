#!/bin/bash
###
# File: debug.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2022 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

set -eu
source ./variables

case "$1" in
start)
    ./update.sh
    cd "$PAPER_TARGET"
    screen -dmS paper ./paper.sh
    cd "$VELOCITY_TARGET"
    screen -dmS velocity ./velocity.sh
    ;;
clean)
    cd "$PAPER_TARGET"
    git clean -xdn
    cd "$VELOCITY_TARGET"
    git clean -xdn
    ;;
stop)
    screen -S paper -p 0 -X stuff "stop^M"
    screen -S velocity -p 0 -X stuff "shutdown^M"
    ;;
esac
