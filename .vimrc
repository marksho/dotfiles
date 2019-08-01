if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

" GENERAL SETTINGS
set nocompatible " vim, not vi
syntax enable " syntax highlighting
filetype plugin indent on " recognize filetypes and load rel' plugins

set showcmd " display incomplete commands
set incsearch " do incremental searching
set history=200 " how many : commands to save in history
set autowrite " automatically :write before running commands
set ignorecase " ignore cases in searches
set smartcase " use case sensitive if capital letter present or \C
set magic " use 'magic' patterns (extended regular expressions)
" set noshowmode " don't show mode
set foldmethod=manual " set folds by syntax of current language
set iskeyword+=- "treat dash separated words as a word text object
set path+=**
set wildchar=<TAB>
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " enable wildmenu
set wildmode=list:longest,list:full " configure wildmenu
set tags=tags
set number
set numberwidth=1
set relativenumber
set list " show invisible characters
" set listchars=eol:¬,extends:…,precedes:…,space:·,tab:\ \
" set listchars=tab:»·,trail:·,nbsp:·,space:·,eol:¬,tab:\ \
set listchars=eol:¬,tab:\ \
set laststatus=2 " always display the status line
set mouse=a " enable mouse
set backspace=2 " backspace deletes like most programs in insert mode
set complete-=t " remove tag completion
set noerrorbells " disable error bells
set cursorline " highlight current line

set ttyfast " make scrolling faster
set lazyredraw " make scrolling faster

set clipboard=unnamed " copy and paste to system clipboard

" TABS VS. SPACES
set tabstop=4 " show existing tab with 4 spaces width
set softtabstop=4 " backspace through spaces
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " on pressing tab, insert 4 spaces

" COLOR SCHEME
set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
" set term=xterm-256color
set term=xterm-color
set background=dark " dark background
" set termguicolors " enable true colors
set t_Co=256

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Open new split panes to right and bottom
set splitbelow
set splitright

" KEY MAPPINGS
map <C-n> :NERDTreeToggle<CR>

" PLUGINS
call plug#begin('~/.vim/plugged')

" color schemes
Plug 'junegunn/seoul256.vim'
Plug 'nerdypepper/agila.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'joshdick/onedark.vim'

" misc plugins
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

" syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cespare/vim-toml'
Plug 'sheerun/vim-polyglot'

" autocompletion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" expands abbreviations
Plug 'mattn/emmet-vim'

" file type configuration
Plug 'editorconfig/editorconfig-vim'

" vimwiki
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" fzf
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
call plug#end()

" indentLine settings
let g:indentLine_char='¦'
let g:indentLine_concealcursor = 'vc' " unconceal when cursor is on the same line

" tex conceal settings
set conceallevel=2
let g:tex_conceal="abdgm" " change text conceal level

" COLOR SCHEME
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
colorscheme onedark
" unlet! g:indentLine_color_term g:indentLine_color_gui
" hi Conceal ctermfg=245
" hi Conceal guifg=#abb2bf
let g:seoul256_background=235
let base16colorspace=256

" FZF settings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'down': '~40%' }

" emmet settings
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

" NETRW FILE BROWSING
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NERDTree settings
let NERDTreeQuitOnOpen=1
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]

" status line settings
function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guibg=magenta
    elseif a:mode == 'r'
        hi statusline guibg=blue
    else
        hi statusline guibg=red
    endif
endfunction

" au InsertEnter * call InsertStatuslineColor(v:insertmode)
" au InsertChange * call InsertStatuslineColor(v:insertmode)
" au InsertLeave * hi statusline guibg=green

" default statusline
" hi statusline guibg=green

" set statusline=
" set statusline+=\ %f

