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

# Arch Linux has removed gvfs-trash, set Electron trash command to 
# trash-cli. Fix VS Code cannot move to Trash issue
export ELECTRON_TRASH=trash-cli
