# ここみて設定してます
# https://github.com/dzfl/dotfiles/blob/master/.zshrc

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
alias ruby='/usr/local/bin/ruby'


# git flow alias
# gitflow {{branch-name}}
alias gitflow='git flow feature start'
# gitend {{branch-name}}
alias gitend='git flow feature finish'
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
PATH="$HOME/dotfiles:$PATH"
### Added by the Heroku Toolbelt
PATH="/usr/local/heroku/bin:$PATH"
PATH="/usr/local/share/npm/bin:$PATH"
NODE_PATH="/usr/local/share/npm/lib/node_modules/ejs"


### android-sdk path
PATH="$PATH:/Applications/android-sdk/platform-tools"



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
alias slide="vim ~/oss/reveal.js/slide.md ; pandoc --section-divs -s -t html5 --template ~/oss/pandoc_reveal/template.revealjs ~/oss/reveal.js/slide.md -o ~/oss/reveal.js/out.html ; open http://0.0.0.0/oss/reveal.js/out.html"
alias mkslide="pandoc --section-divs -s -t html5 --template ~/oss/pandoc_reveal/template.revealjs ~/oss/reveal.js/slide.md -o ~/oss/reveal.js/out.html"

# set git author user.name and user.email
alias git-user="git config user.name uupaa ; git config user.email uupaa.js@gmail.com"


