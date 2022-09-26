# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ..='cd ..'
alias duh='du -d 1 -h'
alias myip='curl http://ifconfig.me/ip'
alias bc='bc -l'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
alias wget='wget -c'  # Resume wget by default
alias mkdir="mkdir -pv"  # make parent dirs verbosely

# git status alias
alias g='git status'
# quick cd command
alias c='cd "$(find . -maxdepth 1 -type d | fzf)"'
alias C='cd "$(find . -type d | fzf)"'
# quick project navigation command
alias p='cd "$(find ~/Workspace/repos ~/Workspace/scratch/ -mindepth 1 -maxdepth 2 -type d -or -type l | fzf)"'
# quick settings navigation command
alias s='cd "$(find ~/.config -mindepth 1 -maxdepth 1 -type d -or -type l | fzf)"'
# quick correct last failed command command
alias f='fuck'
# muscle memory
alias :q="exit"
alias :Q="exit"

# More aliases
alias aptup="sudo apt update && sudo apt upgrade -y"
alias matlabcli="matlab -nodisplay"
alias bat="batcat"
alias icat="kitty +kitten icat"
alias upgit="git add . && git commit -m 'sync' && git push"
alias less="less -R"
alias nv="nvim"
alias python="python3"
alias ipython="ipython3"

# Simple custom functions
function mann() {
    curl --silent "https://cheat.sh/$1" | less -R
}

function mcd() {
    if [[ $# -eq 0 ]] ; then
        echo 'Alias for mkdir and cd'
        echo '  Usage: user@pc~/path/:$ mcd [dirname]'
    else
        mkdir -p "$1" && cd "$1"
    fi
}

function wat() {
    if [[ $# -eq 0 ]] ; then
        echo 'Search online using `wat`'
        echo '  Usage: user@pc~/path/:$ wat [search query]'
    else
        search_term="${*}"
        search_term="${search_term// /+}"
        firefox https://www.ecosia.org/search?q=${search_term} &
    fi
}

function watt() {
    if [[ $# -eq 0 ]] ; then
        echo 'Google things using `watt`'
        echo '  Usage: user@pc~/path/:$ watt [search query]'
    else
        search_term="${*}"
        search_term="${search_term// /+}"
        firefox https://www.google.com.au/search?q=${search_term} &
    fi
}

function clonetree() {
    if [[ $# -eq 0 ]] ; then
        echo 'Clone git worktrees and configure git fetch'
        echo '  Usage: user@pc~/path/:$ clonetree [repo url] [dir name (optional)]'
    else
        url=$1
        basename=${url##*/}
        name=${2:-${basename%.*}}

        mkdir $name
        cd "$name"

        # Moves all the administrative git files (a.k.a $GIT_DIR) under .bare directory.
        #
        # Plan is to create worktrees as siblings of this directory.
        # Example targeted structure:
        # .bare
        # main
        # new-awesome-feature
        # hotfix-bug-12
        # ...
        git clone --bare "$url" .git
        echo "gitdir: ./.git" > .git

        # Explicitly sets the remote origin fetch so we can fetch remote branches
        git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

        # Gets all branches from origin
        git fetch origin

        cd ..
    fi
}