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

### 娱乐
- steam
- 射手影音（App store）


## 设置

### brew
- git -C "$(brew --repo homebrew/core)" fetch --unshallow
- brew install wget vim zsh-autosuggestions autojump thefuck

### zsh
- Oh My Zsh
- ln -s $HOME/code/github/MyConfigs/zsh/zshrc.mac $HOME/.zshrc
- rezshrc

### vim
- vim8
- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


