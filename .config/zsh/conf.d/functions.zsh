# auto-ls
function cd() {
         builtin cd "$@" && command eza -lhA --no-time --group-directories-first --icons=always --color=always
}