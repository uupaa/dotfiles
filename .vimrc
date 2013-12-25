" <- is comment out

syntax on               "カラー表示


" tabstop settings
" HTML を2 tab にする
set tabstop=4
augroup HTML_2_INDENT
    autocmd!
    autocmd FileType html setlocal shiftwidth=2 tabstop=4 softtabstop=2
augroup END



set encoding=utf-8      "UTF-8
set scrolloff=1         "スクロール時の余白
set autoread            "更新されたら自動で再読み込み
set cursorline          "カーソル行を反転
set nocompatible        "vi非互換モード
set noerrorbells        "エラー時にベルを鳴らさない
set novisualbell        "ビジュアルベルの抑止
set visualbell t_vb=
set shortmess=t         "'Press RETURN or enter command to continue' を表示しない
set history=100         "保存するコマンド数
set wildmode=list:longest "コマンドライン補完をシェルと同じに
set colorcolumn=80      "80文字目を強調表示
set magic               "正規表現使用時に magic モードにする
set matchtime=1         "括弧対応??
set noshowmatch         "括弧の対応を解除
let loaded_matchparen=1 "括弧の対応を強制解除
"set cindent             "インデントを有効にする
"set smartindent
"set cinoptions+=:0,g0   "http://d.hatena.ne.jp/alwei/20111106/1320595940
set iminsert=1          "日本語入力状態でもEscでコマンドモードへ
"set statusline=%F%m%r%h%w\ {%{&fileencoding},\ %Y,\ %03v,\ %03p%%,\ %04B,\ %{&ff}} " path {utf-8, JAVASCRIPT, cols, rows%, charcode, format}
set statusline=%F%m%r%h%w\ {%{&fileencoding},%Y,%03v,%03p%%,%04B,%{&ff}} " path {utf-8, JAVASCRIPT, cols, rows%, charcode, format}
set showmatch           "対応する括弧に一時的に移動
set backup
set backupdir=$HOME/backup/vim
set number              "行番号表示
set showmode            "モード表示
set title               "編集中のファイル名を表示
set ruler               "ルーラーの表示
set showcmd             "入力中のコマンドをステータスに表示する
set showmatch           "括弧入力時の対応する括弧を表示
set laststatus=2        "ステータスラインを常に表示
set expandtab           "タブの代わりに空白文字挿入
set ts=4 sw=4 sts=0     "タブは半角4文字分のスペース
set ignorecase          "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase           "検索文字列に大文字が含まれている場合は区別して検索する
set nowrap              "長い行を折り返さない
set wrapscan            "検索時に最後まで行ったら最初に戻る
"set gdefault            "gオプションをデフォルトに
set noincsearch         "検索文字列入力時に順次対象文字列にヒットさせない
set nohlsearch          "検索結果文字列の非ハイライト表示
set noswapfile          "スワップファイルを作成しない
set clipboard=unnamed,autoselect " ヤンクでクリップボードにコピーする
set incsearch           "検索してすぐにその単語の所まで飛ぶ
set hlsearch            "検索ワードをハイライトする

" open したファイルのディレクトリにカレントディレクトリを移動する
" http://d.hatena.ne.jp/homaju/20130131/1359614451
" autocmd BufEnter * execute ":lcd " . expand("%:p:h") 
" fnameescape() で、パスがスペースを含む場合にエラーがでないようにする
" autocmd BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))
augroup setcwd
    autocmd!
    autocmd BufEnter * execute 'lcd ' fnameescape(expand('%:p:h'))
augroup END

" 2byteコードでカーソル位置がずれないように
if exists('&ambiwidth')
    set ambiwidth=double
endif

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" mac vim で <Leader>(円記号) を使用可能にする
"if has('gui_macvim')
    let mapleader='¥'
"endif

" nnoremap <M-f> <C-f>


" memo:
" 最後に保存するまでにどれぐらい修正したかを確認したい
" http://nanasi.jp/articles/howto/diff/diff-original-file.html
" :DiffOrig

