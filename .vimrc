" git test
" gvimのメニューバー等表示設定は同ディレクトリの.gvimrcに
" 文字コード判別
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
" 改行コード判別
set fileformats=unix,dos,mac
" 文字コード変更
" :setl fenc=文字コード(utf-8,euc-jp,sjis,cp932,iso-2022-jp)
" 改行コード変更
" :setl ff=改行コード(unix,doc,mac)
" 文字コードを指定して開きなおす
" :e ++enc=文字コード
" 改行コードを指定して開きなおす
" :e ++ff=改行コード
" visual_bellとbeep音の無効化
set vb t_vb=
" 行番号(number)の表示
set nu
" スクロール方向への先読み行数
set scrolloff=5
" C言語風インデント
set smartindent
" 上書き保存前の一時ファイルを作成しない
set nowritebackup
" バックアップファイル(faile.name~)を作成しない
set nobackup
" swap(編集前の状態を保存する一時ファイル)を作成しない
set noswapfile
" Enterを押さずとも検索できる
set incsearch
" 検索結果のハイライト
set hlsearch
" 端末vimでのマウス操作をall有効
set mouse=a
" indent:字下げのバックスペース消去
" eol   :行末のバックスペース消去
" start :挿入開始点を超えてバックスペース消去
set backspace=indent,eol,start
" 長い行の折り返し表示無効化
set nowrap
" ステータスラインの行数を指定
set laststatus=2
" スペルチェックを行う
" set spell
" スペルチェックの対象から日本語除外
set spelllang=en,cjk
" コマンドモードでのファイル名をTAB補完
set wildmenu
" 補完モードの変更
set wildmode=longest,full
" カーソルの行頭、行末越え
set whichwrap=b,s,h,l,<,>,[,],~
" 対応する()、{}、[]をハイライト
set showmatch
" 日本語フォントを全角文のスペースにする
set ambiwidth=double
" カーソル行の強調
set cursorline
" 色設定
hi CursorLine cterm=underline ctermfg=NONE ctermbg=black
hi lineNr term=bold cterm=NONE ctermfg=120 ctermbg=NONE
hi CursorLineNr term=bold cterm=NONE ctermfg=111 ctermbg=NONE
" :colorscheme [TAB]で色セット一覧
colorscheme peachpuff
" スキーマ読み込み後に全角スペース強調
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
" タブ文字、行末空白、改行、空白の可視化
set list
set listchars=tab:>-,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
" タブ文字の長さの認識設定
set tabstop=4
" 入力時のタブ長さ
set shiftwidth=4
" タブ文字を空白に変換しない
set noexpandtab
" レジスタ未指定でクリップボードを利用
set clipboard=unnamed,autoselect
" font設定
set guifont=Cascadia_Code:h11
" KEY_MAPPING
" :map	key_map for Normal_mode & Visual_mode
" :nmap	key_map for Normal_mode
" :vmap	key_map for Visual_mode
" :imap	key_map for Insert_mode
" :cmap	key_map for Command_line
" :map!	key_map for Insert_mode & Command_line
" jj等のEscape
inoremap <silent> jj <Esc>
inoremap <silent> jf <Esc>
" ESC時にIMEをオフに
inoremap <ESC> <ESC>:set iminsert=0<CR>
" 現在の行をそのままに次行から入力
inoremap <S-CR> <ESC>o

" ファイル保存時に行末スペースの自動削除
autocmd BufWritePre * :%s/\s\+$//ge
" カーソル直下の単語を全ハイライト
nnoremap h h:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>:echo expand('<cword>')<CR>
nnoremap j j:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>:echo expand('<cword>')<CR>
nnoremap k k:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>:echo expand('<cword>')<CR>
nnoremap l l:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>:echo expand('<cword>')<CR>
" VIMRCの別枠編集
nnoremap <F1> <Esc>:tabnew $MYVIMRC<CR>
" VIMRCの保存&再読み込み
nnoremap <F2> <Esc>:w<CR>:source $MYVIMRC<CR>
" 別枠起動
nnoremap <F3> <ESC>:tabnew<CR>
" 別枠起動&ファイル名指定
nnoremap <S-F3> <ESC>:tabnew<CR>:vi .\
" 画面分割
nnoremap <F4> <ESC>:vs<CR>
" 画面分割$ファイル名指定
nnoremap <S-F4> <ESC>:vs<CR><C-w>w:vi .\
" 別枠起動
nnoremap <F10> <Esc>:tabnew
" タブの左移動
nnoremap <F11> <Esc>gT<CR>
" タブの右移動
nnoremap <F12> <Esc>gt<CR>
" ハイライト解除
nnoremap <ESC><ESC> :nohlsearch<CR>
" 分割タブの移動
nnoremap <S-TAB> <ESC><C-w>w
" 分割タブの逆移動
nnoremap m <ESC><C-w>W
" 分割タブの移動
nnoremap , <ESC><C-w>w
" タブの左移動
nnoremap <S-m> <ESC>gT
" タブの右移動
nnoremap < <ESC>gt
" コマンドプロンプト起動
nnoremap CMD :bo term<CR>
" 現在のファイルのパス表示
nnoremap PATH <ESC>:echo expand("%:p")<CR>
nmap <Tab> gt
" カーソル直下の単語を全置換
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
" シンタックス
syntax on

