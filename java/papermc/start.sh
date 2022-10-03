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
./update.sh
cd ./paper
screen -s paper ./paper.sh
cd ./velocity
screen -s velocity ./velocity.sh
echo "Type screen -x paper/velocity to switch to console"
