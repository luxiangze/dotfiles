# Never type cd ../../.. again
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# Browse 'up' and 'down'
alias u='clear; cd ../; pwd; ls -lhGgo'
alias d='clear; cd -; ls -lhGgo'

# My favorite ls aliases
alias ls="ls --color=auto"
alias lh="ls -lh"
alias la="ls -lhGgoA"
alias lt="ls -lhGgotr"
alias lS="ls -lhGgoSr"
alias l.="ls -lhGgod .*"
alias lhead="ls -lhGgo | head"
alias ltail="ls -lhGgo | tail"
alias lmore='ls -lhGgo | more'

# Use cut on space- or comma- delimited files
alias cuts="cut -d \" \""
alias cutc="cut -d \",\""

# use a generalized extract function
# as suggested by Mendel Cooper in "Advanced Bash Scripting Guide"
extract () {
   if [ -f $1 ] ; then
       case $1 in
        *.tar.bz2)      tar xvjf $1 ;;
        *.tar.gz)       tar xvzf $1 ;;
        *.tar.xz)       tar Jxvf $1 ;;
        *.bz2)          bunzip2 $1 ;;
        *.rar)          unrar x $1 ;;
        *.gz)           pigz -d $1 ;;
        *.tar)          tar xvf $1 ;;
        *.tbz2)         tar xvjf $1 ;;
        *.tgz)          tar xvzf $1 ;;
        *.zip)          unzip $1 ;;
        *.Z)            uncompress $1 ;;
        *.7z)           7z x $1 ;;
        *)              echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# Use mcd to create a directory and cd to it simultaneously
function mcd { mkdir -p "$1" && cd "$1";}

# Refresh your .bashrc
alias refresh="source ~/.bashrc"

# Edit your .bashrc
alias eb="vi ~/.bashrc"

# Show your $PATH in a prettier format
alias showpath='echo $PATH | tr ":" "\n" | nl'

# Use pandoc to convert a markdown file to PDF
# USAGE: mdpdf document.md document.md.pdf
alias mdpdf="pandoc -s -V geometry:margin=1in -V documentclass:article -V fontsize=12pt"

# ========== 代理配置 ==========
# 代理地址
PROXY_HTTP="http://100.81.85.27:7890"
PROXY_HTTPS="http://100.81.85.27:7890"
PROXY_SOCKS5="socks5://100.81.85.27:7891"

# 默认启用代理（注释掉可禁用）
ENABLE_PROXY=true

if [ "$ENABLE_PROXY" = true ]; then
    export HTTP_PROXY=$PROXY_HTTP
    export HTTPS_PROXY=$PROXY_HTTPS
    export http_proxy=$PROXY_HTTP
    export https_proxy=$PROXY_HTTPS
    export ALL_PROXY=$PROXY_SOCKS5
    export all_proxy=$PROXY_SOCKS5
    export NO_PROXY=localhost,127.0.0.1,*.local
    export no_proxy=localhost,127.0.0.1,*.local
fi

# 动态切换函数
toggle_proxy() {
    if [ -z "$HTTP_PROXY" ]; then
        export HTTP_PROXY=$PROXY_HTTP
        export HTTPS_PROXY=$PROXY_HTTPS
        export http_proxy=$PROXY_HTTP
        export https_proxy=$PROXY_HTTPS
        export ALL_PROXY=$PROXY_SOCKS5
        export all_proxy=$PROXY_SOCKS5
        echo "✓ 代理已启用"
    else
        unset HTTP_PROXY HTTPS_PROXY http_proxy https_proxy
        unset ALL_PROXY all_proxy
        echo "✗ 代理已禁用"
    fi
}

