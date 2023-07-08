# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

shopt -s autocd
shopt -s cdable_vars
if [ -f ~.bash_exports ]; then
	. ~/.bash_exports
fi

export LOCALBIN='/usr/local/bin'

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
PURPLE='\[\e[1;35m\]'
purple='\[\e[0;35m\]'
nc='\[\e[0m\]'

if [ "$UID" = 0 ]; then
    PS1="$red\u$nc@$red\H$nc:$CYAN\w$nc\\n$red#$nc "
else
    PS1="$PURPLE\u$nc@$CYAN\H$nc:$GREEN\w$nc\\n$GREEN\$$nc "
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# -R: show ANSI colors correctly; -i: case insensitive search
LESS="-R -i"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Add sbin directories to PATH.  This is useful on systems that have sudo
echo $PATH | grep -Eq "(^|:)/sbin(:|)"     || PATH=$PATH:/sbin
echo $PATH | grep -Eq "(^|:)/usr/sbin(:|)" || PATH=$PATH:/usr/sbin
echo $PATH | grep -Eq "(^|:)/usr/local/sbin(:|)" || PATH=$PATH:/usr/local/sbin

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_funktionen ]; then
	. ~/.bash_funktionen
fi
if [ -d ~/bin ]; then
    PATH="~/bin:$PATH"
fi
