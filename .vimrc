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
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%04B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
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


