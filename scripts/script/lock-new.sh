#!/usr/bin/bash

padAmount=89
pad=$(seq -w -s "" $padAmount | sed "s/[0-9]/\ /g")

lockMessage="Enter password to unlock."

slock -m "$pad$lockMessage"
