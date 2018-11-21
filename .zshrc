
# ここみて設定してます
# https://github.com/dzfl/dotfiles/blob/master/.zshrc

# JAVA
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_25`
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
#export JRE_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home/jre"
export CLASSPATH=".:~/oss/my/jcodec/src/main/java"

# 文字コードの設定
export LANG=ja_JP.UTF-8

# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# ディレクトリを水色にする
# http://d.hatena.ne.jp/edvakf/20080413/1208042916
export LSCOLORS=gxfxcxdxbxegedabagacad


# 直前のコマンドと同一ならば登録しない
setopt hist_ignore_dups

# 登録済コマンド行は古い方を削除
setopt hist_ignore_all_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 履歴をインクリメンタルに追加
setopt inc_append_history

# AUTO_PUSHD
setopt auto_pushd

# 余分な空白は詰めて登録(空白数違い登録を防ぐ)
setopt hist_reduce_blanks

# 履歴を追加(毎回HISTFILEを作るのではなく)
setopt append_history 

# ディレクトリ名だけで､ディレクトリの移動をする｡
setopt auto_cd

# ^Iで補完候補を表示（曖昧補完）
setopt auto_list

# C-s, C-qを無効にする。
setopt no_flow_control

# cd -<Tab>で今までに移動したディレクトリを表示
setopt auto_pushd
setopt pushd_ignore_dups

# スペルミス補完
setopt correct

# カレントディレクトリ中にサブディレクトリが
# 見付からなかった場合に cd が検索する
# ディレクトリのリスト
cdpath=($HOME)

# PROMPTに彩色
#setopt PROMPT_SUBST

### history
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=~/.zsh_history
#setopt share_history

### alias
# 補完される前にオリジナルのコマンドまで展開してチェックする
setopt complete_aliases

# エイリアスの設定
#alias ls='ls -G'
alias ls='ls'
alias ll='ls -la'
alias l='ls -ltr'
alias f='find . -name'

alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias vv='/Applications/MacVim.app/Contents/MacOS/MacVim -g'

# mac-vim kaoriya http://code.google.com/p/macvim-kaoriya/
# alias vi='vim'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim="mvim --remote-tab-silent"

# alias grunt='/usr/local/share/npm/bin/grunt'
alias jshint='/usr/local/share/npm/bin/jshint'
# alias ruby='/usr/local/bin/ruby'


# git flow alias
# gitflow {{branch-name}}
alias gitflow='git flow feature start'
# gitend {{branch-name}}
alias gitend='git flow feature finish -k'

# git commands shortcut
alias gs='git status'
alias gd='git diff'


# ctags
# ctags -R でtags ファイルを生成
# :!ctags や CTRL + ] でタグファイル検索
# alias ctags='/Applications/MacVim.app/Contents/MacOS/ctags "$@"'
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'


# 256色確認
function pcolor() {
    for ((f = 0; f < 255; f++)); do
        printf "\e[38;5;%dm %3d*■\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
        done
    echo
}

# edit and reload resource files: 設定ファイル(zshrc, vimrc)編集用
alias rr='vi ~/.zshrc ~/.vimrc ~/.gvimrc'
function rrr() {
  source ${HOME}/.zshrc
  echo "HOME:" ${HOME}
  echo "PATH:" ${PATH}
}


function h {
  history
}

function g() {
    egrep -r "$1" .
}

# git diff を vimdiff で見る
# 1. cd ~
# 2. mv .gitconfig dotfiles
# 3. ln -s dotfiles/.gitconfig .
# 4. vi dotfiles/.gitconfig
#
# [diff]
#   external = git_diff_wrapper
# [pager]
#   diff =
#
# 4. chmod +x dotfiles/.gitconfig
# 5. vi git_diff_wrapper
#
# #!/bin/sh
#
# vimdiff "$2" "$5"
#

# git diff
function git_diff() {
    git diff --no-ext-diff -w "$@" | vim -R -
}

### Add $HOME/dotfile
#PATH="$HOME/dotfiles:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"

### android-sdk path
#export PATH="$PATH:/Applications/android-sdk/platform-tools"

### PATH ##########################################
#  typeset
#    -U 重複パスを登録しない
#    -x exportも同時に行う
#    -T 環境変数へ紐付け
#
#   path=xxxx(N-/)
#     (N-/): 存在しないディレクトリは登録しない
#     パス(...): ...という条件にマッチするパスのみ残す
#        N: NULL_GLOBオプションを設定。
#           globがマッチしなかったり存在しないパスを無視する
#        -: シンボリックリンク先のパスを評価
#        /: ディレクトリのみ残す
#        .: 通常のファイルのみ残す


#### ## 重複パスを登録しない
#### typeset -U path cdpath fpath manpath
#### 
#### ## sudo用のpathを設定
#### typeset -xT SUDO_PATH sudo_path
#### typeset -U sudo_path
#### sudo_path=({/usr/local,/usr,}/sbin(N-/))
#### 
#### ## pathを設定
#### 
#### path=(
####     ${path}
####     ~/bin(N-/)
####     /usr/local/bin(N-/)
####     /usr/local/sbin(N-/)
####     ~/Library/Android/sdk/platform-tools(N-/)
####     ~/.rbenv/bin(N-/)
#### )
#export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:~/Library/Android/sdk/platform-tools

export PATH="~/bin:/usr/local/bin:/usr/local/sbin:$HOME/Library/Android/sdk/platform-tools:~/.rbenv/bin:$PATH"

## install npm package to local and run.
# export PATH=$PATH:./node_modules/.bin

# JSX
alias jsxx='jsx --executable web --output '

### ignore CFURLCopyResourcePropertyForKey failed because it was passed this URL which has no scheme:
alias gitk='gitk 2>/dev/null'

#alias chromedebug='adb forward tcp:9222 localabstruct:chrome_devtools_remote'


# Flash debug player
alias flash='open -a /Applications/Flash\ Player.app '
alias flashlog='tail -f ~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt'

# pandoc alias -> http://0.0.0.0/oss/reveal.js/out.html
#alias pandoc="pandoc --section-divs -s -t html5 --template ~/oss/pandoc_reveal/template.revealjs ~/oss/myslide.md -o ~/oss/reveal.js/out.html ; open ~/oss/reveal.js/out.html"
#alias slide="vim ~/oss/reveal.js/slide.md ; pandoc --section-divs -s -t html5 --template ~/oss/pandoc_reveal/template.revealjs ~/oss/myslide.md -o ~/oss/reveal.js/out.html ; open http://0.0.0.0/oss/reveal.js/out.html"
#alias slide="vim ~/oss/reveal.js/slide.md ; pandoc --section-divs -s -t html5 --template ~/oss/pandoc_reveal/template.revealjs ~/oss/reveal.js/slide.md -o ~/oss/reveal.js/out.html ; open http://0.0.0.0/oss/reveal.js/out.html"
#alias mkslide="pandoc --section-divs -s -t html5 --template ~/oss/pandoc_reveal/template.revealjs ~/oss/reveal.js/slide.md -o ~/oss/reveal.js/out.html"
#alias taskslide="pandoc --section-divs -s -t html5 --template ~/oss/my/Task.js/slide/template.html ~/oss/my/Task.js/slide/index.md -o ~/oss/my/Task.js/slide/index.html"
#alias taskslide="pandoc --section-divs -s -t html5 --template ~/oss/my/Task.js/slide/template.html ./index.md -o ~/oss/my/Task.js/slide/index.html"

# set git author user.name and user.email
alias github-user="git config user.name uupaa ; git config user.email uupaa.js@gmail.com"


#~/dotfiles/.git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='\[\033[40;1;32m\]\u\[\033[2;32m\]@\[\033[0m\]\[\033[40;32m\]\h \[\033[1;36m\]\w \[\033[31m\]$(__git_ps1 "[%s]")\[\033[00m\] \[\033[0m\]\[\033[40;2;37m\]`date +"%Y/%m/%d %p %H:%M:%S"` \[\033[0m\]\n\\$ '
#export PS1=$PS1

#for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)



# https://gist.github.com/uupaa/97ded5812fc9d2f93fbb
#
# Show branch name in Zsh's right prompt
#
#
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

setopt prompt_subst

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi
        name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

        st=`git status 2> /dev/null`
        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
                color=%F{green}
        elif [[ -n `echo "$st" | grep "^no changes added"` ]]; then
                color=%F{yellow}
        elif [[ -n `echo "$st" | grep "^# Changes to be committed"` ]]; then
                color=%B%F{red}
        else
                color=%F{red}
        fi
        echo "$color$name$action%f%b "
}

RPROMPT='[`rprompt-git-current-branch`%~]'


#

alias ios-simu="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app/Contents/MacOS/iPhone\ Simulator -SimulateApplication /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk/Applications/MobileSafari.app/MobileSafari -u http://example.com"



#alias install="rm -rf node_modules; npm install"
#alias build="npm run build"
#alias lint="npm run lint"
alias pub="git push; npm publish"
alias tt="tig status"
alias gg='npm run patch; git add . ; git commit -m "follow WebModule"; git push; npm publish'

# HSL, MPEG-DASH settings
alias MP4Box="/Applications/Osmo4.app/Contents/MacOS/MP4Box"
alias ngconf="vi /usr/local/etc/nginx/nginx.conf"

alias ngtest="nginx -t"
alias ngstop="nginx -s stop"
alias ngstart="nginx -s reload"

## can use alias in sudo
## http://yudoufu.hatenablog.jp/entry/20110326/1301129885
alias sudo='sudo -E '

## ag
alias agmd='ag -G \.md$ '

## adb
alias adb ~/Library/Android/sdk/platform-tools/adb

## mdfind
# alias mdfind -onlyin dir... -name file

alias find_modules='ls -tl `find . -regex ".*node_modules.*" -name "*.js" -type f -print` | head -20'
alias hlsdump='node index.js'


## rbenv
# eval "$(rbenv init -)"




export PATH="$HOME/.yarn/bin:$PATH"


## peco
# ps aux | peco
#


## emscripten
#Adding directories to PATH:
export PATH="$PATH:~/oss/my/emscripten/emsdk_portable"
export PATH="$PATH:~/oss/my/emscripten/emsdk_portable/clang/e1.35.0_64bit"
export PATH="$PATH:~/oss/my/emscripten/emsdk_portable/node/4.1.1_64bit/bin"
export PATH="$PATH:~/oss/my/emscripten/emsdk_portable/emscripten/1.35.0"

#Setting environment variables:
export EM_CONFIG="~/.emscripten"
export EMSCRIPTEN="~/oss/my/emscripten/emsdk_portable/emscripten/1.35.0"

## brew install ffmpeg --with-frei0r settings
export FREI0R_PATH="/usr/local/lib/frei0r-1"


## http://apple.stackexchange.com/questions/269785/tell-git-not-to-use-my-github-account-keychain-for-public-repositories-its
# export HOMEBREW_NO_GITHUB_API=1


## Python3
alias p3='python3'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '~/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '~/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

## HTTP/2 + WireShark
export SSLKEYLOGFILE="~/Desktop/tls_key.log"

## resolve a local installed npm module bin path (./node_modules/.bin)
export PATH="./node_modules/.bin:$PATH"

## resolve a local installed npm module bin path `$(npm bin)`

# Rust tools path
## source ~/.cargo/env

## Chrome canary + no secure
alias canary='open -a Google\ Chrome\ Canary --args --user-data-dir ~/ --allow-insecure-localhost --allow-cross-origin-auth-prompt --disable-web-security --ignore-certificate-errors --unsafely-treat-insecure-origin-as-secure=https://localhost'
  # --user-data-dir ~/
  # --allow-insecure-localhost
  # --allow-cross-origin-auth-prompt
  # --enable-module-scripts-dynamic-import
  # --harmony-dynamic-import
  # --disable-web-security
  # --ignore-certificate-errors
  # --unsafely-treat-insecure-origin-as-secure=https://localhost:1123

alias chrome='open -a Google\ Chrome --args --user-data-dir ~/ --allow-insecure-localhost --allow-cross-origin-auth-prompt --disable-web-security --ignore-certificate-errors --unsafely-treat-insecure-origin-as-secure=https://localhost'


alias ddms='~/Library/Android/sdk/tools/monitor'



## scp TL;DR
#
# put local file/dir to remote:
#   scp [options] {local_file_or_dir} {remote_user}@{remote_ip_or_domain}:{remote-path}
#   put file: scp file.md foo@192.168.1.10:~/share
#   put dir:  scp -rq dir foo@192.168.1.10:~/share
#
# get remote file/dir to local:
#   scp [options] {remote_user}@{remote_ip_or_domain}:{remote-path} {local_file_or_dir}
#   get file: scp foo@192.168.1.10:~/share/file.md .
#   get dir:  scp -rq foo@192.168.1.10:~/share/dir .



# Flutter
export PATH="~/wip/_/www/oss/flutter/bin:$PATH"

# GO

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"