" ack で grep する
" :gr[ep] KEYWORD | cw[in] -> open QuickFix window
" :gr _alpha|cw  ->  QuickFixが開くので、CTRL+W 2回でQucikFormウインドウを移動する
"                    QuickFixを閉じるには :q 
"                    :cn で 次のQucikFixの項目に移動する
"                    :cp で 前のQuickFixの項目に移動する
"set grepprg=ack

" ag で grep する
" vim上からは、 :Ag [option] pattern で検索できる
set grepprg=ag\ -a


"ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" http://d.hatena.ne.jp/ryochack/20110609/1307639604
" quickfix: 編集許可と折り返し表示無効
function! OpenModifiableQF()
    cw
    set modifiable
    set nowrap
endfunction

"autocmd QuickfixCmdPost vimgrep call OpenModifiableQF()
autocmd QuickfixCmdPost grep call OpenModifiableQF()


" ---------------------------------------------------
" NERDTree - http://blog.livedoor.jp/sasata299/archives/51711587.html
" NERDTree を F9 でトグル, または バクスラp で起動
:nmap <F9> :NERDTreeToggle<CR>
:nmap <silent> <Leader>p :NERDTreeToggle<CR>

" :NERDTree / :NERDTreeToggle

" :NERDTree + grep
" http://yp.xenophy.com/?p=78

"filetype off

"-----------------------------------

set rtp+=~/.vim/vundle.git/
call vundle#rc()

" github の任意のリポジトリ
" 変更後に :BundleInstall を実行すること
Bundle 'scrooloose/nerdtree'
" Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'
" Ack [option]{pattern}[dir]
" 例: Ack function
" コマンドラインからは ack function <CR>

"filetype plugin indent on

" ファイルオープン時にNERDTreeを起動
let file_name = expand("%")
if has('vim_starting')
"   autocmd VimEnter * NERDTree ./
    autocmd GUIEnter * NERDTree ./
endif


" --- vim plugin ---
" http://www.ispern.com/?p=324

" map の話 http://vimperator.g.hatena.ne.jp/snaka72/20090125/1232856965
" 複数のmodifierを組み合わせる場合、たとえば、Shift + Meta + a の場合は<S-M-a>（）という感じで続けて記述する。

" <CTRL + w> left  で画面を一つだけにする
" <CTRL + w> up    で水平分割
" <CTRL + w> right で垂直分割
nnoremap <silent> <C-w><Up> :sp<CR>
nnoremap <silent> <C-w><Left> :only<CR>
nnoremap <silent> <C-w><Right> :vsp<CR>


" ctags -f ~/.tags -R ~/oss/
":set tags=~/.tags,/home/user/commontags
:set tags=~/.tags,.tags

" #h とタイプすることでHTMLのひな形を挿入する
:ab #h <!DOCTYPE html><html><head><meta charset="utf-8"><link rel="stylesheet" type="text/css" href="a.css" /><script src="a.js"></script></head><body> </body></html>

" 拡張子がjsのファイルを読み込むと、雛形を挿入する
augroup insertTemplate
    autocmd!
    autocmd BufNewFile *.js 0r $HOME/.vimtemplate/default.js
    autocmd BufNewFile index.html 0r $HOME/.vimtemplate/index.html
    autocmd BufNewFile index.mb.html 0r $HOME/.vimtemplate/index.mb.html
    autocmd BufNewFile package.json 0r $HOME/.vimtemplate/package.json
augroup END

" tab を表示する
set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

" ノーマルモードで gf (カーソル下のファイル名を直接開く)
" http://nanasi.jp/articles/howto/file/expand.html

" :grep や :make の実行後、自動的に QuickFix ウィンドウを開く
command! -nargs=1 Grep call s:Grep("grep", <f-args>)
function! s:Grep(cmd, arg)
 exe "sil " . cmd . " ". a:arg
 if len(getqflist()) == 0
   echohl WarningMsg
   echomsg "No match found."
   echohl None
 else
  cw
  redraw!
 endif
