# exports
export PATH="$HOME/bin:$HOME/lib:$PATH"
export PYTHONPATH="$HOME/lib:$PYTHONPATH"
export EDITOR=nvim

# history file settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000

# no beeps
unsetopt beep

# set vim keybindings
bindkey -v

# aliases
alias emacs="vim"
alias fetch="neofetch --colors 4 15 4 4 15 15 --ascii_colors 4 4 4 4 4 4"
alias mamba="micromamba"
alias weather="curl wttr.in"
alias vim="nvim"

# gruvbox colorscheme
if [ "$TERM" = "linux" ]; then
    #echo -n "\e]P0282828" # Black
    echo -n "\e]P0121212" # Black
    echo -n "\e]P1CC241D" # Red
    echo -n "\e]P298971A" # Green
    echo -n "\e]P3D79921" # Yellow
    echo -n "\e]P4458588" # Blue
    echo -n "\e]P5B16286" # Magenta
    echo -n "\e]P6689D6A" # Cyan
    echo -n "\e]P7A89984" # White
    echo -n "\e]P8928374" # Grey
    echo -n "\e]P9FB4934" # Bright Red
    echo -n "\e]PAB8BB26" # Bright Green
    echo -n "\e]PBFABD2F" # Bright Yellow
    echo -n "\e]PC83A598" # Bright Blue
    echo -n "\e]PDD3869B" # Bright Magenta
    echo -n "\e]PE8EC07C" # Bright Cyan
    echo -n "\e]PFEBDBB2" # Bright White
    clear
fi

# the following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
# end of lines added by compinstall

autoload -Uz compinit
compinit

# start zimfw config
ZIM_HOME=~/.zim

# download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

# initialize modules.
source ${ZIM_HOME}/init.zsh
# end zimfw config

# theme settings
MNML_USER_CHAR="⛬"

# history substring search key-bindings
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

# case sensitive
zstyle ":completion:*" matcher-list "m:{a-z}={a-z}"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="$HOME/bin/micromamba";
export MAMBA_ROOT_PREFIX="$HOME/.micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "$HOME/.micromamba/etc/profile.d/micromamba.sh" ]; then
        . "$HOME/.micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="$HOME/.micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

# start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# activate python environment
micromamba activate