" コンパイル（未使用）
nnoremap <F8> :!gcc -o
noremap <C-s> :w<CR>
au BufEnter * execute ":lcd " . expand("%:p:h")
command! Gcc call s:Gcc()
nmap <F8> <ESC>:w<CR>:Gcc<CR>

source $VIMRUNTIME/mswin.vim
nmap + :let &guifont = substitute(&guifont, ‘\d\+$’, ‘\=submatch(0)+1’, ”)<CR>
nmap – :let &guifont = substitute(&guifont, ‘\d\+$’, ‘\=submatch(0)-1’, ”)<CR>
function! s:Gcc()
	w:
		:!clear
		:!gcc % -o %.exe
		:!%.exe
		:!pause
		endfunction

"*****************************************************************************************
" 補完関数実装( https://original-game.com/how-to-make-a-complementary-function-of-vim/4/ )
"*****************************************************************************************
" 全角スペースのハイライト表示
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=#ffaa77
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme       * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif

"カーソルの次の文字列を取得（引数は取得したい文字数）
function! GetNextString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = l:str.getline(".")[col(".")-1+i]
	endfor
	return l:str
endfunction

"カーソルの前の文字列を取得（引数は取得したい文字数）
function! GetPrevString(length) abort
	let l:str = ""
	for i in range(0, a:length-1)
		let l:str = getline(".")[col(".")-2-i].l:str
	endfor
	return l:str
endfunction

"アルファベットかどうかを取得
function! IsAlphabet(char) abort
	let l:charIsAlphabet = (a:char =~ "\a")
	return (l:charIsAlphabet)
endfunction

"全角かどうかを取得
function! IsFullWidth(char) abort
	let l:charIsFullWidth = (a:char =~ "[^\x01-\x7E]")
	return (l:charIsFullWidth)
endfunction

"数字かどうかを取得
function! IsNum(char) abort
	let l:charIsNum = (a:char >= "0" && a:char <= "9")
	return (l:charIsNum)
endfunction

"括弧の中にいるかどうかを取得
function IsInsideParentheses(prevChar,nextChar) abort
	let l:cursorIsInsideParentheses1 = (a:prevChar == "{" && a:nextChar == "}")
	let l:cursorIsInsideParentheses2 = (a:prevChar == "[" && a:nextChar == "]")
	let l:cursorIsInsideParentheses3 = (a:prevChar == "(" && a:nextChar == ")")
	return (l:cursorIsInsideParentheses1 || l:cursorIsInsideParentheses2 || l:cursorIsInsideParentheses3)
endfunction

" 括弧の補完
function! InputParentheses(parenthesis) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:parentheses = { "{": "}", "[": "]", "(": ")" }

	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsCloseParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
	let l:nextCharIsSpace = (l:nextChar == " ")

	if l:nextCharIsEmpty || l:nextCharIsCloseParenthesis || l:nextCharIsSpace
		return a:parenthesis.l:parentheses[a:parenthesis]."\<LEFT>"
	else
		return a:parenthesis
	endif
endfunction
inoremap <expr> { InputParentheses("{")
inoremap <expr> [ InputParentheses("[")
inoremap <expr> ( InputParentheses("(")

"閉じ括弧の逆補完
function! InputCloseParenthesis(parenthesis) abort
	let l:nextChar = GetNextString(1)
	if l:nextChar == a:parenthesis
		return "\<RIGHT>"
	else
		return a:parenthesis
	endif
endfunction
inoremap <expr> } InputCloseParenthesis("}")
inoremap <expr> ] InputCloseParenthesis("]")
inoremap <expr> ) InputCloseParenthesis(")")

