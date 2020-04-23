" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/vim/dein')
call dein#begin('~/.cache/vim/dein')
call dein#add('Shougo/neoinclude.vim')
call dein#add('Zabanaa/neuromancer.vim')
call dein#add('abudden/EasyColour')
call dein#add('altercation/vim-colors-solarized')
call dein#add('bounceme/base.vim')
call dein#add('crusoexia/vim-dream')
call dein#add('dracula/vim')
call dein#add('dylanaraps/wal.vim')
call dein#add('exitface/synthwave.vim')
call dein#add('farmergreg/vim-lastplace')
call dein#add('fmoralesc/molokayo')
call dein#add('fortes/vim-escuro')
call dein#add('godlygeek/tabular')
call dein#add('gosukiwi/vim-atom-dark')
call dein#add('hzchirs/vim-material')
call dein#add('jacoborus/tender.vim')
call dein#add('jakwings/vim-colors')
call dein#add('junegunn/seoul256.vim')
call dein#add('junegunn/vader.vim')
call dein#add('mhartington/oceanic-next')
call dein#add('morhetz/gruvbox')
call dein#add('nanotech/jellybeans.vim')
call dein#add('nightsense/carbonized')
call dein#add('rakr/vim-one')
call dein#add('rojspencer/vim-colorminder')
call dein#add('tomasiser/vim-code-dark')
call dein#add('tomasr/molokai')
call dein#add('tpope/vim-surround')
call dein#add('veloce/vim-aldmeris')
call dein#add('vim-scripts/industry.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('roxma/nvim-yarp')
call dein#add('roxma/vim-hug-neovim-rpc')
call dein#add('w0rp/ale')
call dein#add('wokalski/autocomplete-flow')
call dein#add('yuttie/hydrangea-vim')
call dein#add('tomasiser/vim-code-dark')
call dein#add('jszakmeister/vim-togglecursor')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('rafi/awesome-vim-colorschemes')
call dein#add('mkarmona/colorsbox')
call dein#add('dracula/vim')
call dein#add('jacoborus/tender.vim')
call dein#add('kyoz/purify')
call dein#add('jszakmeister/vim-togglecursor')
call dein#add('xolox/vim-colorscheme-switcher')
call dein#add('Taverius/vim-colorscheme-manager')
call dein#add('xolox/vim-misc')
call dein#add('joshdick/onedark.vim')
call dein#add('mhartington/oceanic-next')
call dein#add('drewtempelmeyer/palenight.vim')
call dein#add('ayu-theme/ayu-vim')

call dein#add('neomake/neomake')
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
call dein#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })

call dein#add('rakr/vim-one')
call dein#add('mhartington/oceanic-next')
"call dein#add('')
"call dein#add('')
"call dein#add('')
"call dein#add('')
"call dein#add('')
"call dein#add('')
"call dein#add('')
"call dein#add('')
"call dein#add('')
"call dein#add('')
call dein#end()
  call dein#save_state()
endif
if dein#check_install()
 call dein#install()
endif
filetype plugin indent on
syntax enable
autocmd VimEnter * hi Normal ctermbg=none
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
let g:ycm_filetype_blacklist = {
    \ 'tagbar': 1,
    \ 'qf': 1,
    \ 'notes': 1,
    \ 'markdown': 1,
    \ 'unite': 1,
    \ 'text': 1,
    \ 'vimwiki': 1,
    \ 'pandoc': 1,
    \ 'infolog': 1,
    \ 'mail': 1,
    \ 'html': 1,
    \ 'gitconfig': 1,
    \ 'tex': 1,
    \ 'bib': 0,
    \}
" powerline symbols
let g:airline_left_alt_sep = ''
let g:airline_left_sep = ''
"call neomake#configure#automake('nrwi', 1000)
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.readonly = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.whitespace = 'Ξ'
let g:AirlineTheme = 'material'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_detect_paste=1
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts=1
let g:base16colorspace=256
let g:deoplete#enable_at_startup = 1
let g:gruvbox_contrast_dark  = 'hard'
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:deoplete#enable_at_startup = 1
let g:ale_lint_delay = 1000
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:powerline_pycmd = 'py3'
let g:python3_host_prog = '/usr/bin/python'
let g:python_highlight_all = 1
let g:python_host_prog = '/usr/bin/python2.7'
let g:tex_flavor = 'latex'
let g:ycm_max_num_candidates = 25
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_use_ultisnips_completer = 1
let g:PYENV_ROOT = '/root/.pyenv'
" vim: set ft=vim :
set autochdir         " Change directory to the current buffer when opening files.
set autoindent
set autoread          " automatically reread the file if it was changed from the outside without asking first
set background=dark
set backupdir=~/.cache/vim/backup
set cindent
set clipboard=unnamedplus
set colorcolumn=0
set completeopt=menu,menuone,preview
set cpoptions=aAceFs_dB
set cursorline        " highlight current line
set directory=~/.cache
set encoding=utf-8    " usually the case rather than latin1
set expandtab         " tabs are converted into spaces
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

