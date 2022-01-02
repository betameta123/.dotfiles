#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1
pactl load-module module-loopback source=alsa_input.usb-Elgato_Systems_Elgato_Wave_3_BS47J1A07425-00.mono-fallback sink=Virtual1
pactl load-module module-loopback source=Virtual1.monitor sink=alsa_output.pci-0000_0b_00.4.analog-stereo