endfunction

" q/ で検索を開始し、p でヤンクした文字列を貼り付け
" q/ で検索を開始し、




" <C-Space>でomni補完 TODO:検証
"imap <C-Space> <C-x><C-o>

" vv で単語をヤンク
nnoremap vv viwy
" vv/ で単語をヤンクして下方検索
"" nnoremap vv/ viwy*
nnoremap vv/ viwy*




" vv* で単語をヤンクして上方検索
nnoremap vv# viwy#

" vd で単語を削除
nnoremap vd viw<Del>




" CTRL+hjkl で上下左右のウインドウに移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" :reg でヤンク(レジスタ)の一覧を表示
" "ay で レジスタa にヤンク
" "ap で レジスタa の内容でペースト
" <C-r>" で ヤンクした内容をペースト
" <C-r>a で レジスタa の内容をペースト
" <C-r>/ で 検索文字列をペースト
" <C-r>* で クリップボードの内容をペースト


" ヤンクしておき、単語の上で cy で置換
" nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> cy   ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy   c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" 連続でペーストできるように 0レジスタを使う
" http://qiita.com/fukajun/items/bd97a9b963dae40b63f5
"vnoremap <silent> <C-p> "0p<CR>




" \w か \\ で カーソル下のURLをブラウザで開く
"
" http://example.com/
function! OpenWWWAddress()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction

map <Leader>w :call OpenWWWAddress()<CR>
map <Leader><Leader> :call OpenWWWAddress()<CR>




" カーソル下のパスを開く( gf ) , 元のファイルに戻る CTRL + O
" カーソル下のパスを新しいウインドウで開く( CTRL+W f ) , 元のファイルに戻る CTRL + O

" add the repository path
set rtp+=/path/to/jsx.vim

" when you use a plugin manager (vundle or NeoBundle),
" just declare the repository path in your .vimrc

" for vundle
" Bundle 'jsx/jsx.vim.git'
Bundle 'rking/ag.vim'
"Bundle 'vim-colors-solarized' 




" 文字数カウント
" http://n.blueblack.net/articles/2012-06-15_01_vim_character_count/
augroup CharCounter
    autocmd!
    autocmd BufNew,BufEnter,BufWrite,InsertLeave * call <SID>Update()
augroup END

function! s:Update()
    let b:charCounterCount = s:CharCount()
endfunction

function! s:CharCount()
    let l:result = 0
    for l:linenum in range(0, line('$'))
        let l:line = getline(l:linenum)
        let l:result += strlen(substitute(l:line, ".", "x", "g"))
    endfor
    return l:result
endfunction
"set statusline=%F%m%r%h%w\ {%{&fileencoding},%Y,%03v,%03p%%,%04B,%{&ff},%{b:charCounterCount}} " path {utf-8, JAVASCRIPT, cols, rows%, charcode, format, count}
set statusline=%F%m%r%h%w\ {%{&fileencoding},%Y,%03v,%03p%%,%04B,%{&ff}} " path {utf-8, JAVASCRIPT, cols, rows%, charcode, format}


" JSX
augroup JSX
    autocmd!
    autocmd FileType jsx compiler jsx
augroup END

" add the repository path
set rtp+=~/dotfiles/jsx.vim

" when you use a plugin manager (vundle or NeoBundle),
" just declare the repository path in your .vimrc

" for vundle
Bundle 'git://github.com/jsx/jsx.vim.git'

" for NeoBundle
" NeoBundle 'git://github.com/jsx/jsx.vim.git'


" :w -> jshint
" https://github.com/scrooloose/syntastic
" execute pathogen#infect()
" http://www.serendip.ws/archives/6180
" let g:syntastic_mode_map = { "mode" : "active", "active_filetypes" : ["javascript", "json"] }
