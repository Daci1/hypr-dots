pactl load-module module-null-sink sink_name=discord-share
pactl load-module module-loopback source=discord-share.monitor sink=alsa_output.usb-Logitech_G733_Gaming_Headset_0000000000000000-00.analog-stereo
pactl set-default-sink discord-share