"set fillchars=vert:│,fold:·
set grepprg=grep\ -nH\ $*
"set guicursor=i-ci-ve:ver25-Cursor2/lCursor2i-blinkon10
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175



highlight Cursor gui=reverse guifg=NONE guibg=NONE

set helplang=en
set hidden            " preserve buffers by hiding instead of closing them
set history=1000      " save a much longer history (default 50) of commands and searches
set hlsearch          " high light search results
set ignorecase        " ignore case when searching
set incsearch         " display search results while writing
"set iskeyword=@,48-57,_,192-255,-
"set iskeyword+=-      " Treat dash separated words as word text objects (for ciw etc)
"set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set nolist
set makeprg=makeobj
set matchtime=0
set modeline
set modelines=50
set more
set mouse=nv
set nobackup          " most files are in git anyways
set noerrorbells      " don't beep
set nofoldenable
set nohlsearch
set nonumber
set noreadonly
set norelativenumber
set noshelltemp
set noshowmode        " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set nospell
set noswapfile
set noundofile
set nowritebackup noswf noudf nobackup nowritebackup noswapfile noundofile
set nowritebackup
set pumheight=15
set scrolloff=9       " center coursor
set shiftround        " use multiples of shiftwidth when indenting with '<' and '>'
set shiftwidth=4      " number of spaces used for autoindent, command: <<, >>, == (auto entire doc: gg=G)
set shortmess=filnxtToOsFc
set showcmd           " show command in bottom bar
set showmatch         " highlight matching {[()]}
set showtabline=4     " t
set sidescrolloff=5
set smartcase         " ignore case if search pattern is all lowercase, otherwise case-sensitive
set smartindent
set softtabstop=4     " number of spaces in tab when editing
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.lo,.o,.moc,.la,.closure,.loT
"set tabline=%!SpaceVim#layers#core#tabline#get()
set tabstop=4         " number of visual spaces per tab
set termguicolors
set textwidth=0       " disable automatic word wrapping (newlines)
set title             " change the title of the terminal
"set undodir=~/.cache/vim/undofile
set undolevels=1000   " save more levels of undo
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.class
set wildignorecase
set wildmenu          " visual autocomplete for command menu
set wildmode=list:longest
" let mapleader=','
"let maplocalleader = ','
syntax enable         " enables syntax highlighting

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
let  g:solarized_termcolors= 256
let  g:solarized_termtrans =   0
let    g:solarized_degrade   =   0
let  g:solarized_bold      =   1
let   g:solarized_underline =   1
let    g:solarized_italic    =   1
let  g:solarized_contrast  =  'normal'
let    g:solarized_visibility=  'normal'
nmap <silent> <leader>q :wq $MYVIMRC<CR>

nnoremap ; :

if v:version < 700 || exists('loaded_switchcolor') || &cp
	finish
endif

let loaded_switchcolor = 1

let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 0    " background variants light/dark was not yet switched
let s:swindex = 0

function! SwitchColor(swinc)

	" if have switched background: dark/light
	if (s:swback == 1)
		let s:swback = 0
		let s:swindex += a:swinc
		let i = s:swindex % len(s:swcolors)

		" in skip list
		if (index(s:swskip, s:swcolors[i]) == -1)
			execute "colorscheme " . s:swcolors[i]
		else
			return SwitchColor(a:swinc)
		endif

	else
		let s:swback = 1
		if (&background == "light")
			execute "set background=dark"
		else
			execute "set background=light"
		endif

		" roll back if background is not supported
		if (!exists('g:colors_name'))
			return SwitchColor(a:swinc)
		endif
	endif

	" show current name on screen. :h :echo-redraw
	redraw
	execute "colorscheme"
endfunction

 map <F8>        :call SwitchColor(1)<CR>
imap <F8>   <Esc>:call SwitchColor(1)<CR>

 map <S-F8>      :call SwitchColor(-1)<CR>
imap <S-F8> <Esc>:call SwitchColor(-1)<CR>


" vim: sw=4 sts=4 et
