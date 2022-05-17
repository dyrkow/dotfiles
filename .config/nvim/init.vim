"------------------"
"   DEPENDENCIES   "
"------------------"

call plug#begin('~/.local/share/nvim/plugged')

" Usability
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim', { 'for': ['php', 'html']}
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'w0rp/ale'
Plug 'liuchengxu/vim-clap'
Plug 'wellle/targets.vim'

" Interface
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'stylus']}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/indentline'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tsony-tsonev/nerdtree-git-plugin'

" Syntax support
Plug 'editorconfig/editorconfig-vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
" Plug 'othree/jsdoc-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'herringtondarkholme/yats.vim'
Plug 'yardnsm/vim-import-cost', { 'do': 'yarn' }

" Color theme
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline-themes'


Plug 'arzg/vim-substrata'

call plug#end()

"----------"
"   BASE   "
"----------"

let mapleader = "\<Space>"

colorscheme iceberg
" colorscheme substrata

" set guifont =Cousine\ Nerd\ Font\ Mono:h12
" set guifont =Anonymous\ Pro:h12
set guifont =Anonymice\ Nerd\ Font\ Complete\ Mono:h12

" Show normal colors on terminal
if (has('termguicolors'))
  set termguicolors
endif

syntax on

filetype plugin indent on
highlight ColorColumn ctermbg=darkgray

set background=dark
set autoindent
set cursorline
set clipboard=unnamed
set colorcolumn=100
set cursorline
set encoding=UTF-8
set expandtab
set history=500
set ic
set ignorecase
set lazyredraw
set linespace=3
set list
set listchars=tab:‣\ ,trail:•,precedes:«,extends:»
set mousehide
set nobackup
set noerrorbells
set nowritebackup
set nohlsearch
set noswapfile
set nowrap
set number
set ruler
set scrolloff=20
set shiftwidth=4
set smartcase
set softtabstop=0
set splitbelow
set splitright
set tabstop=4
set ttyfast
set visualbell

set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set nofoldenable

" For coc plugin
set hidden
set updatetime=300

set spell
set spelllang=ru_ru,en_us

" Copy/Paste to and from clipboard
set clipboard+=unnamedplus

" Large file performance
set synmaxcol=512
syntax sync minlines=256


let s:filetype_dict = {
    \ 'c++': 'cpp',
    \ 'viml': 'vim',
    \ 'bash': 'sh'
    \ }

"--------------"
"   KEY MAPS   "
"--------------"

nmap go <plug>(quickr_preview)
nmap gi <plug>(quickr_preview_qf_close)

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'md', 'markdown']

" NERDTree
map <Leader>n :NERDTreeToggle<CR>

" Navigate between buffers
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Easy motion plugin
" <Leader>f{char} to move to {char}
map  <Leader>c <Plug>(easymotion-bd-f)
nmap <Leader>c <Plug>(easymotion-overwin-f)
"Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
"Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" TERN
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
nmap <Leader>g :TernDef<CR>
nmap <Leader>r :TernRename<CR>
nmap <Leader>u :TernRefs<CR>

" Ack, don't open first result automaticly
cnoreabbrev Ack Ack!

" COC

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"---------------------------"
"   DEPENDENCIES SETTINGS   "
"---------------------------"

"NERDTree
let g:NERDTreeDirArrowExpandable ='L'
let g:NERDTreeDirArrowCollapsible = 'L'

" Fugitive
set diffopt+=vertical

" Gutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
autocmd BufWritePost * GitGutter

" Airline
let g:airline_theme='minimalist'


" Buffergator
let g:buffergator_window_statusline = 1
let g:buffergator_sort_regime = "mru"
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_split_size = 10
let g:buffergator_autoexpand_on_split = 0

" Auto pairs
let g:AutoPairsShortcutFastWrap = '<C-e>'

" Emmet
let g:user_emmet_leader_key='<Tab>'

" CTRLP
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist|build|vendor|assets|coverage|__snapshots__)|(\.(swp|ico|git|svn))$'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_map = '<Leader>f'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_dotfiles = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_root_markers = ['.ctrlp']

" NERDThee git indicators
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "∘",
    \ "Staged"    : "•",
    \ "Untracked" : "∘",
    \ "Dirty"     : "⁖",
    \ "Clean"     : "✔︎",
    \ }
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 0
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Modified"  : "#f8cc7a",
    \ "Staged"    : "#7fb777",
    \ "Untracked" : "#e2787b",
    \ "Dirty"     : "#299999",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }

" ALE
" 1. eslint --init
" let g:ale_lint_on_text_changed = 'never' "check when save file
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_statusline_format=['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['eslint'], 'typescriptreact': ['eslint'] }
let g:ale_fixers = { 'html': ['prettier'], 'javascript': ['prettier'], 'css': ['prettier'], 'typescript': ['prettier'], 'typescriptreact': ['prettier'], 'json': ['fixjson'] }

" Deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ['tern']
let g:tern#arguments = [' — persistent']

" vim-dadbod-ui

let g:db_ui_icons = {
    \ 'expanded': 'L',
    \ 'collapsed': 'L',
    \ 'saved_query': '✔︎',
    \ 'new_query': '+',
    \ 'tables': '∘',
    \ 'buffers': '⁖',
    \ 'connection_ok': '✔︎',
    \ 'connection_error': '●',
    \ }


" Spell ignore
let g:vimtex_syntax_nospell_commands = ['evotor', 'dooglys']
