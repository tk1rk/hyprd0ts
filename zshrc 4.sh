# completions
autoload -Uz compinit
zstyle ':completion:*' menu yes select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zmodload -i zsh/complist
_comp_options+=(globdots)		# Include hidden files.
zle_highlight=('paste:none')
for dump in "$HOME/.cache/zsh/.zcompdump"(N.mh+24); do
  compinit
done
compinit -

# Automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# Colors
autoload -Uz colors && colors

# Make sure the completion system is initialised
(( ${+_comps} )) || return 1

# Enable cache - Some funcs (_apt and _dpkg)are slow.
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' file-sort name

# How many completions switch on menu selection
zstyle ':completion:*' menu select=long

# If there are more than 5 options, allow selecting from a menu with arrows (case insensitive completion!).
zstyle ':completion:*-case' menu select=5

# Enable rehash on completion so new installed program are found automatically:
zstyle ':completion:*' rehash true
#zstyle ':completion:::::' completer _complete _approximate
#autoload -Uz _force_rehash
#zstyle ':completion:::::'	completer _force_rehash _complete _approximate

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}»» %d (errors: %e) ««%f'
zstyle ':completion:*:descriptions' format ' %F{cyan}»» %d ««%f'
zstyle ':completion:*:messages' format ' %F{purple} »» %d ««%f'
zstyle ':completion:*:warnings' format ' %F{red}»» no matches found ««%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}»» %d ««%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Enable history menu selection
zstyle ':completion:*:history-words'	menu yes

# Enable expand completer for all expansions
zstyle ':completion:*:expand:*'		tag-order all-expansions
zstyle ':completion:*:history-words'	list false

# Enable offering indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*'	tag-order indexes parameters

# Enable matches to separate into groups
zstyle ':completion:*:matches'		group 'yes'

# Enable processes completion for all user processes
zstyle ':completion:*:processes'	command 'ps -au$USER'

# Adjust color-completion style
zstyle ':completion:*:default'  list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*'  list-colors  'reply=( "=(#b)(*$PREFIX)(?)*=00=$color[green]=$color[bg-green]" )'

# Adjust case-insensitive completions for: (all),partial-word and then substring matches
zstyle ':completion:*' 	matcher-list 'm:ss=ß m:ue=ü m:ue=Ü m:oe=ö m:oe=Ö m:ae=ä m:ae=Ä m:{a-zA-Zöäüa-zÖÄÜ}={A-Za-zÖÄÜA-Zöäü}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Adjust mismatch handling - allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:*'    max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'

# Adjust match count style
zstyle ':completion:*:default'		list-prompt '%S%M matches%s'

# Adjust selection prompt style
zstyle ':completion:*'  select-prompt %SScrolling active: current selection at %P Lines: %m

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word.
# Ensure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Adjust completion to offer fish-style highlighting for extra-verbose command completion:
zstyle -e ':completion:*:-command-:*:commands'	list-colors 'reply=( '\''=(#b)('\''$words[CURRENT]'\''|)*-- #(*)=0=38;5;45=38;5;136'\'' '\''=(#b)('\''$words[CURRENT]'\''|)*=0=38;5;45'\'' )'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
# Enable completion of 'cd -<tab>' and 'cd -<ctrl-d>' with menu
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# Complete . and .. special directories
zstyle ':completion:*' special-dirs true

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:(killall|pkill|kill):*' menu yes select
zstyle ':completion:*:*:(killall|pkill|kill):*' force-list always
zstyle ':completion:*:*:(killall|pkill|kill):*' insert-ids single

# Complete manual by their section
zstyle ':completion:*:manuals'  separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'  menu yes select

# Media Players
zstyle ':completion:*:*:mpg123:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:mpg321:*' file-patterns '*.(mp3|MP3):mp3\ files *(-/):directories'
zstyle ':completion:*:*:ogg123:*' file-patterns '*.(ogg|OGG|flac):ogg\ files *(-/):directories'
zstyle ':completion:*:*:mocp:*' file-patterns '*.(wav|WAV|mp3|MP3|ogg|OGG|flac):ogg\ files *(-/):directories'

# Mutt
if [[ -s "$HOME/.mutt/aliases" ]]; then
  zstyle ':completion:*:*:mutt:*' menu yes select
  zstyle ':completion:*:mutt:*' users ${${${(f)"$(<"$HOME/.mutt/aliases")"}#alias[[:space:]]}%%[[:space:]]*}
fi

# SSH/SCP/RSYNC
zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# ‑‑‑‑‑‑‑‑‑ ⸨ DISABLE / IGNORE ⸩ ‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑‑

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# Don't complete not-required/available users/commands
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|TRAP*)'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus  mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'
zstyle '*' single-ignored show

# Ignore multiple entries.
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Prevent CVS files/directories from being completed
zstyle ':completion:*:(all-|)files'	ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*'		ignored-patterns '(*/)#CVS'

# Prevent commands like `rm'
zstyle ':completion:*:rm:*'		ignore-line yes

# Prevent menu completion for ambiguous initial strings
zstyle ':completion:*'			insert-unambiguous true
zstyle ':completion:*:corrections'	format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'	original true

# Prevent men completion for duplicate entries
zstyle ':completion:*:history-words'	remove-all-dups yes
zstyle ':completion:*:history-words'	stop yes

# Prevent completion of functions for commands you don't have
zstyle ':completion:*:functions'	ignored-patterns '(_*|pre(cmd|exec))'

# Prevent files to be ignored from zcompile
zstyle ':completion:*:*:zcompile:*'	ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'		prompt 'correct to: %e'

#Prevent comp to glob the first part of the path to avoid partial globs. (Performance)
zstyle ':completion:*' accept-exact '*(N)'

# Prevent trailing slash if argument is a directory
zstyle ':completion:*'			squeeze-slashes true
zstyle ':completion::complete:*' '\\'

# Prevent completion of backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '*\~'

# Prevent these filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns  '*?.(o|c~|old|pro|zwc)' '*~'

# Prevent rm completion
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# opts
unsetopt BEEP
setopt AUTO_CD
setopt GLOB_DOTS
setopt NOMATCH
setopt MENU_COMPLETE
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY

HISTFILE="${ZDOTDIR:-$HOME}/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
# setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# exports
export PATH="$HOME/.local/bin:$PATH"

# bindings
bindkey -s '^x' '^usource $ZSHRC\n'
bindkey -M menuselect '?' history-incremental-search-forward
bindkey -M menuselect '/' history-incremental-search-backward
bindkey '^H' backward-kill-word # Ctrl + Backspace to delete a whole word.
