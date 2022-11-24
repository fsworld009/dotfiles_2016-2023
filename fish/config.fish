if begin type -q pip; and test (pip list | grep virtualfish); end
  eval (python -m virtualfish compat_aliases)
end

# http://stackoverflow.com/questions/24581793/ps1-prompt-in-fish-friendly-interactive-shell-show-git-branch
function fish_prompt
    set -l git_branch (git branch | sed -n '/\* /s///p')
    set_color green 
    echo -n (prompt_pwd)
    set_color purple
    if [ "$git_branch" = "" ]
       echo -n ' '
    else
     echo -n ' ('"$git_branch"')'
    end
    echo -n \n

    if set -q VIRTUAL_ENV
        echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal)' '
    end

    echo (set_color cyan)'$ '(set_color normal)

end
