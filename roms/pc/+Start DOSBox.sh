#!/bin/bash

[[ ! -n "$(aconnect -o | grep -e TiMidity -e FluidSynth)" ]] && needs_synth="1"

function midi_synth() {
    [[ "$needs_synth" != "1" ]] && return

    case "$1" in
        "start")
            timidity -Os -iAD &
            i=0
            until [[ -n "$(aconnect -o | grep TiMidity)" || "$i" -ge 10 ]]; do
                sleep 1
                ((i++))
            done
            ;;
        "stop")
            killall timidity
            ;;
        *)
            ;;
    esac
}

params=("$@")
if [[ -z "${params[0]}" ]]; then
    params=(-c "@MOUNT C /home/pi/RetroPie/roms/pc" -c "@C:")
elif [[ "${params[0]}" == *.sh ]]; then
    midi_synth start
    bash "${params[@]}"
    midi_synth stop
    exit
elif [[ "${params[0]}" == *.conf ]]; then
    params=(-userconf -conf "${params[@]}")
else
    params+=(-exit)
fi

midi_synth start
"/opt/retropie/emulators/dosbox/bin/dosbox" "${params[@]}"
midi_synth stop
