

alias 'ls=ls -lrt --color=auto'
alias 'lsa=ls -lrta'
alias 'hom=cd /c/Users/chris.wood'
alias 'euler=cd /c/Users/chris.wood/Documents/useful_stuff/euler'
alias grep='grep --color=auto'
alias dfh='df -h'
alias df='df -kTh'
alias hom='cd /c/Users/chris.wood'
alias cmm='cd /c/Users/chris.wood/Desktop/code_new'
alias api='cd /c/Users/chris.wood/Desktop/code_new/cmm-api/'

export PATH="/c/Program Files (x86)/Python36-32":$PATH
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

function _exit() {
    echo -e "${BRed}smell you later${NC}" 
}


# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

alias killfirefox="for f in $(ps auxfwww | grep firefox | awk {'print$2'}); do kill -9 $f; done"

function taillog {
    cd /c/Users/chris.wood/projects/logs
    tail -f transfer.log
}

get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function md {
    cd "/c/Users/chris.wood/Desktop/code_new/$1"
}

function ss {
    # todo put this in a file
    declare -A servers
    servers[cmrt_qa]=34.223.217.185
    servers[cmm_qa]=52.42.41.226
    servers[cmm_prod]=35.161.223.212
    servers[profile_qa]=54.186.217.103
    servers[profile_prod]=34.223.228.252

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

#SSH_ENV=$HOME/.ssh/environment
#
## start the ssh-agent
#function start_agent {
#    echo "Initializing new SSH agent..."
#    # spawn ssh-agent
#    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#    echo "succeeded"
#    chmod 600 "${SSH_ENV}"
#    . "${SSH_ENV}" > /dev/null
#    /usr/bin/ssh-add
#}
#
#if [ -f "${SSH_ENV}" ]; then
#    . "${SSH_ENV}" > /dev/null
#    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#        start_agent;
#    }
#else
#    start_agent;
#fi

#PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(get_git_branch)\[\033[00m\] $(newline)"
echo "--------rc read"
