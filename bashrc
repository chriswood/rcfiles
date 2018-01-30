

alias 'ls=ls -lrt --color=auto'
alias 'lsa=ls -lrta'
alias 'hom=cd /c/Users/chris.wood'
alias 'euler=cd /c/Users/chris.wood/Documents/useful_stuff/euler'
alias grep='grep --color=auto'
alias dfh='df -h'
alias df='df -kTh'
alias gs='git status'
alias gd='git diff'

PS1="\[\033\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ "

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red


# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }


get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function md {
    cd "/mnt/d/code/$1"
}

function ss {
    # todo put this in a file
    declare -A servers
    servers[cmrt_qa]=34.223.217.185
    servers[cmm_qa]=52.42.41.226
    servers[cmm_prod]=35.161.223.212
    servers[profile_qa]=54.186.217.103
    servers[profile_prod]=34.223.228.252
    servers[ipc_qa]=54.202.230.42
    servers[cmm_qa_ui]=52.36.128.144
    servers[ip_qa_api]=54.202.43.180
    servers[haproxy]=35.161.17.204

    # if ip entry exists
    if [ -z ${servers[$1]+x} ]
    then 
        echo "No ip address for $1"
        echo "Available servers are..."
        for key in "${!servers[@]}"
        do
            echo "$key"
        done
        return 0;
    fi 
    # test for pem file
    if [ ! -f "tpp.pem" ]
    then
        echo "This scripts needs to be executed from the directory of your pem file"
        return 0;
    fi
    echo "connecting to $1..."
    ip=${servers[$1]}
    ssh -i tpp.pem ec2-user@$ip
}

LS_COLORS="ow=01;36;40" && export LS_COLORS

cd /mnt/d
echo "--------rc read"
