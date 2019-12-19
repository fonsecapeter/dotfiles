source ~/dotfiles/dot/zsh/regexp_syntax_highlighter.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main regexp)

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=green'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=white'
# ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[back-single-quoted-argument]='fg=red,bold'  # '\n'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=magenta'  # "\n"
ZSH_HIGHLIGHT_STYLES[redirection]='fg=white'  # "\n"

typeset -A ZSH_HIGHLIGHT_REGEXP
ZSH_HIGHLIGHT_REGEXP+=('[$][{]?[a-zA-Z0-9_-]*[}]? ' 'fg=yellow,bold')
ZSH_HIGHLIGHT_REGEXP+=(' [\]' 'fg=magenta')
ZSH_HIGHLIGHT_REGEXP+=('[\][nrt]' 'fg=magenta')
