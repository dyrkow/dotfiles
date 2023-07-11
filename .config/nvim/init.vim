"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                         "
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                   "
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                   "
"               ██║   ██║██║██╔████╔██║██████╔╝██║                        "
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                        "
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                   "
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                   "
"                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"---------------------------------- BASE ---------------------------------"

syntax on
syntax sync minlines=256

" set colorcolumn=150
set autoindent
set background=dark
set clipboard+=unnamedplus
set clipboard=unnamed
set cmdheight=2
set cursorline
set encoding=UTF-8
set expandtab
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set guifont=Anonymice\ Nerd\ Font\ Complete\ Mono:h14
set hidden
set history=500
set ic
set ignorecase
set lazyredraw
set linespace=3
set list
set listchars=tab:‣\ ,trail:•,precedes:«,extends:»
set mousehide
set nobackup
set nocompatible
set noerrorbells
set nofoldenable
set nohlsearch
set noswapfile
set nowrap
set nowritebackup
set number
set ruler
set scrolloff=20
set shiftwidth=4
set shortmess+=c
set smartcase
set softtabstop=0
set splitbelow
set splitright
set synmaxcol=512
" set tabstop=4
set ttyfast
set updatetime=300
set visualbell

"-------------------------------- PLUGINS --------------------------------"

call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
" Plug 'editorconfig/editorconfig-vim'
Plug 'gpanders/editorconfig.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'noahfrederick/vim-hemisu'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'wellle/targets.vim'
Plug 'yggdroot/indentline'

" Install :CocInstall coc-docker coc-css coc-html coc-json coc-tsserver coc-eslint coc-emmet coc-highlight coc-stylelint coc-xml coc-prettier
" coc lint - додуматься как линтить файл
" https://github.com/yuki-yano/fzf-preview.vim#demo

call plug#end()

"-------------------------------- KEY MAP --------------------------------"

let mapleader = "\<Space>"

" Navigate between buffers
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

"---------------------------- PLUGIN SETTINGS ----------------------------"

colorscheme hemisu

let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ' '
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'∘',
                \ 'Staged'    :'✹',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'⁖',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'
autocmd BufWritePost * GitGutter

let g:airline_theme='minimalist'

" Auto pairs
let g:AutoPairsShortcutFastWrap = '<C-e>'

" COC

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" db ui
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

" Buffergator
let g:buffergator_window_statusline = 1
let g:buffergator_sort_regime = "mru"
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_split_size = 10
let g:buffergator_autoexpand_on_split = 0

"------------------------------ PLUGIN MAP -------------------------------"

map <Leader>n :NERDTreeToggle<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
" command! -nargs=0 Format :call CocActionAsync('runCommand', 'eslint.executeAutofix') # Это используем для форматирования нормально настроенного линтера

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

cnoreabbrev Ack Ack!

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '•'
" let g:ale_sign_warning = '⚠'
" let g:ale_statusline_format=['X %d', '? %d', '']
" let g:ale_echo_msg_format = '%linter%: %s'
" let g:ale_linters = { 'javascript': ['eslint'], 'typescript': ['eslint'], 'typescriptreact': ['eslint'], 'yaml': ['yamllint'] }
" let g:ale_fixers = { 'html': ['prettier'], 'javascript': ['prettier'], 'css': ['prettier'], 'typescript': ['prettier'], 'typescriptreact': ['prettier'], 'json': ['fixjson'], 'yaml': ['yamlfix'] }

" Usability
" Plug 'kien/ctrlp.vim'
" Plug 'mileszs/ack.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'w0rp/ale'
"
" " Interface
" Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'stylus']}
"
" " Git
"
" " Syntax support
" Plug 'editorconfig/editorconfig-vim'
"
" " Color theme
"
"
"
" Show normal colors on terminal
" if (has('termguicolors'))
"   set termguicolors
" endif
"
" filetype plugin indent on
" highlight ColorColumn ctermbg=darkgray
"
"
" " set spell
" set spelllang=ru_ru,en_us
"
"
" let s:filetype_dict = {
"     \ 'c++': 'cpp',
"     \ 'viml': 'vim',
"     \ 'bash': 'sh'
"     \ }
"
" "--------------"
" "   KEY MAPS   "
" "--------------"
"
" nmap go <plug>(quickr_preview)
" nmap gi <plug>(quickr_preview_qf_close)
"
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'md', 'markdown']
"
"
"
" " TERN
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" nmap <Leader>g :TernDef<CR>
" nmap <Leader>r :TernRename<CR>
" nmap <Leader>u :TernRefs<CR>
"
" " Ack, don't open first result automaticly
" cnoreabbrev Ack Ack!
"
" " COC
"
" "---------------------------"
" "   DEPENDENCIES SETTINGS   "
" "---------------------------"
"
"
" " Fugitive
" set diffopt+=vertical
"
" " Gutter
"
" " Airline
" let g:airline_theme='minimalist'
"
"
"
" " Emmet
" let g:user_emmet_leader_key='<Tab>'
"
" " CTRLP
" let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist|build|vendor|assets|coverage|__snapshots__)|(\.(swp|ico|git|svn))$'
" let g:ctrlp_working_path_mode = 'r'
" let g:ctrlp_map = '<Leader>f'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" let g:ctrlp_dotfiles = 0
" let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_root_markers = ['.ctrlp']
"
" " NERDThee git indicators
" let g:NERDTreeGitStatusUseNerdFonts = 1
" let g:NERDTreeGitStatusWithFlags = 1
" let g:NERDTreeGitStatusNodeColorization = 1
"
" let g:NERDTreeIndicatorMapCustom = {
"     \ "Modified"  : "∘",
"     \ "Staged"    : "•",
"     \ "Untracked" : "∘",
"     \ "Dirty"     : "⁖",
"     \ "Clean"     : "✔︎",
"     \ }
"
" let g:NERDTreeColorMapCustom = {
"     \ "Modified"  : "#f8cc7a",
"     \ "Staged"    : "#7fb777",
"     \ "Untracked" : "#e2787b",
"     \ "Dirty"     : "#299999",
"     \ "Clean"     : "#87939A",
"     \ "Ignored"   : "#808080"
"     \ }
"
" let g:WebDevIconsUnicodeGlyphDoubleWidth = 0
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"
"
" " Deoplete
" let g:deoplete#enable_at_startup = 1
"
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
" let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
"
" let g:tern_request_timeout = 1
" let g:tern_request_timeout = 6000
" let g:tern#command = ['tern']
" let g:tern#arguments = [' — persistent']
"
" " vim-dadbod-ui
"
" let g:db_ui_icons = {
"     \ 'expanded': 'L',
"     \ 'collapsed': 'L',
"     \ 'saved_query': '✔︎',
"     \ 'new_query': '+',
"     \ 'tables': '∘',
"     \ 'buffers': '⁖',
"     \ 'connection_ok': '✔︎',
"     \ 'connection_error': '●',
"     \ }
"
" " Spell ignore
" let g:vimtex_syntax_nospell_commands = ['evotor', 'dooglys']

