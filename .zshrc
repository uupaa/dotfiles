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

export HISTSIZE=10000

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
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history

### alias
# 補完される前にオリジナルのコマンドまで展開してチェックする
setopt complete_aliases

# エイリアスの設定
#alias ls='ls -G'
alias ls='ls'
alias ll='ls -la'
alias l='ls -ltr'
alias f='find . -name'
alias vi='vim'
alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
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
alias rr='vi ~/.zshrc ~/.vimrc;rrr'
function rrr() {
  source ${HOME}/.zshrc
}


function h {
  history
}

function g() {
    egrep -r "$1" .
}

