
# ここみて設定してます
# https://github.com/dzfl/dotfiles/blob/master/.zshrc

# JAVA
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home"
export JAVA_HODE=`/usr/libexec/java_home -v 1.8.0_25`

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

alias grunt='/usr/local/share/npm/bin/grunt'
alias jshint='/usr/local/share/npm/bin/jshint'
# alias ruby='/usr/local/bin/ruby'


# git flow alias
# gitflow {{branch-name}}
alias gitflow='git flow feature start'
# gitend {{branch-name}}
alias gitend='git flow feature finish -k'
# git status shortcut
alias gs='git status'


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
alias rr='vi ~/.zshrc ~/.vimrc ~/.gvimrc;rrr'
function rrr() {
  source ${HOME}/.zshrc
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
#PATH="/usr/local/share/npm/bin:$PATH"

export NODE_PATH="/usr/local/lib/node_modules"

### android-sdk path
export PATH="$PATH:/Applications/android-sdk/platform-tools"

export PATH="/usr/local/bin:$PATH"







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
alias git-user="git config user.name uupaa ; git config user.email uupaa.js@gmail.com"


#~/dotfiles/.git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='\[\033[40;1;32m\]\u\[\033[2;32m\]@\[\033[0m\]\[\033[40;32m\]\h \[\033[1;36m\]\w \[\033[31m\]$(__git_ps1 "[%s]")\[\033[00m\] \[\033[0m\]\[\033[40;2;37m\]`date +"%Y/%m/%d %p %H:%M:%S"` \[\033[0m\]\n\\$ '
#export PS1=$PS1

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
#alias git-init='git-user; rm .gitignore .npmignore .jshintrc; ../Xxx.js/clone.js; git add .gitignore .npmignore .jshintrc README.md LICENSE'
alias git-user="git config user.name uupaa ; git config user.email uupaa.js@gmail.com"

alias ios-simu="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app/Contents/MacOS/iPhone\ Simulator -SimulateApplication /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.0.sdk/Applications/MobileSafari.app/MobileSafari -u http://example.com"



alias install="rm -rf node_modules; npm install"
alias build="npm run build"
alias test="npm run test"
alias lint="npm run lint"
alias all="install;build;test;lint"

alias nw="~/oss/my/nw/nwjs.app/Contents/MacOS/nwjs"
alias el="./Electron.app/Contents/MacOS/Electron your-app/"

alias tt="tig status"

alias wm="npm update; npm run test-page; npm run build; npm run test"
alias pub="git push; npm publish"

export NODE_PATH="/usr/local/lib/node_modules"

# HSL, MPEG-DASH settings
alias MP4Box="/Applications/Osmo4.app/Contents/MacOS/MP4Box"
alias nginx_conf="vi /usr/local/etc/nginx/nginx.conf"

# add path
export PATH="$PATH:/usr/local:/usr/local/sbin"


