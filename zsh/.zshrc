# Path to your oh-my-zsh installation.
  export ZSH=/home/teddy/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="aussiegeek"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git symfony2 sudo colored-man)

# User configuration

#当前目录
PROMPT='[%F{green}%n@%m:%~%f]>'

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"  
# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.linuxbrew/bin"  
# export LD\_LIBRARY\_PATH="$HOME/.linuxbrew/lib:$LD\_LIBRARY\_PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#--------------------------------------------------------------------
# personal export
#--------------------------------------------------------------------

export OMS=/home/$USER/git/oms
export IMG_DIR=/Data/webapps/img
export DEPLOY=/home/dev/svn/deploy/trunk/dev

# history lines and time
export HISTTIMEFORMAT='%F %T '
export HISTSIZE="10000"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#--------------------------------------------------------------------
# system order aliases
#--------------------------------------------------------------------

alias cls='clear'
alias ll='ls -alh'
alias vi='vim'
alias grep='grep --color=auto --exclude-dir=\.svn --exclude-dir=\.git --exclude-dir=js --exclude-dir=css --exclude-dir=test --exclude-dir=Tests --exclude-dir=project --exclude-dir=cache --exclude-dir=logs --exclude-dir=web --exclude-dir=vendor -n'
# alias grep='grep --color=auto --exclude-dir=project -n'
# alias egrep='egrep --color=auto'

#--------------------------------------------------------------------
# open file aliases
#--------------------------------------------------------------------

alias -s php=vim
# alias -s py=vim
alias -s c=vim

#--------------------------------------------------------------------
# Aliases
#--------------------------------------------------------------------

#vim
alias vimrc="vim ~/.vimrc"
alias vimbundle="vim ~/.vim/.vimrc.bundles"

#zsh
alias zshrc="vim ~/.zshrc"
alias rezshrc="source ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

#hosts
alias hosts='sudo vim /etc/hosts'

#php format
alias pfix='php-cs-fixer fix'
alias pcs='/home/teddy/git/PHP_CodeSniffer/scripts/phpcs'
alias pcbf='/home/teddy/git/PHP_CodeSniffer/scripts/phpcbf'

#--------------------------------------------------------------------
# work aliases
#--------------------------------------------------------------------

alias errlog="tail --follow /tmp/log_* /tmp/allsqls.log /tmp/slowsqls.log /tmp/exception_* /Data/apps/nginx/logs/error-* /Data/apps/php/logs/php-fpm.log /Data/apps/php/logs/slow.log /Data/apps/php/logs/slow-web.log"

alias rst='sudo service nginx restart; sudo service php5-fpm restart'

#open project with vim
alias vop='cd /home/teddy/git/oms; vim -c "NERDTree"'

#cleancache
alias ccache='cd /home/teddy/git/oms; php app/console cache:clear --env dev; cd -'
alias cjs='cd /home/teddy/git/oms; php app/console assets:install web --env dev && php app/console assetic:dump --env dev; cd -'

#mysql
alias mysql1='mycli -h127.0.0.1 -uroot'
alias mysqlOnline='mycli -hdb.oms.uco.com -uhongchao '

alias fsql='cd /home/teddy/git/oms; php app/console doctrine:schema:update --force --dump-sql; cd -'
alias tt='cd /home/teddy/git/oms; /home/teddy/git/oms/vendor/phpunit/phpunit/phpunit -c app --stop-on-error'

