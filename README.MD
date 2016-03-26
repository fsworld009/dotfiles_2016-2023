
# ABOUT
Configuration files for my Macbook

# INSTALL
1. Go to home folder (~), create folder "dotfiles"
2. git clone this project under dotfiles folder
3. run install.sh script

# Why not just put everything under home folder and git the home folder?
In order to not including all other files and folders under home, I have to add * in .gitignore, then manually whitelist each config files. Then, when there is any other git repository under home folder, they will be affected by .gitignore file under home folder, because those repositories are considered as another git repo under a git repo (home folder).

One way to solve this issue is by using git submodules, but I don't want to configure submodules everytime I clone a git repo, so I decided to move all the files I need to git under home folder to dotfiles folder, and create symlinks under home folder.
