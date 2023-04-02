[ -n "$PS1" ] && source ~/.bash_profile;

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

complete -C /usr/local/bin/terraform terraform

source /Users/shane/.docker/init-bash.sh || true # Added by Docker Desktop
