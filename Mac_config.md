# 新Mac的配置

## 软件

### 必须
- Chrome
- brew

### 通用
- WeChat
- QQ
- EverNote
- 有道词典
- QQ音乐
- 网易云音乐
- 迅雷

### 开发
- iTerm2
- VSCode
- Navicat
- Sequel Pro

####
- TablePlus
- Medis

### 娱乐
- steam
- 射手影音（App store）


## 设置

### brew
- git -C "$(brew --repo homebrew/core)" fetch --unshallow
- brew tap beeftornado/rmtree

### brew 软件/应用
- brew install wget vim zsh-autosuggestions autojump thefuck
- brew install tree cloc glances the_silver_searcher
- brew install cmake go php composer php-cs-fixer mycli docker-compose
- brew cask install docker switchhosts dash julia

### zsh
- Oh My Zsh
- ln -s $HOME/code/github/MyConfigs/zsh/zshrc.mac $HOME/.zshrc
- git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
- git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
- source ~/.zshrc

### vim
- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
- ln -s $HOME/code/github/MyConfigs/vim/vimrc.mac $HOME/.vimrc
- ln -s $HOME/code/github/MyConfigs/vim/vimrc.plug $HOME/.vim/.vimrc.plug


