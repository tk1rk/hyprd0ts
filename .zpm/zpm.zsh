# File: ~/.zpm/zpm.zsh

#!/usr/bin/env zsh

# Initialize ZPM
ZPM_DIR="${HOME}/.zpm"
ZPM_CACHE="${ZPM_DIR}/cache"
ZPM_PLUGINS="${ZPM_DIR}/plugins"
ZPM_LOG="${ZPM_DIR}/log"
typeset -A ZPM_PLUGIN_SOURCES
typeset -A ZPM_PLUGIN_STATUS

# Create necessary directories
[[ ! -d "$ZPM_DIR" ]] && mkdir -p "$ZPM_DIR"
[[ ! -d "$ZPM_CACHE" ]] && mkdir -p "$ZPM_CACHE"
[[ ! -d "$ZPM_PLUGINS" ]] && mkdir -p "$ZPM_PLUGINS"
[[ ! -d "$ZPM_LOG" ]] && mkdir -p "$ZPM_LOG"

# Colors for output
autoload -U colors && colors

# Background notification function
zpm_notify() {
    local message=$1
    local status=$2
    {
        case $status in
            "success")
                print -P "%F{green}✓%f $message" >> "$ZPM_LOG/notifications.log"
                ;;
            "error")
                print -P "%F{red}✗%f $message" >> "$ZPM_LOG/notifications.log"
                ;;
            "info")
                print -P "%F{blue}ℹ%f $message" >> "$ZPM_LOG/notifications.log"
                ;;
        esac
    } &!
}

# Error handling wrapper
zpm_error_handler() {
    local err_code=$1
    local err_msg=$2
    local plugin=$3
    zpm_notify "Failed to process plugin ${plugin}: ${err_msg}" "error"
    ZPM_PLUGIN_STATUS[$plugin]="error"
    return $err_code
}

# Async plugin loader
zpm_load_async() {
    local plugin=$1
    local source=$2
    {
        if [[ -d "${ZPM_PLUGINS}/${plugin}" ]]; then
            # Source plugin files
            for file in "${ZPM_PLUGINS}/${plugin}"/*.{zsh,sh}(N); do
                source "$file" 2>/dev/null || zpm_error_handler 1 "Failed to source $file" "$plugin"
            done
            zpm_notify "Loaded plugin: ${plugin}" "success"
            ZPM_PLUGIN_STATUS[$plugin]="loaded"
        else
            zpm_notify "Plugin not found: ${plugin}" "error"
            ZPM_PLUGIN_STATUS[$plugin]="not_found"
        fi
    } &!
}

# Plugin installation
zpm_install() {
    local source=$1
    local plugin=$2
    local repo_url

    case $source in
        "github")
            repo_url="https://github.com/${plugin}.git"
            ;;
        "ohmyzsh")
            repo_url="https://github.com/ohmyzsh/ohmyzsh.git"
            plugin="plugins/${plugin}"
            ;;
        "prezto")
            repo_url="https://github.com/sorin-ionescu/prezto.git"
            plugin="modules/${plugin}"
            ;;
        *)
            zpm_error_handler 1 "Invalid source: ${source}" "$plugin"
            return 1
            ;;
    esac

    {
        # Clone or update plugin
        if [[ ! -d "${ZPM_PLUGINS}/${plugin}" ]]; then
            git clone --depth 1 "$repo_url" "${ZPM_PLUGINS}/${plugin}" 2>/dev/null || {
                zpm_error_handler 1 "Failed to clone ${plugin}" "$plugin"
                return 1
            }
            zpm_notify "Installed plugin: ${plugin}" "success"
        else
            pushd "${ZPM_PLUGINS}/${plugin}" >/dev/null
            git pull --quiet 2>/dev/null || {
                zpm_error_handler 1 "Failed to update ${plugin}" "$plugin"
                popd >/dev/null
                return 1
            }
            popd >/dev/null
            zpm_notify "Updated plugin: ${plugin}" "success"
        fi

        # Cache plugin source
        ZPM_PLUGIN_SOURCES[$plugin]=$source
        zpm_load_async "$plugin" "$source"
    } &!
}

# Plugin removal
zpm_remove() {
    local plugin=$1
    {
        if [[ -d "${ZPM_PLUGINS}/${plugin}" ]]; then
            rm -rf "${ZPM_PLUGINS}/${plugin}" 2>/dev/null || {
                zpm_error_handler 1 "Failed to remove ${plugin}" "$plugin"
                return 1
            }
            unset "ZPM_PLUGIN_SOURCES[$plugin]"
            unset "ZPM_PLUGIN_STATUS[$plugin]"
            zpm_notify "Removed plugin: ${plugin}" "success"
        else
            zpm_notify "Plugin not found: ${plugin}" "error"
        fi
    } &!
}

# List installed plugins
zpm_list() {
    {
        print -P "%F{blue}Installed Plugins:%f"
        for plugin in "${ZPM_PLUGINS}"/*(/N); do
            local plugin_name=${plugin:t}
            local status=${ZPM_PLUGIN_STATUS[$plugin_name]:-"not_loaded"}
            local source=${ZPM_PLUGIN_SOURCES[$plugin_name]:-"unknown"}
            print -P "  %F{cyan}${plugin_name}%f (Source: ${source}, Status: ${status})"
        done
    } &!
}

# Update all plugins
zpm_update() {
    {
        for plugin in "${ZPM_PLUGINS}"/*(/N); do
            local plugin_name=${plugin:t}
            local source=${ZPM_PLUGIN_SOURCES[$plugin_name]:-"github"}
            zpm_install "$source" "$plugin_name"
        done
        zpm_notify "Updated all plugins" "success"
    } &!
}

# Main plugin loading function
zpm() {
    local cmd=$1
    shift

    case $cmd in
        install)
            [[ $# -lt 2 ]] && {
                zpm_notify "Usage: zpm install <source> <plugin>" "error"
                return 1
            }
            zpm_install "$@"
            ;;
        remove)
            [[ $# -eq 0 ]] && {
                zpm_notify "Usage: zpm remove <plugin>" "error"
                return 1
            }
            zpm_remove "$@"
            ;;
        list)
            zpm_list
            ;;
        update)
            zpm_update
            ;;
        *)
            zpm_notify "Unknown command: ${cmd}" "error"
            return 1
            ;;
    esac
}

# Autocompletion
_zpm_completion() {
    local -a commands
    commands=(
        'install:Install a plugin'
        'remove:Remove a plugin'
        'list:List installed plugins'
        'update:Update all plugins'
    )
    _describe 'command' commands
}
compdef _zpm_completion zpm

# Initialize plugin status check
zpm_init() {
    {
        for plugin in "${ZPM_PLUGINS}"/*(/N); do
            local plugin_name=${plugin:t}
            [[ -n "${ZPM_PLUGIN_SOURCES[$plugin_name]}" ]] && zpm_load_async "$plugin_name" "${ZPM_PLUGIN_SOURCES[$plugin_name]}"
        done
    } &!
}

# Run initialization
zpm_init
