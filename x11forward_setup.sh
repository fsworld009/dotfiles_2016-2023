export DISPLAY=:0

# fcitx setup
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
killall fcitx
fcitx &

# imwheel
killall imwheel
imwheel &
