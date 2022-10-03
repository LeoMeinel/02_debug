#!/bin/bash
###
# File: start.sh
# Author: Leopold Meinel (leo@meinel.dev)
# -----
# Copyright (c) 2022 Leopold Meinel & contributors
# SPDX ID: GPL-3.0-or-later
# URL: https://www.gnu.org/licenses/gpl-3.0-standalone.html
# -----
###

set -eu
source ./variables

./update.sh
cd "$PAPER_TARGET"
screen -dmS paper ./paper.sh
cd ../"$VELOCITY_TARGET"
screen -dmS velocity ./velocity.sh
