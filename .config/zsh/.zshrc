# enable powerlevel10k instant prompt, keep at the top of the file
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# sources
[[ -r ${ZDOTDIR}/aliases.zsh ]] && source ${ZDOTDIR}/aliases.zsh
[[ -r ${ZDOTDIR}/autosuggestions.zsh ]] && source ${ZDOTDIR}/autosuggestions.zsh
[[ -r ${ZDOTDIR}/dracula.zsh ]] && source ${ZDOTDIR}/dracula.zsh
[[ -r ${ZDOTDIR}/functions.zsh ]] && source ${ZDOTDIR}/functions.zsh

# Make sure $ZSH_CACHE_DIR is +x, else use dir in $HOME
if [[ ! -w $ZSH_CACHE_DIR ]]; then
  ZSH_CACHE_DIR=${XDG_CACHE_HOME}/zsh
# Create cache & comp dirs & + to $fpath 
mkdir -p $ZSH_CACHE_DIR/completions
(( ${fpath[(Ie)$ZSH_CACHE_DIR/completions]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

#autoload -Uz compinit
#zstyle ':completion:*' menu select
#zmodload zsh/complist
#_comp_options+=(globdots)
#compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

export HISTSIZE=100000
export SAVEHIST=20000
export HISTFILE=$HOME/.cache/zsh/history
setopt hist_ignore_dups     # do not record an event that was just recorded again
setopt hist_ignore_all_dups # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_space    # do not record an event starting with a space
setopt hist_save_no_dups    # do not write a duplicate event to the history file
setopt inc_append_history   # write to the history file immediately, not when the shell exits
setopt share_history        # share history between terminals

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

setopt always_to_end
setopt complete_in_word
unsetopt list_beep

zmodload zsh/complist

autoload -U select-word-style
select-word-style bash

cd () {
	      builtin cd "$@" && command eza -lhA --no-time --group-directories-first --icons=always --color=always
}

autoload -U add-zsh-hook
function osc7-pwd() {
	emulate -L zsh
	setopt extendedglob
	local LC_ALL=C
	printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}
function chpwd-osc7-pwd() {
	(( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd

# fix vi plugin conflicting with fzf
export ZVM_INIT_MODE=sourcing

```zsh
# zsh plugin manager

# Configuration
ZPM_DIR="${ZPM_DIR:-$HOME/.zpm}"
ZPM_PLUGINS_DIR="${ZPM_PLUGINS_DIR:-$ZPM_DIR/plugins}"
ZPM_CACHE_FILE="${ZPM_CACHE_FILE:-$ZPM_DIR/cache.json}"

# Functions

# Install plugin
zpm_install() {
  local plugin="$1"
  local url="$2"
  local name
  name=$(basename "$url" .git)

  if [[ -d "$ZPM_PLUGINS_DIR/$name" ]]; then
    echo "Plugin '$name' already installed."
    return 1
  fi

  mkdir -p "$ZPM_PLUGINS_DIR/$name"
  git clone "$url" "$ZPM_PLUGINS_DIR/$name"

  # Cache plugin info (optional)
  # ...

  echo "Plugin '$name' installed."
  return 0
}

# Update plugin
zpm_update() {
  local plugin="$1"
  local path="$ZPM_PLUGINS_DIR/$plugin"

  if [[ ! -d "$path" ]]; then
    echo "Plugin '$plugin' not found."
    return 1
  fi

  git pull "$path"
  echo "Plugin '$plugin' updated."
  return 0
}

# List plugins
zpm_list() {
  ls "$ZPM_PLUGINS_DIR"
}

# Load plugins (in .zshrc)
zpm_load() {
  local plugin
  for plugin in "$@"; do
    if [[ -f "$ZPM_PLUGINS_DIR/$plugin/$plugin.zsh" ]]; then
      source "$ZPM_PLUGINS_DIR/$plugin/$plugin.zsh"
    elif [[ -f "$ZPM_PLUGINS_DIR/$plugin/init.sh" ]]; then
      source "$ZPM_PLUGINS_DIR/$plugin/init.sh"
    else
      echo "No loadable file found for plugin '$plugin'."
    fi
  done
}

# Example usage (in .zshrc):
# zpm_install oh-my-zsh/oh-my-zsh https://github.com/oh-my-zsh/oh-my-zsh.git
# zpm_load oh-my-zsh
zpm_install zsh-users/zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting.git
zpm_load zsh-syntax-highlighting
zpm_install zsh-users/zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions.git
zpm load zsh-users/zsh-autosuggestions 
zpm_install zsh-users/zsh-completions https://github.com/zsh-users/zsh-completions.git
zpm load zsh-users/zsh-completions
zpm_install zsh-users/zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search.git
zpm load zsh-users/zsh-hostiry-subtring-search
zpm_install hlissner/zsh-autopair https://github.com/hlissner/zsh-autopair.git
zpm load hlissner/zsh-autopair
zpm_install marlonrichert/zsh-autocomplete https://github.com/marlonrichert/zsh-autocomplete.git
zpm load marlonrichert/zsh-autocomplete
zpm_install z-shell/F-Sy-H https://github.com/z-shell/F-Sy-H.git
zpm load z-shell/F-Sy-H
zpm_install z-shell/zsh-fancy-completions https://github.com/z-shell/zsh-fanvy-completions.git
zpm load z-shell/zsh-fancy-completions

# Add functions to fpath
fpath=("$ZPM_DIR/functions" $fpath)
autoload -Uz zpm_install zpm_update zpm_list zpm_load

# Create functions directory
mkdir -p "$ZPM_DIR/functions"

# Example function (put in $ZPM_DIR/functions/zpm_help)
zpm_help() {
  echo "ZPM - Zsh Plugin Manager"
  echo "Usage: zpm_install <plugin> <url>"
  echo "       zpm_update <plugin>"
  echo "       zpm_list"
  echo "       zpm_load <plugin>..."
}
```

# fzf in terminal, fzf must be installed to use this
eval "$(fzf --zsh)"
# fzf dracula theme
export FZF_DEFAULT_OPTS=" \
--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 \
--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 \
--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 \
--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"


# to customize prompt, run `p10k configure`
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~//.config/zsh/.p10k.zsh
