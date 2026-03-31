#!/usr/bin/env bash

pkill waybar && waybar

makoctl reload
notify-send "TESTUS"
