# Start Archlinux, pulseaudio daemon, and xfce4 with one script call
# Only works with my personal setup
# Do not start xfce4 inside a tmux session, all sub processes will
# not be able to run tmux if we do so.

WIN10_PULSEAUDIO_BIN_PATH=/mnt/f/wsl/pulse6/bin/

cd $WIN10_PULSEAUDIO_BIN_PATH
./pulseaudio.exe &
source ~/dotfiles/x11forward_setup.sh
startxfce4
