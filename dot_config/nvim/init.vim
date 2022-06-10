set number
set mouse=a
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

" Github Copilot
Plug 'github/copilot.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Javascript Snippets
Plug 'SirVer/ultisnips'
"Plug 'mlaursen/vim-javascript-snippets'

call plug#end()
" --------------------------------END PLUGINS

" TENDER Material config
colorscheme tender

" LSP Configuration
lua << EOF
require'lspconfig'.tsserver.setup{}
EOF

