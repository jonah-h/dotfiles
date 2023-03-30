# Evironment variables

# Path
export PATH=/home/jonah/.mambaforge/bin:$PATH

export ZSH=/home/jonah/.oh-my-zsh

export EDITOR=vim

## Fix terminal colors
#export TERM=xterm-256color

# ZSH config

ZSH_THEME="fishy"

CASE_SENSITIVE="true"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='ls -al'
alias ipython='ipython --TerminalInteractiveShell.editing_mode=vi'
alias emacs='vim'
alias weather='curl wttr.in'
alias battery='acpi'
alias cpu-info='i7z'

# Gruvbox colorscheme
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
