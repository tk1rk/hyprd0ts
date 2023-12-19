XDG_DATA_DIRS=/usr/local/share:/usr/share
XDG_CONFIG_DIRS=/etc/xdg

case $(uname) in
Linux)
  XDG_CONFIG_HOME="$HOME/.config"
  XDG_CACHE_HOME="$HOME/.cache"
  XDG_DATA_HOME="$HOME/.local/share"
  XDG_STATE_HOME="$HOME/.local/state"
  XDG_RUNTIME_DIR="/run/user/$(id -u)"
  ;;
Darwin)
  XDG_CONFIG_DIRS="/Library/Application Support:$XDG_CONFIG_DIRS"
  XDG_DATA_DIRS="/Library:$XDG_DATA_DIRS"
  XDG_CACHE_HOME="$HOME/Library/Caches"
  XDG_CONFIG_HOME="$HOME/Library/Application Support"
  XDG_DATA_HOME="$HOME/Library/Application Support"
  XDG_RUNTIME_DIR="$HOME/Library/Caches/TemporaryItems"
  XDG_STATE_HOME="$HOME/Library/Application Support"
  ;;
esac

export XDG_CONFIG_DIRS XDG_DATA_DIRS XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_RUNTIME_DIR XDG_STATE_HOME
