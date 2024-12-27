export ZSH=$HOME/.oh-my-zsh
export TERM=xterm-256color
export NO_BELL=true
export DISABLE_AUTO_UPDATE="true"
setopt NO_BEEP  


# Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-$ZSH/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{white}╭─%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{white}╰─  %f "
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

# Элементы левой и правой части 
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time)
POWERLEVEL9K_SHOW_CHANGESET=true

# Цветовые настройки 
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='white'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='235'
POWERLEVEL9K_NVM_BACKGROUND="235"
# POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="#83a598"  
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="#98971a"  
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="#BF616A"  
POWERLEVEL9K_TIME_BACKGROUND='235'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='235'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='white'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_DIR_BACKGROUND='235'
# POWERLEVEL9K_DIR_FOREGROUND="#83a598"  
POWERLEVEL9K_DIR_FOREGROUND="#98971a"  


# Плагины 
plugins=(zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh


# Подсветка синтаксиса
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES+=(
    [cursor]='bold'
    [alias]='fg=brightyellow,bold'
    [suffix-alias]='fg=brightyellow,bold'
    [builtin]='fg=brightyellow,bold'
    [function]='fg=brightyellow,bold'
    [command]='fg=brightyellow,bold'
    [precommand]='fg=brightyellow,bold'
    [hashed-command]='fg=brightyellow,bold'
)


#########################################
ranger-cd() {
    local tempfile=$(mktemp)
    ranger --choosedir="$tempfile" "${@:-$(pwd)}" < $TTY
    [ -f "$tempfile" ] && cd -- "$(cat "$tempfile")" && rm -f "$tempfile"
    VISUAL=true zle edit-command-line
}
zle -N ranger-cd
bindkey '^o' ranger-cd
##########################################


##########################################
compile_and_run_cpp() {
    local source_file="$1"
    local executable_file="${source_file%.cpp}"

    g++ -std=c++17 -o "$executable_file" "$source_file" && ./"$executable_file"
}
alias cpp='compile_and_run_cpp'
mkcpp() {
    if [[ $1 == *.cpp ]]; then
        echo -e "#include <iostream>\nusing namespace std;\n\nint main() {\n    // Your code here\n    return 0;\n}" > "$1" && nvim "$1"
    else
        echo "Error: The file must have a .cpp extension"
    fi
}
############################################


alias sshr='sudo systemctl restart ssh'
alias sshs='sudo systemctl stop ssh'
alias sshh='sudo systemctl status ssh'
alias wip="ip -4 addr show dev wlan0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'"
alias py='python3'
alias cdcpp='cd ~/all/cpp'
alias cdpy='cd ~/all/py'
alias cdbash='cd ~/all/bash'
alias nvim='~/apps/./nvim.appimage'


export PATH="$HOME/.cargo/bin:$PATH"

export PATH=$PATH:/home/user/.spicetify
