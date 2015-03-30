#!/bin/sh

/usr/bin/amixer -c 1 sset "Mic Boost" 0
/usr/bin/amixer -c 1 sset "Input Mux" "Line In"
/usr/bin/amixer -c 1 sset "Mic" nocap
/usr/bin/amixer -c 1 sset "Line" cap
/usr/bin/amixer -c 1 sset "Sidetone" 0
/usr/bin/amixer -c 1 sset "Output Mixer Line Bypass" off
/usr/bin/amixer -c 1 sset "Output Mixer Mic Sidetone" on
/usr/bin/amixer -c 1 sset "Store DC Offset" off
/usr/bin/amixer -c 1 sset "Output Mixer HiFi" on
/usr/bin/amixer -c 1 sset "ADC High Pass Filter" on
/usr/bin/amixer -c 1 sset "Playback Deemphasis" on
/usr/bin/amixer -c 1 sset "Master Playback ZC" off
/usr/bin/amixer -c 1 sset Master 80%
