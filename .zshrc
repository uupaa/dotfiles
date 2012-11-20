# ここみて設定してます
# https://github.com/dzfl/dotfiles/blob/master/.zshrc

# 文字コードの設定
export LANG=ja_JP.UTF-8

# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# ディレクトリを水色にする｡
#export LS_COLORS='di=01;36'
#export LS_COLORS="no=00:fi=00:di=01;36:ln=01;34"
#export LS_COLORS="no=00:fi=00:di=01;36:ln=01;36:*.js=01;36"
#export LS_COLORS="no=00:fi=00:di=01;38:ln=01;38"

# http://d.hatena.ne.jp/edvakf/20080413/1208042916
export LSCOLORS=gxfxcxdxbxegedabagacad

#export LS_COLORS_BOLD='no=00:fi=00:di=;34:ln=01;95:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.tex=01;33:*.sxw=01;33:*.sxc=01;33:*.lyx=01;33:*.pdf=0;35:*.ps=00;36:*.asm=1;33:*.S=0;33:*.s=0;33:*.h=0;31:*.c=0;35:*.cxx=0;35:*.cc=0;35:*.C=0;35:*.o=1;30:*.am=1;33:*.py=0;34:'
#export LS_COLORS_NORM='no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:do=00;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.deb=00;31:*.rpm=00;31:*.jar=00;31:*.jpg=00;35:*.jpeg=00;35:*.gif=00;35:*.bmp=00;35:*.pbm=00;35:*.pgm=00;35:*.ppm=00;35:*.tga=00;35:*.xbm=00;35:*.xpm=00;35:*.tif=00;35:*.tiff=00;35:*.png=00;35:*.mpg=00;35:*.mpeg=00;35:*.avi=00;35:*.fli=00;35:*.gl=00;35:*.dl=00;35:*.xcf=00;35:*.xwd=00;35:*.ogg=00;35:*.mp3=00;35:*.wav=00;35:*.tex=00;33:*.sxw=00;33:*.sxc=00;33:*.lyx=00;33:*.pdf=0;35:*.ps=00;36:*.asm=0;33:*.S=0;33:*.s=0;33:*.h=0;31:*.c=0;35:*.cxx=0;35:*.cc=0;35:*.C=0;35:*.o=0;30:*.am=0;33:*.py=0;34:'
#export MY_LS_COLORS="${MY_LS_COLORS:-LS_COLORS_BOLD}"
#eval export LS_COLORS=\${$MY_LS_COLORS}


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

function aaa() {
    echo "aaa"
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



