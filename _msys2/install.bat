set MSYS2PATH=C:\tools\msys64
mklink %MSYS2PATH%\startmsys2.cmd %USERPROFILE%\dotfiles\_msys2\startmsys2.cmd 
mklink %MSYS2PATH%\startmingw32.cmd %USERPROFILE%\dotfiles\_msys2\startmingw32.cmd 
mklink %MSYS2PATH%\startmingw64.cmd %USERPROFILE%\dotfiles\_msys2\startmingw64.cmd 
mklink %USERPROFILE%\.minttyrc %USERPROFILE%\dotfiles\_msys2\.minttyrc

rem symlink msys2 home folder to windows home folder
rmdir /S %MSYS2PATH%\home\%USERNAME%
mklink /D %MSYS2PATH%\home\%USERNAME% %USERPROFILE%