#-------------------------------------------------------
# Adge's ZSH (Z-Shell) Profile
# -------------------------------------------------------
#             _            _                 
#   __ _   __| | ___ _ __ | | _____ _ __ ___ 
#  / _` | / _` |/ _ \ '_ \| |/ / _ \ '__/ __|
# | (_| || (_| |  __/ | | |   <  __/ |  \__ \
#  \__,_(_)__,_|\___|_| |_|_|\_\___|_|  |___/
# adge.denkers@gmail.com | https://github.com/adgedenkers
# -------------------------------------------------------
# file name: .zshrc
# location: ~/
# date: 2019-11-27
# update: 2023-03-18
# -------------------------------------------------------

# #############################################################################

# #############################################################################

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/adge/.oh-my-zsh"

alias python=/usr/local/bin/python3.11
alias py=/usr/local/bin/python3.11
alias pip=/usr/local/bin/pip3

export LS_COLORS="di=34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;33;40:cd=1;33;40:su=0;41:sg=0;43:tw=0;42:ow=34;40:"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$ZSH/.oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='code'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add Custom Alias File
# -------------------------------------
#source $ZSH/custom/alias.zsh

# ~ blank aliases
typeset -a baliases
baliases=()

balias() {
  alias $@
  args="$@"
  args=${args%%\=*}
  baliases+=(${args##* })
}

# ~ ignored aliases
typeset -a ialiases
ialiases=()

ialias() {
  alias $@
  args="$@"
  args=${args%%\=*}
  ialiases+=(${args##* })
}

# ~ functionality
expand-alias-space() {
  [[ $LBUFFER =~ "\<(${(j:|:)baliases})\$" ]]; insertBlank=$?
  if [[ ! $LBUFFER =~ "\<(${(j:|:)ialiases})\$" ]]; then
    zle _expand_alias
  fi
  zle self-insert
  if [[ "$insertBlank" = "0" ]]; then
    zle backward-delete-char
  fi
}



# #############################################################################
#                   /$$                    
#                  | $$                    
#    /$$$$$$   /$$$$$$$  /$$$$$$   /$$$$$$ 
#   |____  $$ /$$__  $$ /$$__  $$ /$$__  $$
#    /$$$$$$$| $$  | $$| $$  \ $$| $$$$$$$$
#   /$$__  $$| $$  | $$| $$  | $$| $$_____/
#  |  $$$$$$$|  $$$$$$$|  $$$$$$$|  $$$$$$$
#   \_______/ \_______/ \____  $$ \_______/
#                       /$$  \ $$          
#                      |  $$$$$$/          
#                       \______/           
# #############################################################################

# my salt recipe
salt='347a90c99558aa4e23cfaa52c410d11e01d846dbbc69b1ef5d72c746c5a89b54'
export SALT=$salt


# health commands

# log a bathroom visit to pee
alias :pee="sqlite3 bathroom.db \"INSERT INTO bathroom_visits (dt, type) VALUES (datetime('now'), '1')\""


#               _            
#   _ __   ___ | |_ ___  ___ 
#  | '_ \ / _ \| __/ _ \/ __|
#  | | | | (_) | ||  __/\__ \
#  |_| |_|\___/ \__\___||___/
#                            
# *****************************************************************************

# *** Note ***
# My commands and aliases use a colon (:) in front of
# their name, like the below
#     $ :pe
#
# *** Note ***
# In all example code, the dollar sign ($) is used to indicate
# the command prompt

# *** Note ***

# Other available characters that work for
# custom functions or commands are:
#     @
#     %

#               _   _                  
#    __ _ _ __ (_) | | _____ _   _ ___ 
#   / _` | '_ \| | | |/ / _ \ | | / __|
#  | (_| | |_) | | |   <  __/ |_| \__ \
#   \__,_| .__/|_| |_|\_\___|\__, |___/
#        |_|                 |___/     
# *****************************************************************************

# Jeff - OpenAI API Key
# user: quetzalcoatl.fz
quetzalcoatl_key='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'
export OPENAI_API_KEY=$quetzalcoatl_key

quetzalcoatl_organization='org-1oXUEO5LHmZPTqigY60xbYIs'
export OPENAI_API_Organization=$quetzalcoatl_organization

alias :aikey='echo $AI_KEY'


# Git Hub User
export GITHUBUSER='adgedenkers'
export GITHUBTOKEN='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'



#                                 /$$          
#                                | $$          
#    /$$$$$$$ /$$$$$$/$$$$   /$$$$$$$  /$$$$$$$
#   /$$_____/| $$_  $$_  $$ /$$__  $$ /$$_____/
#  | $$      | $$ \ $$ \ $$| $$  | $$|  $$$$$$ 
#  | $$      | $$ | $$ | $$| $$  | $$ \____  $$
#  |  $$$$$$$| $$ | $$ | $$|  $$$$$$$ /$$$$$$$/
#   \_______/|__/ |__/ |__/ \_______/|_______/ 
#                                              
#                                              
#                                              
# *****************************************************************************
# profile edit
#     :pe
alias :pe='code ~/.zshrc'

# profile reload
#     :pr
alias :pr='source ~/.zshrc'

# edit separate alias file (this file)
#     :edit-alias
alias :edit-alias='code ~/.oh-my-zsh/custom/alias.zsh'
#
## known_hosts for ssh
#     :edit_known_hosts
alias :edit_known_hosts="code /users/adge/.ssh/known_hosts"

# create a gist from the clipboard contents
alias :ngist="python /Users/adge/src/python/create_gist_from_clipboard.py"

# #############################################################################
#                                                              
#                                                              
#    /$$$$$$$  /$$$$$$   /$$$$$$  /$$    /$$ /$$$$$$   /$$$$$$ 
#   /$$_____/ /$$__  $$ /$$__  $$|  $$  /$$//$$__  $$ /$$__  $$
#  |  $$$$$$ | $$$$$$$$| $$  \__/ \  $$/$$/| $$$$$$$$| $$  \__/
#   \____  $$| $$_____/| $$        \  $$$/ | $$_____/| $$      
#   /$$$$$$$/|  $$$$$$$| $$         \  $/  |  $$$$$$$| $$      
#  |_______/  \_______/|__/          \_/    \_______/|__/      
#                                                              
#                                                              
#                                                              
#                                                              
#                                                              
#    /$$$$$$$  /$$$$$$  /$$$$$$$  /$$$$$$$  /$$   /$$          
#   /$$_____/ /$$__  $$| $$__  $$| $$__  $$|  $$ /$$/          
#  | $$      | $$  \ $$| $$  \ $$| $$  \ $$ \  $$$$/           
#  | $$      | $$  | $$| $$  | $$| $$  | $$  >$$  $$           
#  |  $$$$$$$|  $$$$$$/| $$  | $$| $$  | $$ /$$/\  $$          
#   \_______/ \______/ |__/  |__/|__/  |__/|__/  \__/          
#                                                              
#                                                              
#                                                              
# #############################################################################

#   _                          
#  | |__   ___  _ __ ___   ___ 
#  | '_ \ / _ \| '_ ` _ \ / _ \
#  | | | | (_) | | | | | |  __/
#  |_| |_|\___/|_| |_| |_|\___|
#                              
# *****************************************************************************

# ~ jupiter.denkers.co         10.4.1.5
# @@ ubuntu server, web server
#     :jupiter
alias :jupiter="ssh -i $HOME/.ssh/adge adge@jupiter.denkers.co"

# ~ saturn.denkers.co         10.4.1.50     
# @@ my primary laptop (macbook pro)
#     :saturn
alias :saturn="ssh -i $HOME/.ssh/adge adge@saturn.denkers.co"

# ~ venus.denkers.co          10.4.1.78
# @@ becky's windows laptop
#     :venus
alias :venus="ssh adgedenkers@venus.denkers.co"

#                                                         
#    __ ___      _____   ___  ___ _ ____   _____ _ __ ___ 
#   / _` \ \ /\ / / __| / __|/ _ \ '__\ \ / / _ \ '__/ __|
#  | (_| |\ V  V /\__ \ \__ \  __/ |   \ V /  __/ |  \__ \
#   \__,_| \_/\_/ |___/ |___/\___|_|    \_/ \___|_|  |___/
#                                                         
# *****************************************************************************



alias :cwd=current_directory

# *****************************************************************************


#        _ _                      _     
#    ___| (_)   ___ _ __ ___   __| |___ 
#   / __| | |  / __| '_ ` _ \ / _` / __|
#  | (__| | | | (__| | | | | | (_| \__ \
#   \___|_|_|  \___|_| |_| |_|\__,_|___/
#                                       
# *****************************************************************************

# loading function below
autoload -Uz ~/.zfunc/push2web
autoload -Uz ~/.zfunc/push2craft

fpath=( ~/.zfunc "${fpath[@]}" )

alias :functions="cd ~/.zfunc/ && ls"

# Functions to Print in Colors
# -------------------------------------
print-y() {
  printf "\e[33;1m%s\n" "$1"
}
print-g() {
  printf "\e[32m$1\e[m\n"
}
print-r() {
  echo -e "\033[1;31m$1\033[0m"
}


# *****************************************************************************
#              _                      _     
#   _ __   ___| |___      _____  _ __| | __ 
#  | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / 
#  | | | |  __/ |_ \ V  V / (_) | |  |   <  
#  |_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_\ 
#                                           
#                             _             
#   ___  ___ __ _ _ __  _ __ (_)_ __   __ _ 
#  / __|/ __/ _` | '_ \| '_ \| | '_ \ / _` |
#  \__ \ (_| (_| | | | | | | | | | | | (_| |
#  |___/\___\__,_|_| |_|_| |_|_|_| |_|\__, |
#                                     |___/ 
# *****************************************************************************


# ~~~ Scan local network
alias :scannetwork='nmap -v 10.4.1.0/24'
# ~ Scan local network for devices with open port 22 (for ssh)
alias :scan4ssh='nmap -v 10.4.1.0/24 | grep "22/tcp"'
# ~ Scan local network for devices with open ports 80 and 443 (for web)
alias :scan4web='nmap -v 10.4.1.0/24 | grep "80/tcp" && nmap -v 10.4.1.0/24 | grep "443/tcp"'

# *****************************************************************************
#             _          
#   _   _ ___| |__       
#  | | | / __| '_ \      
#  | |_| \__ \ |_) |     
#   \__,_|___/_.__/      
#                        
#   _              _     
#  | |_ ___   ___ | |___ 
#  | __/ _ \ / _ \| / __|
#  | || (_) | (_) | \__ \
#   \__\___/ \___/|_|___/
#                        
# *****************************************************************************


alias :listallusb="ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'"
alias :list-all-usb="ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'"
alias :usb="ioreg -p IOUSB -w0 | sed 's/[^o]*o //; s/@.*$//' | grep -v '^Root.*'"

# ~~~ Display Minecraft Chat and System Log
alias :tailmclog='tail -f "/Users/adge/Library/Application Support/minecraft/logs/latest.log"'

# ~~~ Directory Functions
current_directory() {
    echo ${PWD##*/}
}

currdir() {
    echo ${PWD##*/}
}

# *****************************************************************************
#               _   _                 
#   _ __  _   _| |_| |__   ___  _ __  
#  | '_ \| | | | __| '_ \ / _ \| '_ \ 
#  | |_) | |_| | |_| | | | (_) | | | |
#  | .__/ \__, |\__|_| |_|\___/|_| |_|
#  |_|    |___/                       
#                      _              
#    ___ _ __ ___   __| |___          
#   / __| '_ ` _ \ / _` / __|         
#  | (__| | | | | | (_| \__ \         
#   \___|_| |_| |_|\__,_|___/         
#                                     
# *****************************************************************************

pyvenv() {
# source "venv/bin/activate"  # commented out by conda initialize
}

venv-start() {
#  pyvenv $(current_directory)
}

alias :venv-start="pyvenv $(current_directory)"
alias :venv-stop="deactivate"

venv-stop(){
  deactivate
}



new-py-project() {
  cd ~/src/
  mkdir $1
  cd $1
  python3 -m venv "venv"
}

alias :pstart-server="pyvenv $(current_directory) && py server.py"

# ~~~ Update the PIP tool
alias :update-pip='pip install --upgrade pip'
alias :upgrade-pip='pip install --upgrade pip' # in case I can't remember which word I used in the alias (update or upgrade)
alias :pip-update='pip install --upgrade pip'
alias :pip-upgrade='pip install --upgrade pip'
alias :pipupdate='pip install --upgrade pip'


# ~~~ Common PIP Commands
alias :pip-freeze='pip freeze > requirements.txt'
alias :pip-install-requrements='pip install -r requirements.txt'
alias :freeze='pip freeze > requirements.txt'

# ~~~ Create Python Virtual Environment

alias :py-new-venv="py -m venv $1"
# Activate a Virtual Environemnt called `.<stub>-env` (my default for python virtual environments)
# :py-act
# executes source .env/bin/activate
alias :py-act="source $1/bin/activate"

# Manage the Python Virtual Environment
alias :venv-start="source venv/bin/activate"
alias :vst="source venv/bin/activate"


# Deactivate the Python Virtual Environment
alias :deact="deactivate"
alias :vq="deactivate"

# *****************************************************************************
#        _  _                                              _     
#     __| |(_) __ _ _ __   __ _  ___     ___ _ __ ___   __| |___ 
#    / _` || |/ _` | '_ \ / _` |/ _ \   / __| '_ ` _ \ / _` / __|
#   | (_| || | (_| | | | | (_| | (_) | | (__| | | | | | (_| \__ \
#    \__,_|/ |\__,_|_| |_|\__, |\___/   \___|_| |_| |_|\__,_|___/
#        |__/             |___/                                  
# *****************************************************************************

# run the django development server
alias :djrun="venv/bin/python manage.py runserver"

# run django migrations
alias :djmm="venv/bin/python manage.py makemigrations && venv/bin/python manage.py migrate"

# run the django shell
alias :djsh="venv/bin/python manage.py shell"

# run the django shell_plus
alias :djshp="venv/bin/python manage.py shell_plus"







alias :h='python ~/src/log_mhi.py'
alias :howlong="python ~/src/how_long_mhi.py"
alias :last_h='python ~/src/last_mhi.py'


# Copy to Clipboard
alias :c='fc -e -|pbcopy'
# Paste from Clipboard
alias :p='pbpaste'

# Set my github token
export gh_cli_token="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"


# Add the following code to the end of any command, to copy the output to the clipboard automatically
###     code:  "&& fc -e -| pbcopy"
### Example:
### alias :ip="ifconfig en0"
### add the copy output command
### alias :ip="ifconfig en0 && fc -e -| pbcopy"

alias :serial-ports='ls /dev | grep tty'

# ~~~ Manage VA_Log in Obsidian
###   Add New Files
###   Commit Changes
###   Push to Git
###   Pull from Git

function valog_push() {
  NOW=$(date +"%m-%d-%YT%T")
  cd /Users/adge/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/VA_Log
  git add .
  git commit -m "commit from saturn @ $NOW"
  git push
}

function valog_pull() {
  NOW=$(date +"%m-%d-%YT%T")
  cd /Users/adge/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/VA_Log
  git pull
}

# ~~~ Quick Look a file from the cli in Quick Look
#       ~ usage= $ :ql file.txt
alias :ql="sudo qlmanage -p $1"

# ~~~ Get the OS and Version Number
#alias :os="cat /etc/*-release"
# *** not working as of 2020-12-14

# ~~~ Delete a Non-Empty Folder
#       ~ usage= $ :rm ~/Neptune    OR
#       ~ usage= $ :rmdir ~/Neptune
alias :rm="rm -Rf $1"
alias :rmdir="rm -r $1"

# ~~~ Find a Running Process by Name
#       ~ usage= $ :ps Safari
alias :ps="ps aux | grep $1"

# ~~~ Print Local IP Address
alias :ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 | pbcopy && pbpaste'

# ~~~ Print IP Address and Information
alias :ip-info="ifconfig en0 | pbcopy && pbpaste"

# ~~~ Print WAN IP Address
alias :wanip="dig +short myip.opendns.com @resolver1.opendns.com | pbcopy && pbpaste"

# ~~~ Work over Serial/FTDI Cable
alias :ftdi="/dev/cu.usbserial-AM01R0IY"

# ~~~ 
alias :pull="echo \""

# ~~~ Edit the Known_Hosts Files
alias :known_hosts="code /Users/adge/.ssh/known_hosts"

function new_git_repo() {
  mkdir $1
  cd $1
  echo "# $1" >>README.md
  git init
  git add README.md
  git commit -m "repository automated setup"
  git branch -M main
  git remote add origin "https://github.com/adgedenkers/$1.git"
  git push -u origin main
  echo "repository '$1' has been created"
}

function new_repo_from_folder() {
  d = ${PWD##*/}
  echo "Creating Repository: $d"
  echo "# $d" >>README.md
  git init
  git add README.md
  git commit -m "repository automated setup"
  git branch -M main
  git remote add origin "https://github.com/adgedenkers/$d.git"
  git push -u origin main
  echo "repository '$d' has been created"
}

alias :new_repo="
  d = ${PWD##*/} &&
  echo \"Creating Repository: $d\" &&
  echo \"# $d\" >>README.md &&
  git init &&
  git add README.md &&
  git commit -m \"repository automated setup\" &&
  git branch -M main &&
  git remote add origin git@github.com:alexpchin/$d.git &&
  git push -u origin main &&
  echo \"repository '$d' has been created\"
"

alias :update_git="git add . && git commit -m \"update\" && git push"


alias :shortcuts='cd /Users/adge/Library/Mobile\ Documents/iCloud~is~workflow~my~workflows/Documents/'

alias :dictations='cd /Users/adge/Library/Mobile\ Documents/iCloud~is~workflow~my~workflows/Documents/dictations/'

# -------------------------------------
# Section 3 - Raspberry Pi Devices
# -------------------------------------
# ~ rhubarb.denkers.co
# @@ main controller, speed-testing device, print-server
alias :rhubarb='ssh -i $HOME/.ssh/adge adge@192.168.4.150'

# huckleberry.denkers.co
alias :huckleberry='ssh -i $HOME/.ssh/adge adge@192.168.4.151'


# -------------------------------------
# Section 4 - AWS - Config/Creds
# -------------------------------------
#source '$HOME/.aws/config'
#source '$HOME/.aws/credentials'


# -------------------------------------
# Section 4-A - AWS Comprehend Medical
# -------------------------------------
aws_compmed_region='us-east-1'
aws_compmed_endpoint='comprehendmedical.us-east-1.amazonaws.com'

alias :compmed='aws comprehendmedical detect-entities --endpoint $aws_compmed_endpoint --region $aws_compmed_region --text \"$1\"'

alias :cmtests='aws comprehendmedical detect-entities --endpoint $aws_compmed_endpoint --region $aws_compmed_region --cli-input-json $1'

alias :cmtests='aws comprehendmedical detect-entities --endpoint $aws_compmed_endpoint --region $aws_compmed_region --cli-input-json patient_01_cmp.json'

# -------------------------------------
# Section 4-B - AWS Servers Config/Connect
# -------------------------------------

aws_key="$HOME/.ssh/AHD01.pem"
denkers_craft_key="$HOME/.ssh/denkers-craft.pem"
lightsailkey="$HOME/.ssh/AHDlightsail.pem"

aws_access_key="AKIAQIRWIE3CKAMEZPNI"
aws_access_value="w+Cg24nj2Ns4pf7/9PvL55w+OImnevESWwHPP8OV"


# ***** dashboard.denkers.co
function scp_dashboard () {
  scp -i $aws_key $1 ec2-user@ec2-34-237-65-18.compute-1.amazonaws.com:/home/ec2-user/www/$2
}

alias :familydashboard="cd /Users/adge/Amazon_Drive/Amazon\ Drive/AHD/FamilyDashboard"


alias :code-denkers="code /Users/adge/denkersco.code-workspace"

# ***** Connect to phpMyAdmin on the AWS API Server
alias :denkers-db="ssh -N -L 8888:127.0.0.1:80 -i $lightsailkey ubuntu@denkers.co"

#alias :scp_denkers="scp -i /Users/adge/.ssh/AHD01.pem @1 ec2-user@ec2-3-85-181-247.compute-1.amazonaws.com:/home/ec2-user/drop/"
# usage:
# $  :scp_denkers ~/file.html

# ***** findbo.us website ip
findbo_us_ip='54.175.211.41'

# Compress PDF
compresspdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}
# Function `-conn`
# --------------------------------
# Connect to an AWS System using the default AWS Key
# ***** USAGE *****
# % -conn denkers.co
# % -conn findbo.us

-conn() {
  ssh -i $aws_key ec2-user@$1
}
# ----- End Function `-conn` -----




# ~~~~~ denkers.co website ~~~~~
denkers_co="18.215.211.25" ## depreciated
denkersco_ip="18.215.211.25"
denkersco_user="ec2-user"

alias :denkersco="ssh -i $lightsailkey $denkersco_user@$denkersco_ip"
alias :scp_denkersco="scp -i $lightsailkey $denkersco_user@denkers.co:/home/$denkersco_user/drop"

# open vscode on denkers.co
alias :code_denkersco="code -i $lightsailkey ssh://$denkersco_user@$denkersco_ip/home/$denkersco_user" 

#alias :denkers_co='ssh -i "$aws_key" ec2-user@$denkers_co'
#alias :denkers_co='ssh $denkers_co_user:$denkers_co_pass@$denkers_co'
#alias :denkers_co='ssh -i $aws_key ubuntu@denkers.co'
#alias :denkers_co='ssh -i $lightsailkey ubuntu@$denkers.co'

alias :denkers_db='ssh -N -L 8888:127.0.0.1:80 -i "$aws_key" $denkers_co_user@$denkers_co'
#alias :scp_denkers_co='scp -i "$aws_key" $1 ec2-user@$denkers_co:/var/www/html'

# ***** scp to denkers.co
#alias :scp_denkers="scp -i $aws_key $1 ubuntu@denkers.co:/home/ubuntu/drop"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# findbo.us website
findbo_us='54.175.211.41'
alias :connfindbo_us='ssh -i "$aws_key" ec2-user@$findbo_us'

# craft.denkers.co
craft_denkers_co='54.225.30.179'
alias :craft='ssh -i "$denkers_craft_key" ec2-user@$craft_denkers_co' 

# orion database
alias :orion='ssh -i "$HOME/.ssh/ahd01" orion-database.cvbiofxojyet.us-east-1.rds.amazonaws.com'

# infinity system
alias :infinity='ssh -i "$HOME/.ssh/infinity.pem" ec2-user@ec2-18-218-35-135.us-east-2.compute.amazonaws.com'

# -------------------------------------
# Section 5 - Server Commands (Apache, MySQL, etc.)
# -------------------------------------



# ~ mysql = start/stop/restart
alias :sql-start="sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist"

# ~ stop mysql
alias :sql-stop="sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist"

# ~ restart mysql
alias :sql-restart="sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist && sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist"


# ~ apache = start/stop/restart
# ~~~~~ arguments can be one of these three choices
# ~~~~~ args: start, stop, restart
alias :apache="sudo /usr/sbin/apachectl $1"    # ex :apache restart

# How to print the date and time (on console or in log)
alias :print-date="echo date +'%Y-%m-%d %H:%M:%S' && echo date +'%Y-%m-%dT%H:%M:%S'"

# Print a timestamp
alias :timestamp="date +'%Y-%m-%dT%H:%M:%S'"
alias :timestamp2="date +'%Y-%m-%d %H:%M:%S'"

# -------------------------------------
# Section 6 - Customized Commands
# -------------------------------------

# add another alias for `sudo`
alias @='sudo '

# modify default ls command
alias ls='ls -lastkTG'
alias :ls='ls -lastkTG'

# -------------------------------------
# Section 7 - Folders
# -------------------------------------

icloud="$HOME/Library/Mobile\ Documents/com~apple~CloudDocs"
alias :icloud="cd $icloud" 

vaults="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
alias :vaults="cd $vaults"
alias :obsidian="cd $vaults"
alias :obsidian_vaults="cd $vaults"

pythonista="$HOME/Library/Mobile\ Documents/iCloud~com~omz-software~Pythonista3/Documents"
alias :pythonista="cd $pythonista"
alias :code-pythonista="cd $pythonista && code ."

bin="$HOME/bin"
alias :bin="cd $bin"

sysbin="/usr/local/bin"
alias :sysbin="cd $sysbin"

src="$HOME/src"
alias :src="cd $src"

fz="$bin/fz"
alias :fz="cd $fz"

keys="$HOME/.keys"
alias :keys="cd $keys"

web="/Library/WebServer/Documents"
alias :web="cd $web"

# -------------------------------------
# Section 8 - Files
# -------------------------------------
# ~ Visual Studio Code - Modify Settings (settings.json)
alias :vscsettings='code /Users/adge/Library/Application\ Support/Code/User/settings.json'

# -------------------------------------
# Section 9 - Source Files
# -------------------------------------

# ~ adge's adafruit.io (aio) access key
alias :adafruitKey="source $keys/adafruit.io.key"

# ~ usajobs api searches  ::EXPERIMENTAL::
alias :usajobsKey="source $keys/usajobs.key"

# -------------------------------------
# Section 10 - Additional Setup
# -------------------------------------
# Setup Poetry
fpath+=~/.zfunc
autoload -Uz compinit && compinit

# date +'%Y-%m-%dT%H:%M:%S'

# -------------------------------------
# Section 11 - Django Shortcut Aliases
# -------------------------------------
alias :dj-update-models="
python manage.py makemigrations && 
python manage.py migrate && 
python manage.py loaddata --app denkersco people &&
python manage.py loaddata --app denkersco units &&
python manage.py loaddata --app denkersco ingredients &&
python manage.py loaddata --app denkersco formats &&
python manage.py loaddata --app denkersco routes &&
python manage.py loaddata --app denkersco otc &&
python manage.py loaddata --app denkersco doctors
"

alias :dnewproject="django-admin startproject $1 ."
alias :dnewapp="python manage.py startapp $1"

alias :dupdate="python manage.py makemigrations &&
python manage.py migrate
"
alias :dshell="python manage.py shell"
alias :drun="python manage.py runserver"
alias :ddb="python manage.py dbshell"

alias :dnewsuperuser="python manage.py createsuperuser"

# django user adge - password = `hartwick00`

alias :da="django-admin $0"

# -------------------------------------
# Section 12 - Python Shortcuts
# -------------------------------------
alias :venv="source venv/bin/activate"

alias :new-venv="py -m venv venv && :venv"




# -----------------------------------------------------
# Finishing up ...
# -----------------------------------------------------
user="$(id -u -n)"
uid="$(id -u)"

if [ `date +%H` -lt 12 ]; then 
  daytime='morning';
elif [ `date +%H` -lt 18 ]; then
  daytime='afternoon';
else 
  daytime='evening';
fi

# Get the current PATH variable
path_dirs=(${(s/:/)PATH})

# Specify the folder you want to check
folder_to_check="/Users/adge/dev/delrio_dev/"

# Check if the folder is already in the PATH
if [[ ! ${path_dirs[(ie)$folder_to_check]} -gt 0 ]]; then
  # Add the folder to the PATH if it's not already present
  export PATH="${folder_to_check}:${PATH}"
fi

#export PYTHONPATH=COLORTERM=truecolor;COMMAND_MODE=unix2003;EDITOR=code;GITHUBTOKEN=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;GITHUBUSER=adgedenkers;GIT_ASKPASS='/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/git/dist/askpass.sh';HOME=/Users/adge;LANG=en_US.UTF-8;LESS=-R;LOGNAME=adge;LSCOLORS=Gxfxcxdxbxegedabagacad;LS_COLORS='di=34;40:ln=36;40:so=35;40:pi=33;40:ex=32;40:bd=1;33;40:cd=1;33;40:su=0;41:sg=0;43:tw=0;42:ow=34;40:';MallocNanoZone=0;OPENAI_API_KEY=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;OPENAI_API_Organization=org-1oXUEO5LHmZPTqigY60xbYIs;ORIGINAL_XDG_CURRENT_DESKTOP=undefined;PAGER=less;PATH='/Users/adge/src/dashboard01/venv/bin:/Users/adge/packages:/Library/Frameworks/Python.framework/Versions/3.11/bin:/Library/Frameworks/Python.framework/Versions/3.10/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/adge/Library/Python/3.8/bin:/usr/local/share/dotnet:~/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/Wireshark.app/Contents/MacOS:/Library/Frameworks/Python.framework/Versions/3.11/bin:/Library/Frameworks/Python.framework/Versions/3.10/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin';PS1=$'(venv) %(?:%{\C-[[01;32m%}➜ :%{\C-[[01;31m%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)';PWD=/Users/adge/src/dashboard01;SALT=347a90c99558aa4e23cfaa52c410d11e01d846dbbc69b1ef5d72c746c5a89b54;SHELL=/bin/zsh;SHLVL=1;SSH_AUTH_SOCK=/private/tmp/com.apple.launchd.ptHkNm0PVR/Listeners;TERM=xterm-256color;TERM_PROGRAM=vscode;TERM_PROGRAM_VERSION=1.79.1;TMPDIR=/var/folders/h4/9cm6hhm96c7dfknqjk_dsvl40000gn/T/;USER=adge;USER_ZDOTDIR=/Users/adge;VIRTUAL_ENV=/Users/adge/src/dashboard01/venv;VIRTUAL_ENV_PROMPT='(venv) ';VSCODE_GIT_ASKPASS_EXTRA_ARGS=--ms-enable-electron-run-as-node;VSCODE_GIT_ASKPASS_MAIN='/Applications/Visual Studio Code.app/Contents/Resources/app/extensions/git/dist/askpass-main.js';VSCODE_GIT_ASKPASS_NODE='/Applications/Visual Studio Code.app/Contents/Frameworks/Code Helper (Plugin).app/Contents/MacOS/Code Helper (Plugin)';VSCODE_GIT_IPC_HANDLE=/var/folders/h4/9cm6hhm96c7dfknqjk_dsvl40000gn/T/vscode-git-078a15a9d6.sock;VSCODE_INJECTION=1;XPC_FLAGS=0x0;XPC_SERVICE_NAME=application.com.microsoft.VSCode.9361502674.9361502680;ZDOTDIR=/Users/adge;ZSH=/Users/adge/.oh-my-zsh;__CFBundleIdentifier=com.microsoft.VSCode;__CF_USER_TEXT_ENCODING=0x1F5:0x0:0x0;gh_cli_token=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;

PYTHONPATH=$PYTHONPATH:/Users/adge/packages

print-g "Good $daytime, sir. (using: $user/$uid)"

# ----------------------
# Common Features
# ----------------------

# Environment variables
export PATH="$PATH:/usr/local/bin:/usr/local/sbin"

# Aliases
alias ll='ls -l'
alias la='ls -A'

# Prompt customization
PS1="%m:%~%# "

# Auto-completions
autoload -U compinit && compinit

# ----------------------
# Relatively Common Features
# ----------------------

# Display the current git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="[\u@\h \W]\$(parse_git_branch) \$ "

# SSH agent initialization
eval "$(ssh-agent)"
ssh-add ~/.ssh/id_rsa

# Command history setup
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Auto-activate Python virtual environments and upgrade pip
auto_activate_virtualenv() {
    if [[ -f "venv/bin/activate" ]]; then
        source venv/bin/activate
        pip install --upgrade pip
    fi
}
add-zsh-hook chpwd auto_activate_virtualenv

# ----------------------
# Somewhat Uncommon Features
# ----------------------

# Automated tasks (Example: Update packages and upgrade pip)
auto_update_packages() {
    if [[ ! -f "~/.cache/update" || $(find "~/.cache/update" -mtime +7) ]]; then
        brew update
        touch "~/.cache/update"
    fi
}
auto_update_packages

# Dynamic aliases
rsg() { grep -R "$1" *; }

# Hooks for directory changes
chpwd() {
    if [[ "$PWD" == "/some/specific/directory" ]]; then
        echo "You've moved to: $PWD"
    fi
}

# Automated backups (Example: backup at 00:00)
auto_backup() {
    if [[ "$(date +%H:%M)" == "00:00" ]]; then
        tar -czf ~/backup.tgz ~/important_folder/
    fi
}
auto_backup




#[ -d "venv" ] && print-y "Reloading your Python venv in this directory" && :venv

# ===== ===== ===== EMERGENCY USE ONLY ===== ===== =====
# reset the PATH variable

# PATH=/usr/local/bin:/usr/bin/:/bin:/usr/sbin/:/sbin:$HOME/bin:/usr/local/share/dotnet:$HOME/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Library/Frameworks/Python.framework/Versions/3.8/bin:/$HOME/Library/Python/3.8/bin:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# 2020-03-05 Modified PATH
# ------------------------
# PATH as of 2020-03-05
# /Library/Frameworks/Python.framework/Versions/3.8/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:~/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands
# Changed to:
# PATH=/usr/local/bin:/usr/bin/:/bin:/usr/sbin/:/sbin:$HOME/bin:/usr/local/share/dotnet:$HOME/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Library/Frameworks/Python.framework/Versions/3.8/bin:/$HOME/Library/Python/3.8/bin:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# 2023-02-15 Modified PATH
# ------------------------
# PATH before 2023-02-15
#/Library/Frameworks/Python.framework/Versions/3.10/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/adge/Library/Python/3.8/bin:/usr/local/share/dotnet:~/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/Wireshark.app/Contents/MacOS

# 2023-08-17 Modified PATH
# PATH BEFORE 2023-08-17
# PATH=/Users/adge/packages:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/share/dotnet:~/.dotnet/tools:/Library/Frameworks/Mono.framework/Versions/Current/Commands:/Applications/Wireshark.app/Contents/MacOS:/Library/Frameworks/Python.framework/Versions/3.11/bin:/Library/Frameworks/Python.framework/Versions/3.10/bin:/Library/Frameworks/Python.framework/Versions/3.8/bin

# notes:
# removed python versions from path, and replaced with the `Current` version of Python. 
# ls -las /Library/Frameworks/Python.framework/Versions
# to see all available versions of Python

# baeh /usr/bin:/bin:/usr/sbin:/sbin

# Reset PATH string updated above
# ------------------------

# To just add an item to the path (but also include it above for the next time we need to reset the PATH), execute something like:
#
# $ PATH=$PATH:/path/to/executable/files/


# ===== ===== ==== NO EDITS BELOW THIS LINE ===== ===== =====

# close profile
hotel=rn
foxtrot=tu
sierra=re

$sierra$foxtrot$hotel
