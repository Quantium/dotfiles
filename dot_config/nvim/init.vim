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

" GRUVBOX THEME
"Plug 'sainnhe/gruvbox-material'
Plug 'jacoborus/tender.vim'

" LSP (Javscript server)
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim'

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

" Emmet
Plug 'mattn/emmet-vim'

" Comments
Plug 'tpope/vim-commentary'

" Identation
Plug 'Yggdroot/indentLine'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CSV
Plug 'chrisbra/csv.vim'

" Git Gutter
Plug 'airblade/vim-gitgutter'

" virtualenv
Plug 'jmcantrell/vim-virtualenv'

" tmux line
Plug 'edkolev/tmuxline.vim'

" vim-fugitive
Plug 'tpope/vim-fugitive'

" Promtpline
Plug 'edkolev/promptline.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Devicons
Plug 'ryanoasis/vim-devicons'

call plug#end()
" --------------------------------END PLUGINS

" TENDER Material config
colorscheme tender

" LSP Configuration
lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.pyright.setup{}
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

" Nerdtree Configuration
let NERDTreeQuitOnOpen=1
nnoremap <silent> <F2> :NERDTreeToggle<CR>