" クォーテーションの補完
"クォーテーションの入力
function! InputQuot(quot) abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)

	let l:cursorIsInsideQuotes = (l:prevChar == a:quot && l:nextChar == a:quot)
	let l:nextCharIsEmpty = (l:nextChar == "")
	let l:nextCharIsClosingParenthesis = (l:nextChar == "}" || l:nextChar == "]" || l:nextChar == ")")
	let l:nextCharIsSpace = (l:nextChar == " ")
	let l:prevCharIsAlphabet = IsAlphabet(l:prevChar)
	let l:prevCharIsFullWidth = IsFullWidth(l:prevChar)
	let l:prevCharIsNum = IsNum(l:prevChar)
	let l:prevCharIsQuot = (l:prevChar == "\'" || l:prevChar == "\"" || l:prevChar == "\`")

	if l:cursorIsInsideQuotes
		return "\<RIGHT>"
	elseif l:prevCharIsAlphabet || l:prevCharIsNum || l:prevCharIsFullWidth || l:prevCharIsQuot
		return a:quot
	elseif l:nextCharIsEmpty || l:nextCharIsClosingParenthesis || l:nextCharIsSpace
		return a:quot.a:quot."\<LEFT>"
	else
		return a:quot
	endif
endfunction
inoremap <expr> ' InputQuot("\'")
inoremap <expr> " InputQuot("\"")
inoremap <expr> ` InputQuot("\`")

" 括弧内改行時のインデント調整
"改行の入力
function! InputCR() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	if l:cursorIsInsideParentheses
		return "\<CR>\<ESC>\<S-o>"
	else
		return "\<CR>"
	endif
endfunction
inoremap <expr> <CR> InputCR()

" 括弧内スペースの補完
function! InputSpace() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	if l:cursorIsInsideParentheses
		return "\<Space>\<Space>\<LEFT>"
	else
		return "\<Space>"
	endif
endfunction
inoremap <expr> <Space> InputSpace()

" 括弧内スペース削除の逆補完
function! InputBS() abort
	let l:nextChar = GetNextString(1)
	let l:prevChar = GetPrevString(1)
	let l:nextTwoString = GetNextString(2)
	let l:prevTwoString = GetPrevString(2)

	let l:cursorIsInsideParentheses = IsInsideParentheses(l:prevChar,l:nextChar)

	let l:cursorIsInsideSpace1 = (l:prevTwoString == "{ " && l:nextTwoString == " }")
	let l:cursorIsInsideSpace2 = (l:prevTwoString == "[ " && l:nextTwoString == " ]")
	let l:cursorIsInsideSpace3 = (l:prevTwoString == "( " && l:nextTwoString == " )")
	let l:cursorIsInsideSpace = (l:cursorIsInsideSpace1 || l:cursorIsInsideSpace2 || l:cursorIsInsideSpace3)

	let l:existsQuot = (l:prevChar == "'" && l:nextChar == "'")
	let l:existsDoubleQuot = (l:prevChar == "\"" && l:nextChar == "\"")

	if l:cursorIsInsideParentheses || l:cursorIsInsideSpace || l:existsQuot || l:existsDoubleQuot
		return "\<BS>\<RIGHT>\<BS>"
	else
		return "\<BS>"
	endif
endfunction
inoremap <expr> <BS> InputBS()

" 挟み括弧
function! ClipInParentheses(parenthesis) abort
	let l:mode = mode()
	let l:parentheses = { "{": "}", "[": "]", "(": ")" }
	if l:mode ==# "v"
		return "\"ac".a:parenthesis."\<ESC>\"agpi".l:parentheses[a:parenthesis]
	elseif l:mode ==# "V"
		return "\"ac".l:parentheses[a:parenthesis]."\<ESC>\"aPi".a:parenthesis."\<CR>\<ESC>\<UP>=%"
	endif
endfunction
xnoremap <expr> { ClipInParentheses("{")
xnoremap <expr> [ ClipInParentheses("[")
xnoremap <expr> ( ClipInParentheses("(")

" 挟みクォーテーション
function! ClipInQuot(quot) abort
	let l:mode = mode()
	if l:mode ==# "v"
		return "\"ac".a:quot."\<ESC>\"agpi".a:quot
	endif
endfunction
xnoremap <expr> ' ClipInQuot("\'")
xnoremap <expr> " ClipInQuot("\"")
xnoremap <expr> ` ClipInQuot("\`")

