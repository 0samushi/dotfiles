"ファイルタイププラグインを無効に
filetype off
filetype plugin indent off

"カラースキーム
colorscheme molokai

"Vi互換モードオフ
set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'Blackrush/vim-gocode'
call vundle#end()


"neocompleteをONに
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"gocodeを利用
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
"set completeopt=menu.preview

"golintを利用
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")

"omni補完を有効に
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"setlocal omnifunc=syntaxcomplete

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
end

"シンタックスハイライトをオン
syntax on

"バッファを保存しなくても他のバッファを表示できるようにする
set hidden

"コマンドライン補完を便利に
set wildmenu

"シンタックスチェック設定
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=2
"let g:syntastic_mode_map = {'mode' : 'passive'}
"augroup AutoSyntastic
"  autocmd!
"  autocmd InsertLeave, TextChanged * call s:syntastic()
"augroup END
"function! s:syntastic()
"  w
"  SyntasticCheck
"endfunction


"タイプ途中のコマンドを画面最下行に表示
set showcmd

"クリップボードをとヤンクを共有
set clipboard=unnamed,autoselect

"検索語を強調表示
set hlsearch

"検索時に大文字・小文字を区別しない
set ignorecase
set smartcase

"0前置を8進数とみなさない
set nrformats=

"オートインデント、改行、インサートモード開始直後にバックスペースキーで削除できるようにする
set backspace=indent,eol,start

"オートインデント
set autoindent

"移動コマンドを使ったとき、行頭に移動しない
set nostartofline

"画面最下行にルーラー表示
set ruler

"ステータスラインを常に表示
set laststatus=2

"バッファ変更時、保存するかどうか確認する
set confirm

"ビジュアルベルを使う
set visualbell

"ビジュアルベル無効
set t_vb=

"全モードでマウス有効化
set mouse=a

"コマンドラインの高さを２行に
set cmdheight=2

"行番号表示
set number

"キーコードは即タイムアウト、マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

"F11でpasteとnopasteを切り替え
set pastetoggle=<F11>

"タブの代わりにスペース２個使う
set shiftwidth=2
set softtabstop=2
set expandtab


"日本語関連の設定
"if &encoding !=# 'utf-8'
"  set encoding=japan
"  set fileencoding=japan
"endif
"if has('iconv')
"  let s:enc_euc = 'euc-jp'
"  let s:enc_jis = 'iso-2022-jp'
"  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'eucjp-ms'
"    let s:enc_jis = 'iso-2022-jp-3'
"  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"    let s:enc_euc = 'euc-jisx0213'
"    let s:enc_jis = 'iso-2022-jp-3'
"  endif
"  if &encoding ==# 'utf-8'
"    let s:fileencodings_default = &fileencodings
"    if has('mac')
"      let &fileencodings = s:enc_jis .','. s:enc_euc
"      let &fileencodings = &fileencodings .','. s:fileencodings_default
"    else
"      let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"      let &fileencodings = &fileencodings .','. s:fileencodings_default
"    endif
"    unlet s:fileencodings_default
"  else
"    let &fileencodings = &fileencodings .','. s:enc_jis
"    set fileencodings+=utf-8,ucs-2le,ucs-2
"    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"      set fileencodings+=cp932
"      set fileencodings-=euc-jp
"      set fileencodings-=euc-jisx0213
"      set fileencodings-=eucjp-ms
"      let &encoding = s:enc_euc
"      let &fileencoding = s:enc_euc
"    else
"      let &fileencodings = &fileencodings .','. s:enc_euc
"    endif
"  endif
"  unlet s:enc_euc
"  unlet s:enc_jis
"endif
"



"ファイルタイププラグインを有効に
filetype plugin indent on
