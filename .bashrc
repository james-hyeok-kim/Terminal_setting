# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ============================================================
#  Shell Options
# ============================================================
shopt -s checkwinsize          # 명령 실행 후 터미널 사이즈 갱신
shopt -s histappend            # history 덮어쓰지 않고 누적
# shopt -s globstar            # ** 패턴 활성화 (필요시 주석 해제)

# ============================================================
#  History
# ============================================================
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups

# ============================================================
#  Prompt
# ============================================================
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# xterm 타이틀 설정
case "$TERM" in
xterm*|rxvt*|screen.xterm*|screen.rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
esac

# ============================================================
#  Colors
# ============================================================
if [ -x /usr/bin/dircolors ]; then
    test -r "$HOME/.dircolors" && eval "$(dircolors -b "$HOME/.dircolors")" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
fi

export LS_COLORS="di=00;94:fi=00;37"

# ============================================================
#  Aliases — Navigation
# ============================================================
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias p='cd ../'

# ============================================================
#  Aliases — Editor
# ============================================================
alias g='vim'
alias v='vim'
alias vi='vim'

# ============================================================
#  Aliases — Git
# ============================================================
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gpl='git pull'

# ============================================================
#  Aliases — Python venv
# ============================================================
alias venv='python3 -m venv .venv && source .venv/bin/activate'
alias act='source .venv/bin/activate'

# project-specific venvs
alias actdit='source "$HOME/.dit/bin/activate"'
alias actpi05='source "$HOME/.pi05/bin/activate"'
alias actlibero='source "$HOME/.libero/bin/activate"'

# ============================================================
#  Aliases — Misc
# ============================================================
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history 1|sed '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias lesspipe='[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"'

# ============================================================
#  Bash Completion
# ============================================================
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ============================================================
#  External Tools
# ============================================================

# nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Local bin
export PATH="$HOME/.local/bin:$PATH"

# ============================================================
#  Additional local config (gitignore this file)
# ============================================================
[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"
