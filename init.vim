set number
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set fileencoding=utf-8
"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~

if has('persistent_undo')
  set undodir=~/.config/nvim/undo
  set undofile                                                                                                                                   
endif

inoremap <silent> jj <ESC>

colorscheme hybrid

let username = system('$(whoami)')

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif

if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " load the file which contain the plugin list
  let s:toml      = '/home/hiro/dotfile/dein.toml'
  let s:lazy_toml = '/home/hiro/dotfile/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" automatically install any plug-ins that need to be installed.
if dein#check_install()
  call dein#install()
endif

"coc.nvim setting"
let g:coc_global_extensions = [
    \'coc-css',
    \'coc-docker',
    \'coc-git',
    \'coc-html',
    \'coc-json',
    \'coc-phpls',
    \'coc-sql',
    \'coc-toml',
    \'coc-tsserver',
    \'coc-vimlsp',
    \'coc-pyright',
    \'coc-clangd',
  \]

