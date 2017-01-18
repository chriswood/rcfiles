

alias 'ls=ls -lrt --color=auto'
alias 'lsa=ls -lrta'
alias 'hom=cd /c/Users/chris.wood'
alias grep='grep --color=auto'
alias dfh='df -h'
alias df='df -kTh'
alias hom='cd /c/Users/chris.wood'
alias cmm='cd /c/Users/chris.wood/Desktop/code_new'


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

echo "--------rc read"
