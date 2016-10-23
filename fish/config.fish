#http://stackoverflow.com/questions/24581793/ps1-prompt-in-fish-friendly-interactive-shell-show-git-branch
function fish_prompt
    set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
    set_color green 
    echo -n (prompt_pwd)
    set_color purple
    echo -n ' ('"$git_branch"')'
    set_color cyan
    echo -n \n'$ '
end