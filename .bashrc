export CLICOLOR=1
source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-prompt.sh

#http://stackoverflow.com/a/9002012/3973896
fn_exists() {
  # appended double quote is an ugly trick to make sure we do get a string -- if $1 is not a known command, type does not output anything
  [ `type -t $1`"" == 'function' ]
}

# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script/3931779#3931779
command_exists () {
    type "$1" &> /dev/null ;
}

#export PS1="\[\e[0;32m\]\w\[\e[0m\]\n\[\e[0;36m\]$\[\e[0m\] "
if fn_exists __git_ps1 && command_exists git; then
    export PS1='\[\e[0;32m\]\w\[\e[0m\] \[\e[0;35m\]$(__git_ps1)\e[0m\]'$'\n\[\e[0;36m\]$\[\e[0m\]  '
else
    export PS1="\[\e[0;32m\]\w\[\e[0m\]\n\[\e[0;36m\]$\[\e[0m\] "
fi

#clang
#PATH=/usr/local/opt/llvm/bin:$PATH