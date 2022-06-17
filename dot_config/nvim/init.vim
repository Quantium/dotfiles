set number
set mouse=nicr
set cursorline
syntax enable
set showcmd
set encoding=utf-8
set showmatch
set relativenumber

" This fix the issue with vim-plug install
" https://github.com/junegunn/vim-plug/issues/1062
let mapleader =","
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
" End of vim-plug fix

" --------------------------------PLUGINS
call plug#begin('~/.vim/plugged')

" THEME
Plug 'sainnhe/gruvbox-material'
" Plug 'jacoborus/tender.vim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'ms-jpq/coq_nvim'
Plug 'neoclide/coc.nvim'
Plug 'j-hui/fidget.nvim'

" Chezmoi editor (changes . for dot_)
Plug 'alker0/chezmoi.vim'

" Github Copilot
Plug 'github/copilot.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Javascript Snippets
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-snippets'

" Python
Plug 'jupyter-vim/jupyter-vim'
Plug 'untitled-ai/jupyter_ascending.vim'

" Arduino
Plug 'stevearc/vim-arduino'

" Emmet
Plug 'mattn/emmet-vim'

" Comments
Plug 'tpope/vim-commentary'

" Identation indicators
Plug 'Yggdroot/indentLine'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CSV
Plug 'chrisbra/csv.vim'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" Glow
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

" virtualenv
Plug 'jmcantrell/vim-virtualenv'

" tmux line 
Plug 'edkolev/tmuxline.vim'

" vim-fugitive (git)
Plug 'tpope/vim-fugitive'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Hop (navigate between text)
Plug 'phaazon/hop.nvim'

" Telescope
Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim'

" Spellsitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'lewis6991/spellsitter.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
" --------------------------------END PLUGINS

" Mapping

" LSP Configuration
lua << EOF
require("nvim-lsp-installer").setup {}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pyright.setup{}
require'fidget'.setup{}
EOF

" Snippets Configuration
let g:UtilSnipsExpandTrigger="<tab>"

" Emmet Configuration
let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
let g:user_emmet_settings={'javascript':{'extends':'jsx'}}
let g:user_emmet_settings = {
\  'variables': {'lang': 'ja'},
\  'html': {
\    'default_attributes': {
\      'option': {'value': v:null},
\      'textarea': {'id': v:null, 'name': v:null, 'cols': 10, 'rows': 10},
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<title></title>\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}

" prettier configuration
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-D> :Prettier<CR>

" commentary configuration
vnoremap <space> :Commentary<CR>

" Airline Configuration
let g:airline#extensions#tabline#enabled = 1

" CSV Configuration
let g:csv_delim=','
let g:csv_default_delim=','

" Git Gutter Configuration
let g:gitgutter#enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_highlight_lines = 1

" Glow Configuration
let g:glow_binary_path = '/usr/local/bin/'

" Nerdtree Configuration
let NERDTreeQuitOnOpen=1
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" Hop Configuration
lua << EOF
require'hop'.setup()
EOF

" Telescope Configuration
nnoremap <silent> <F3> <CMD>Telescope find_files prompt_prefix=🔍<CR>
nnoremap <silent> <F4> <CMD>Telescope git_files<CR>
nnoremap <silent> <F5> <CMD>Telescope buffers<CR>
nnoremap <silent> <F6> <CMD>Telescope planets<CR>


" Spellsitter Configuration
lua << EOF
require('spellsitter').setup()
EOF
