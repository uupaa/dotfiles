" <- is comment out

syntax on               "カラー表示

set encoding=utf-8      "UTF-8
set nocompatible        "vi非互換モード"
set noerrorbells        "エラー時にベルを鳴らさない"
set shortmess=t         "'Press RETURN or enter command to continue' を表示しない"
set history=100         "保存するコマンド数"
set wildmode=list:longest "コマンドライン補完をシェルと同じに"
set magic               "正規表現使用時に magic モードにする"
set incsearch           "検索してすぐにその単語の所まで飛ぶ"
set hlsearch            "検索ワードをハイライトする"
set iminsert=1          "日本語入力状態でもEscでコマンドモードへ"
set statusline=%F%m%r%h%w\ {\ type:%Y,\ x:%03v,\ y:%03p%%,\ hex:%04B\ } " path { type:filetype, x:cols, y:rows%, hex:charcode }
set showmatch           "対応する括弧に一時的に移動"
set backup
set backupdir=$HOME/backup/vim
set number              "行番号表示
set showmode            "モード表示
set title               "編集中のファイル名を表示
set ruler               "ルーラーの表示
set showcmd             "入力中のコマンドをステータスに表示する
set showmatch           "括弧入力時の対応する括弧を表示
set laststatus=2        "ステータスラインを常に表示
set smartindent         "オートインデント
set expandtab           "タブの代わりに空白文字挿入
set ts=4 sw=4 sts=0     "タブは半角4文字分のスペース
set ignorecase          "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase           "検索文字列に大文字が含まれている場合は区別して検索する
set wrap                "長い行を折り返す
set wrapscan            "検索時に最後まで行ったら最初に戻る
set noincsearch         "検索文字列入力時に順次対象文字列にヒットさせない
set nohlsearch          "検索結果文字列の非ハイライト表示
set noswapfile          "スワップファイルを作成しない
set clipboard=unnamed,autoselect " ヤンクでクリップボードにコピーする

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
set grepprg=ack


"ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" http://d.hatena.ne.jp/ryochack/20110609/1307639604
" quickfix: 編集許可と折り返し表示無効
function! OpenModifiableQF()
    cw
    set modifiable
    set nowrap
endfunction

"autocmd QuickfixCmdPost vimgrep call OpenModifiableQF()
autocmd QuickfixCmdPost grep call OpenModifiableQF()


" for macvim
if has('gui_macvim')
    set showtabline=2       " タブを常に表示
"    set imdisable           " IMを無効化
    set transparency=3      " 透明度を指定
    set antialias
    set guifont=Monaco:h12
"   colorscheme macvim
    colorscheme macvim

    " dark にしたければ以下を有効に
    " set background=dark
    " light にしたければ以下を有効に
    set background=light
    colorscheme solarized

    " 起動時にフルスクリーンモードにする
"    set fuoptions=maxvert,maxhorz
"    au GUIEnter * set fullscreen
    set lines=60
    set columns=160
endif

"" for Project.vim (Vim book)
" ファイルが選択されたらウインドウを閉じる 
":let g:proj_flags = "imstc"
" <Leader>p でプロジェクトを開閉する
":nmap <silent> <Leader>p <Plug>ToggleProject

" <Leader>p でデフォルトのプロジェクトを開く
":nmap <silent> <Leader>p :Project<CR>

"プロジェクトを開いた状態で展開した状態にする
autocmd BufAdd .proj silent! %foldopen!



" ファイルを開いた時にファイルのカレントディレクトリをワーキングディレクトリにする
augroup grlcd
    autocmd!
    autocmd BufEnter * lcd %:p:h
augroup end


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

" github の任意のリポジトリ (2)
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'

"filetype plugin indent on

" ファイルオープン時にNERDTreeを起動
let file_name = expand("%")
if has('vim_starting')
    autocmd VimEnter * NERDTree ./
endif


" --- vim plugin ---
" http://www.ispern.com/?p=324

" map の話 http://vimperator.g.hatena.ne.jp/snaka72/20090125/1232856965
" 複数のmodifierを組み合わせる場合、たとえば、Shift + Meta + a の場合は<S-M-a>（）という感じで続けて記述する。

" <CTRL + w> left  で画面を一つだけにする
" <CTRL + w> up    で水平分割
" <CTRL + w> right で垂直分割
nnoremap <silent> <C-w><Left> :only<CR>
nnoremap <silent> <C-w><Up> :sp<CR>
nnoremap <silent> <C-w><Right> :vsp<CR>


