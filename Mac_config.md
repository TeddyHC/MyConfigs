# 新Mac的配置

## 软件

### 必须
- Chrome
- brew

### 通用
- WeChat
- QQ
- 企业微信
- EverNote
- 有道词典
- QQ音乐
- 网易云音乐
- 迅雷

### 开发
- iTerm2
- phpStorm

### 娱乐
- steam
- 射手影音（App store）


## 设置

### brew
- git -C "$(brew --repo homebrew/core)" fetch --unshallow

### zsh
- Oh My Zsh
- ln -s $HOME/code/github/MyConfigs/zsh/zshrc.mac $HOME/.zshrc
- rezshrc

### vim
- vim8
- curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
- YouCompleteMe ycm_server_python_interpreter 注意下python版本，目前只有python2(2.7+) 能用


