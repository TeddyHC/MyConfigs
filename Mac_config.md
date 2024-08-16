# 新Mac的配置

## 软件

### 必须
- Chrome
- [Homebrew](https://brew.sh/)

### 通用
- WeChat
- [有道云笔记](http://note.youdao.com/)
- [Notion](https://www.notion.so/)
- 有道词典
- QQ音乐

### Develop Tools
- [iTerm2](https://www.iterm2.com/) (terminal)
- [VSCode](https://code.visualstudio.com/)
- Navicat (mysql)
- [Sequel Pro](http://www.sequelpro.com/) (mysql)
- [Robo 3T](https://www.robomongo.org/) (mongodb)
- [Medis](http://getmedis.com/) (redis)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- TablePlus

### 娱乐
- steam
- 射手影音（App store）

## 设置

### brew
- [brew](https://brew.sh/)
- git -C "$(brew --repo homebrew/core)" fetch --unshallow
- brew tap beeftornado/rmtree

### brew 软件/应用
- brew install wget vim zsh-autosuggestions autojump thefuck
- brew install tree cloc glances the_silver_searcher
- brew install cmake go php composer php-cs-fixer mycli docker-compose
- brew install --cask docker switchhosts dash julia snipaste

### zsh
- [Oh My Zsh](https://ohmyz.sh/)
- ln -s $HOME/code/github/MyConfigs/zsh/zshrc.mac $HOME/.zshrc
- git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
- git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
- source ~/.zshrc

### vim
- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
- ln -s $HOME/code/github/MyConfigs/vim/vimrc.mac $HOME/.vimrc
- ln -s $HOME/code/github/MyConfigs/vim/vimrc.plug $HOME/.vim/.vimrc.plug


