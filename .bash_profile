# Homebrew Path
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

function dotfiles {
   /usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}

# iTerm integrations
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# pyenv set up
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands

if type brew &>/dev/null; then
  for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
  do
    [[ -f $COMPLETION ]] && source "$COMPLETION"
  done
  if [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]];
  then
    source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
  fi
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

#[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Enable tab completion for `g` by marking it as an alias for `git`
# if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
# 	complete -o default -o nospace -F _git g;
# fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shane/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/shane/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shane/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/shane/Downloads/google-cloud-sdk/completion.bash.inc'; fi

complete -C /usr/local/bin/terraform terraform

source /Users/shane/.docker/init-bash.sh || true # Added by Docker Desktop
