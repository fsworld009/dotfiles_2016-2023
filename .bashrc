export CLICOLOR=1
source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-prompt.sh

#clang
#PATH=/usr/local/opt/llvm/bin:$PATH

#http://stackoverflow.com/a/9002012/3973896
fn_exists() {
  # appended double quote is an ugly trick to make sure we do get a string -- if $1 is not a known command, type does not output anything
  [ `type -t $1`"" == 'function' ]
}

# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script/3931779#3931779
command_exists () {
    type "$1" &> /dev/null ;
}

st () {
    #if [ $TERM_PROGRAM = "iTerm.app" ]; then
    #fi
    # modified from https://www.huyng.com/posts/productivity-boost-with-tmux-iterm2-workspaces
    # cached: # https://webcache.googleusercontent.com/search?q=cache:8MMQNUpgiCsJ:https://www.huyng.com/posts/productivity-boost-with-tmux-iterm2-workspaces+&cd=7&hl=en&ct=clnk&gl=us
    # abort if we're already inside a TMUX session
    [ "$TMUX" == "" ] || exit 0 

    # startup a "default" session if none currently exists
    tmux has-session -t _default || tmux new-session -s _default -d

    if [ "$1" != "" ]; then
        action="$1"
    else
        # present menu for user to choose which workspace to open
        PS3="Please choose your session: "
        options=($(tmux list-sessions -F "#S") "NEW")
        echo "Available sessions"
        echo "------------------"
        echo " "
        select opt in "${options[@]}"
        do
          action="$opt"
          break
        done
    fi
    #echo "action=$action"
    
    case $action in
        "NEW")
            read -p "Enter new session name: " SESSION_NAME
            tmux new -s "$SESSION_NAME"
            ;;
        # "BASH")
        #     bash --login
        #     ;;
        # "FISH")
        #     fish
        #     ;;
        # "QUIT")
        #     ;;
        *) 
            tmux attach-session -t $action
            ;; 
    esac
}

#export PS1="\[\e[0;32m\]\w\[\e[0m\]\n\[\e[0;36m\]$\[\e[0m\] "
if fn_exists __git_ps1 && command_exists git; then
    export PS1='\[\e[0;32m\]\w\[\e[0m\] \[\e[0;35m\]$(__git_ps1)\[\e[0m\]'$'\n\[\e[0;36m\]$\[\e[0m\]  '
else
    export PS1="\[\e[0;32m\]\w\[\e[0m\]\n\[\e[0;36m\]$\[\e[0m\] "
fi
