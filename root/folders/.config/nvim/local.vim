

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/vim/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/vim/dein')
call dein#begin('~/.cache/vim/dein')
call dein#add('Shougo/neoinclude.vim')
"call dein#add('Valloric/YouCompleteMe')
call dein#add('Zabanaa/neuromancer.vim')
call dein#add('abudden/EasyColour')
call dein#add('altercation/vim-colors-solarized')
call dein#add('autozimu/LanguageClient-neovim', { 'build': 'bash install.sh' })
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
call dein#add('w0rp/ale')
call dein#add('wokalski/autocomplete-flow')
call dein#add('yuttie/hydrangea-vim')
call dein#add('tomasiser/vim-code-dark')
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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:AirlineTheme = 'codedark'
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

" vim: set ft=vim :
set autochdir
set autochdir         " Change directory to the current buffer when opening files.
set autoindent
set autoread          " automatically reread the file if it was changed from the outside without asking first
set background=dark
set backupdir=~/.cache/SpaceVim/backup
set cindent
set clipboard=unnamedplus " Copy & Paste with the system clipboard (the * register), no need to use the "* prefix when pasting or copying
set colorcolumn=0
set completeopt=menuone
set cpoptions=aAceFs_dB
set cursorline        " highlight current line
set directory=~/.cache/SpaceVim/swap
set encoding=utf-8    " usually the case rather than latin1
set expandtab         " tabs are converted into spaces
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fillchars=vert:│,fold:·
set grepprg=grep\ -nH\ $*
set guicursor=n-v-c:block-blinkon10,i-ci-ve:ver25-blinkon10,r-cr:hor20,o:hor50
set guioptions=
set helplang=en
set hidden            " preserve buffers by hiding instead of closing them
set history=1000      " save a much longer history (default 50) of commands and searches
set hlsearch          " high light search results
set ignorecase
set ignorecase        " ignore case when searching
set incsearch         " display search results while writing
set iskeyword+=-      " Treat dash separated words as word text objects (for ciw etc)
set iskeyword=@,48-57,_,192-255,-
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set makeprg=makeobj
set matchtime=0
set modeline
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
set nowb noswf noudf nobackup nowritebackup noswapfile noundofile
set nowritebackup
set path=.,/usr/include,/usr/local/include,,,
set pumheight=15
set scrolloff=9       " center coursor
set shada='10,\"100,:20,%,n~/.viminfo
set shiftround        " use multiples of shiftwidth when indenting with '<' and '>'
set shiftwidth=4      " number of spaces used for autoindent, command: <<, >>, == (auto entire doc: gg=G)
set shortmess=filnxtToOsFc
set showcmd           " show command in bottom bar
set showmatch
set showmatch         " highlight matching {[()]}
set showtabline=4     " t
set sidescrolloff=5
set smartcase         " ignore case if search pattern is all lowercase, otherwise case-sensitive
set smartindent
set softtabstop=4     " number of spaces in tab when editing
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.lo,.o,.moc,.la,.closure,.loT
set tabline=%!SpaceVim#layers#core#tabline#get()
set tabstop=4
set tabstop=4         " number of visual spaces per tab
set termguicolors
set textwidth=0       " disable automatic word wrapping (newlines)
set title             " change the title of the terminal
set ttyfast           " faster redraws
set undodir=~/.cache/SpaceVim/undofile
set undolevels=1000   " save more levels of undo
set viminfo='10,\"100,:20,%,n~/.viminfo
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.class
set wildignorecase
set wildmenu          " visual autocomplete for command menu
set wildmode=list,full
set window=57
syntax enable         " enables syntax highlighting
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo


if (empty($TMUX))
  if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has('termguicolors'))
  endif
endif
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
let mapleader=','
nmap <silent> <leader>q :wq $MYVIMRC<CR>

nnoremap ; :


if v:version < 700 || exists('loaded_switchcolor') || &compatible
	finish
endif

let loaded_switchcolor = 1
let g:colorminder_scheme_default_gui = 'hybrid'
let g:colorminder_scheme_default_term = 'jellybeans'
let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
let s:swback = 1    " background variants light/dark was not yet switched
let s:swindex = 0

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

function! SwitchColor(swinc)

	" if have switched background: dark/light
	if (s:swback == 1)
		let s:swback = 0
		let s:swindex += a:swinc
		let i = s:swindex % len(s:swcolors)

		" in skip list
		if (index(s:swskip, s:swcolors[i]) == -1)
			execute 'colorscheme ' . s:swcolors[i]
		else
			return SwitchColor(a:swinc)
		endif

	else
		let s:swback = 1
		if (&background == "light")
			execute 'set background=dark'
		else
			execute 'set background=light'
		endif

		" roll back if background is not supported
		if (!exists('g:colors_name'))
			return SwitchColor(a:swinc)
		endif
	endif

	" show current name on screen. :h :echo-redraw
	redraw
	execute 'colorscheme'
endfunction

 map <F8>        :call SwitchColor(1)<CR>
imap <F8>   <Esc>:call SwitchColor(1)<CR>

 map <F7>      :call SwitchColor(-1)<CR>
imap <F7> <Esc>:call SwitchColor(-1)<CR>
" To use this file, add this line to your ~/.vimrc:, w/o the dquote
" source /path/to/kde/sources/kdesdk/scripts/kde-devel-vim.vim
"
" For CreateChangeLogEntry() : If you don't want to re-enter your
" Name/Email in each vim session then make sure to have the viminfo
" option enabled in your ~/.vimrc, with the '!' flag, enabling persistent
" storage of global variables. Something along the line of
" set   viminfo=%,!,'50,\"100,:100,n~/.viminfo
" should do the trick.
"
" To make use of the ,ll and ,lg shortcuts you need to have the files
" GPLHEADER and LGPLHEADER in your home directory. Their content will be
" copied as license header then.

" Don't include these in filename completions
set suffixes+=.lo,.o,.moc,.la,.closure,.loT

" Search for headers here
set path=.,/usr/include,/usr/local/include,
if $QTDIR != ''
    let &path = &path . $QTDIR . '/include/,'
    let &path = &path . $QTDIR . '/include/Qt/,'
    let &path = &path . $QTDIR . '/include/QtCore/,'
    let &path = &path . $QTDIR . '/include/Qt3Support/,'
    let &path = &path . $QTDIR . '/include/QtAssistant/,'
    let &path = &path . $QTDIR . '/include/QtDBus/,'
    let &path = &path . $QTDIR . '/include/QtDesigner/,'
    let &path = &path . $QTDIR . '/include/QtGui/,'
    let &path = &path . $QTDIR . '/include/QtNetwork/,'
    let &path = &path . $QTDIR . '/include/QtOpenGL/,'
    let &path = &path . $QTDIR . '/include/QtSql/,'
    let &path = &path . $QTDIR . '/include/QtSvg/,'
    let &path = &path . $QTDIR . '/include/QtTest/,'
    let &path = &path . $QTDIR . '/include/QtUiTools/,'
    let &path = &path . $QTDIR . '/include/QtXml/,'
endif
if $KDEDIR != ''
    let &path = &path . $KDEDIR . '/include/,'
endif
if $KDEDIRS != ''
    let &path = &path . substitute( $KDEDIRS, '\(:\|$\)', '/include,', 'g' )
endif
set path+=,

" Use makeobj to build
set mp=makeobj

" If TagList is Loaded then get a funny statusline
" Only works if kde-devel-vim.vim is loaded after taglist.
" Droping this script in ~/.vim/plugin works fine
if exists('loaded_taglist')
    let Tlist_Process_File_Always=1
    set statusline=%<%f:[\ %{Tlist_Get_Tag_Prototype_By_Line()}\ ]\ %h%m%r%=%-14.(%l,%c%V%)\ %P
endif

" Insert tab character in whitespace-only lines, complete otherwise
inoremap <Tab> <C-R>=SmartTab()<CR>

if !exists("DisableSmartParens")
" Insert a space after ( or [ and before ] or ) unless preceded by a matching
" paren/bracket or space or inside a string or comment. Comments are only
" recognized as such if they start on the current line :-(
inoremap ( <C-R>=SmartParens( '(' )<CR>
inoremap [ <C-R>=SmartParens( '[' )<CR>
inoremap ] <C-R>=SmartParens( ']', '[' )<CR>
inoremap ) <C-R>=SmartParens( ')', '(' )<CR>
endif

" Insert an #include statement for the current/last symbol
inoremap <F5> <C-O>:call AddHeader()<CR>

" Insert a forward declaration for the current/last symbol
inoremap <S-F5> <C-O>:call AddForward()<CR>

" Switch between header and implementation files on ,h
nmap <silent> ,h :call SwitchHeaderImpl()<CR>
nmap <silent> ,p :call SwitchPrivateHeaderImpl()<CR>

" Comment selected lines on ,c in visual mode
vmap ,c :s,^,//X ,<CR>:noh<CR>
" Uncomment selected lines on ,u in visual mode
vmap ,u :s,^//X ,,<CR>

" Insert an include guard based on the file name on ,i
nmap ,i :call IncludeGuard()<CR>

" Insert license headers at the top of the file
nmap ,lg :call LicenseHeader( "GPL" )<CR>
nmap ,ll :call LicenseHeader( "LGPL" )<CR>
nmap ,lm :call LicenseHeader( "MIT" )<CR>

" Expand #i to #include <.h> or #include ".h". The latter is chosen
" if the character typed after #i is a dquote
" If the character is > #include <> is inserted (standard C++ headers w/o .h)
iab #i <C-R>=SmartInclude()<CR>

" Insert a stripped down CVS diff
iab DIFF <Esc>:call RunDiff()<CR>

" mark 'misplaced' tab characters
"""""set listchars=tab:?\ ,trail:?
set list

set incsearch

function! SetCodingStyle()
    if &syntax == 'cmake'
        call SmartParensOff()
        set sw=3
        set ts=3
        set et
        set tw=0
        return
    endif
    if ( &syntax !~ '^\(c\|cpp\|java\)$' )
        return
    endif
    "the path for the file
    let pathfn = expand( '%:p:h' )
    if pathfn =~ 'nmm'
        call SmartParensOff()
        inoremap ( <C-R>=SpaceBetweenKeywordAndParens()<CR>
        let g:need_brace_on_next_line = '\<\(class\|namespace\|struct\)\>'
        let g:need_brace_on_same_line = '\<\(if\|else\|while\|switch\|do\|enum\|for\|try\|catch\)\>'
        set sw=4
        set ts=4
        set noet
        set tw=100
    elseif pathfn =~ 'xine-lib'
        call SmartParensOff()
        let g:need_brace_on_next_line = '\<\(class\|namespace\|struct\)\>'
        let g:need_brace_on_same_line = '\<\(if\|else\|while\|switch\|do\|foreach\|forever\|enum\|for\|try\|catch\)\>'
        set sw=2
        set sts=2
        set ts=8
        set noet
        "set tw=100
    elseif pathfn =~ 'kdemultimedia\/juk'
        call SmartParensOff()
        let g:need_brace_on_next_line = '\<\(class\|namespace\|struct\|if\|else\|while\|switch\|do\|foreach\|forever\|enum\|for\|try\|catch\)\>'
        let g:need_brace_on_same_line = ''
        set sw=4
        set sts=4
        set et
        "set tw=100
    elseif pathfn =~ 'kdenetwork\/kopete'
        call SmartParensOff()
        let g:need_brace_on_next_line = '\<\(class\|namespace\|struct\|if\|else\|while\|switch\|do\|foreach\|forever\|enum\|for\|try\|catch\)\>'
        let g:need_brace_on_same_line = ''
        set sw=4
        set sts=4
        set noet
        "set tw=100
    else   " kdelibs/kf5/qt coding style
        call SmartParensOff()
        inoremap ( <C-R>=SpaceBetweenKeywordAndParens()<CR>
        let g:need_brace_on_next_line = '\<\(class\|namespace\|struct\)\>'
        let g:need_brace_on_same_line = '\<\(if\|else\|while\|switch\|do\|foreach\|forever\|enum\|for\|try\|catch\)\>'
        set sw=4
        set sts=4
        set et
        "set tw=100
    endif
    if ( !exists("g:noautobrace") )
        call EnableSmartLineBreak()
    endif
endfunction

function! DisableSmartLineBreak()
    iunmap <CR>
    iuna else
endfunction
function! EnableSmartLineBreak()
    if exists("*pumvisible")
        inoremap <CR> <C-R>=pumvisible() ? "\<lt>CR>" : "\<lt>ESC>:call SmartLineBreak()\<lt>CR>a\<lt>CR>"<CR>
    else
        inoremap <CR> <ESC>:call SmartLineBreak()<CR>a<CR>
    endif
    iab else <C-R>=SmartElse()<CR>
endfunction

function! SmartElse()
    "let next = nr2char( getchar( 0 ) )
    let prefix = ''
    if strlen(g:need_brace_on_same_line) > 0 && 'else' =~ g:need_brace_on_same_line
        if getline('.') =~ '^\s*$'
            if getline(line('.') - 1) =~ '}$'
                let prefix = prefix . "\<ESC>kmMjdd`MA "
            elseif getline(line('.') - 1) =~ '}\s*$'
                let prefix = prefix . "\<ESC>kmMjdd`MA"
            endif
        endif
    endif
    return prefix . "else\<Right>"
endfunction

" automatic indenting is required for SmartLineBreak to work correctly
filetype indent on

function! CreateMatchLine()
    let linenum = line( '.' )
    let current_line = getline( linenum )
    " don't do magic if the cursor isn't at the end of the line or if it's
    " inside a // comment
    if col( '.' ) != strlen( current_line ) || match( current_line, '//' ) >= 0
        return ''
    endif
    " remove whitespace at the end
    if match( current_line, '\s\+$' ) >= 0
        :execute ':s/\s*$//'
        " the following is needed if return '' is called
        :execute "normal $"
    endif
    let current_line = getline( linenum )
    " remove all /* */ comments
    let current_line = substitute( current_line, '/\*.\{-}\*/', '', 'g' )
    " remove all strings
    let current_line = substitute( current_line, "'[^']*'", '', 'g' )
    let current_line = substitute( current_line, '"\(\\"\|[^"]\)*"', '', 'g' )
    " remove all ( )
    while current_line =~ '(.*)'
        let current_line = substitute( current_line, '([^()]*)', '', 'g' )
    endwhile
    " prepend earlier lines until we find a ; or {
    while linenum > 1 && current_line !~ ';' && current_line !~ '{.\+$'
        let linenum = linenum - 1
        let prev_line = getline(linenum)
        if synIDattr(synID(linenum, 1, 1), "name") == 'cComment' "inside a /* */ comment at the beginning of the line
            if stridx(prev_line, '*/') == -1
                " next line please
                let prev_line = ''
            else
                " remove everything before */
                let prev_line = substitute(prev_line, '^.*\*/', '*/', '')
            endif
        endif
        " remove // comment
        let prev_line = substitute(prev_line, '//.*$', '', '' )
        " concatenate the lines with a space in between
        let current_line = prev_line.' '.current_line
        " remove all /* */ comments
        let current_line = substitute( current_line, '/\*.\{-}\*/', '', 'g' )
        " remove all strings
        let current_line = substitute( current_line, "'[^']*'", '', 'g' )
        let current_line = substitute( current_line, '"\(\\"\|[^"]\)*"', '', 'g' )
        " remove all ( )
        while current_line =~ '(.*)'
            let current_line = substitute( current_line, '([^()]*)', '', 'g' )
        endwhile
    endwhile
    " remove everything until the last ;
    let current_line = substitute( current_line, '^.*;', '', '' )
    " remove everything until the last { which is not at the end of the line
    let current_line = substitute( current_line, '^.*{\(.\+\)$', '\1', '' )
    " remove all [ ]
    while current_line =~ '\[.*\]'
        let current_line = substitute( current_line, '\[[^\[\]]*\]', '', 'g' )
    endwhile
    " if <CR> was pressed inside ( ), [ ] or /* */ don't add braces
    if current_line =~ '[(\[]' || current_line =~ '/\*'
        return ''
    endif
    return current_line
endfunction

function! AddClosingBrace(current_line)
    if a:current_line =~ '\<enum\|class\|struct\>'
        :execute "normal o};\<ESC>k"
    elseif a:current_line =~ '\<namespace\>'
        let namespace = substitute( a:current_line, '^.*namespace\s\+', '', '' )
        let namespace = substitute( namespace, '\s.*$', '', '' )
        :execute "normal o} // namespace " . namespace . "\<ESC>k"
    else
        :execute "normal o}\<ESC>k"
    endif
endfunction

function! SmartLineBreak()
    if synIDattr(synID(line("."), col("."), 1), "name") == 'cComment' "inside a /* */ comment at the point where the line break occurs
        return
    endif
    let match_line = CreateMatchLine()
    if match_line == ''
        return
    endif

    let match_position1 = -1
    let match_position2 = -1
    if strlen(g:need_brace_on_same_line) > 0
        let match_position1 = match(match_line, g:need_brace_on_same_line)
        if match_position1 > 0
            while strpart(match_line, match_position1 - 1, 1) == '#'
                let old_position = match_position1
                let match_position1 = match(match_line, g:need_brace_on_same_line, match_position1 + 1)
                if match_position1 == -1
                    if strpart(match_line, old_position, 2) == 'if'
                        :execute "normal o#endif\<ESC>k$"
                    endif
                    return
                endif
            endwhile
        endif
    endif
    if strlen(g:need_brace_on_next_line) > 0 && match_position1 == -1
        let match_position2 = match(match_line, g:need_brace_on_next_line)
        if match_position2 > 0
            while strpart(match_line, match_position2 - 1, 1) == '#'
                let old_position = match_position2
                let match_position2 = match(match_line, g:need_brace_on_same_line, match_position2 + 1)
                if match_position2 == -1
                    if strpart(match_line, old_position, 2) == 'if'
                        :execute "normal o#endif\<ESC>k$"
                    endif
                    return
                endif
            endwhile
        endif
    endif

    if match_position1 > -1
        if match_line =~ '}\s*else\>'
            " make sure else is on the same line as the closing brace
            if getline('.') =~ '^\s*else'
                if getline(line('.') - 1) =~ '}$'
                    :execute "normal kA \<ESC>J"
                elseif getline(line('.') - 1) =~ '}\s*$'
                    :execute "normal kJ"
                endif
            endif
        endif
        while getline('.') =~ '^\s*{$'
            " opening brace is on its own line: move it up
            :execute "normal kJ"
        endwhile
        if match_line =~ '{$'
            if getline('.') =~ '[^ ]{$'
                :execute ':s/{$/ {/'
            endif
        else
            :execute ':s/$/ {/'
        endif
        call AddClosingBrace(match_line)
    elseif getline('.') =~ '^\s*{$'
        call AddClosingBrace('')
    elseif match_position2 > -1
        if match_line =~ '{$'
            :execute ':s/\s*{$//'
        endif
        :execute "normal o{"
        call AddClosingBrace(match_line)
    endif
    :execute "normal $"
endfunction

function! SmartParensOn()
    inoremap ( <C-R>=SmartParens( '(' )<CR>
    inoremap [ <C-R>=SmartParens( '[' )<CR>
    inoremap ] <C-R>=SmartParens( ']', '[' )<CR>
    inoremap ) <C-R>=SmartParens( ')', '(' )<CR>
endfunction

function! SmartParensOff()
    if strlen(mapcheck('[','i')) > 0
        iunmap (
        iunmap [
        iunmap ]
        iunmap )
    endif
endfunction

function! SmartTab()
    let col = col('.') - 1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-P>"
    endif
endfunction

function! SmartParens( char, ... )
    if ! ( &syntax =~ '^\(c\|cpp\|java\)$' )
        return a:char
    endif
    let s = strpart( getline( '.' ), 0, col( '.' ) - 1 )
    if s =~ '//'
        return a:char
    endif
    let s = substitute( s, '/\*\([^*]\|\*\@!/\)*\*/', '', 'g' )
    let s = substitute( s, "'[^']*'", '', 'g' )
    let s = substitute( s, '"\(\\"\|[^"]\)*"', '', 'g' )
    if s =~ "\\([\"']\\|/\\*\\)"
        return a:char
    endif
    if a:0 > 0
        if strpart( getline( '.' ), col( '.' ) - 3, 2 ) == a:1 . ' '
            return "\<BS>" . a:char
        endif
        if strpart( getline( '.' ), col( '.' ) - 2, 1 ) == ' '
            return a:char
        endif
        return ' ' . a:char
    endif
    if !exists("g:DisableSpaceBeforeParen")
        if a:char == '('
            if strpart( getline( '.' ), col( '.' ) - 3, 2 ) == 'if' ||
              \strpart( getline( '.' ), col( '.' ) - 4, 3 ) == 'for' ||
              \strpart( getline( '.' ), col( '.' ) - 6, 5 ) == 'while' ||
              \strpart( getline( '.' ), col( '.' ) - 7, 6 ) == 'switch'
                return ' ( '
            endif
        endif
    endif
    return a:char . ' '
endfunction

function! SpaceBetweenKeywordAndParens()
    if ! ( &syntax =~ '^\(c\|cpp\|java\)$' )
        return '('
    endif
    let s = strpart( getline( '.' ), 0, col( '.' ) - 1 )
    if s =~ '//'
        " text inside a comment
        return '('
    endif
    let s = substitute( s, '/\*\([^*]\|\*\@!/\)*\*/', '', 'g' )
    let s = substitute( s, "'[^']*'", '', 'g' )
    let s = substitute( s, '"\(\\"\|[^"]\)*"', '', 'g' )
    if s =~ "\\([\"']\\|/\\*\\)"
        " text inside a string
        return '('
    endif
    if a:0 > 0
        if strpart( getline( '.' ), col( '.' ) - 3, 2 ) == a:1 . ' '
            return "\<BS>" . a:char
        endif
        if strpart( getline( '.' ), col( '.' ) - 2, 1 ) == ' '
            return a:char
        endif
        return ' ' . a:char
    endif
    if strpart( getline( '.' ), col( '.' ) - 3, 2 ) == 'if' ||
        \strpart( getline( '.' ), col( '.' ) - 4, 3 ) == 'for' ||
        \strpart( getline( '.' ), col( '.' ) - 6, 5 ) == 'while' ||
        \strpart( getline( '.' ), col( '.' ) - 7, 6 ) == 'switch' ||
        \strpart( getline( '.' ), col( '.' ) - 8, 7 ) == 'foreach' ||
        \strpart( getline( '.' ), col( '.' ) - 8, 7 ) == 'forever'
        return ' ('
    endif
    return '('
endfunction

function! SwitchHeaderImpl()
    let privateheaders = '_p\.\([hH]\|hpp\|hxx\)$'
    let headers = '\.\([hH]\|hpp\|hxx\)$'
    let impl = '\.\([cC]\|cpp\|cc\|cxx\)$'
    let fn = expand( '%' )
    if fn =~ privateheaders
        let list = glob( substitute( fn, privateheaders, '.*', '' ) )
    elseif fn =~ headers
        let list = glob( substitute( fn, headers, '.*', '' ) )
    elseif fn =~ impl
        let list = glob( substitute( fn, impl, '.*', '' ) )
    endif
    while strlen( list ) > 0
        let file = substitute( list, "\n.*", '', '' )
        let list = substitute( list, "[^\n]*", '', '' )
        let list = substitute( list, "^\n", '', '' )
        if ( ( fn =~ headers || fn =~ privateheaders ) && file =~ impl ) || ( fn =~ impl && file =~ headers )
            call AskToSave()
            execute( "edit " . file )
            return
        endif
    endwhile
    if ( fn =~ headers )
        call AskToSave()
        if exists( "$implextension" )
            let file = substitute( fn, headers, '.' . $implextension, '' )
        else
            let file = substitute( fn, headers, '.cpp', '' )
        endif
        " check for modified state of current buffer and if modified ask:
        " save, discard, cancel
        execute( 'edit '.file )
        call append( 0, "#include \"".fn."\"" )
        call append( 2, "// vim: sw=4 sts=4 et tw=100" )
        execute( "set sw=4" )
        execute( "set sts=4" )
        execute( "set et" )
        "execute( "set tw=100" )
    elseif fn =~ impl
        call AskToSave()
        let file = substitute( fn, impl, '.h', '' )
        execute( "edit ".file )
    endif
endfunction

function! SwitchPrivateHeaderImpl()
    let privateheaders = '_p\.\([hH]\|hpp\|hxx\)$'
    let headers = '\.\([hH]\|hpp\|hxx\)$'
    let impl = '\.\([cC]\|cpp\|cc\|cxx\)$'
    let fn = expand( '%' )
    if fn =~ privateheaders
        let list = glob( substitute( fn, privateheaders, '.*', '' ) )
    elseif fn =~ headers
        let list = glob( substitute( fn, headers, '_p.*', '' ) )
    elseif fn =~ impl
        let list = glob( substitute( fn, impl, '_p.*', '' ) )
    endif
    while strlen( list ) > 0
        let file = substitute( list, "\n.*", '', '' )
        let list = substitute( list, "[^\n]*", '', '' )
        let list = substitute( list, "^\n", '', '' )
        if ( fn =~ privateheaders && file =~ impl ) || ( fn =~ impl && file =~ privateheaders ) || ( fn =~ headers && file =~ privateheaders )
            call AskToSave()
            execute( "edit " . file )
            return
        endif
    endwhile
    if ( fn =~ privateheaders )
        call AskToSave()
        if exists( "$implextension" )
            let file = substitute( fn, privateheaders, '.' . $implextension, '' )
        else
            let file = substitute( fn, privateheaders, '.cpp', '' )
        endif
        " check for modified state of current buffer and if modified ask:
        " save, discard, cancel
        execute( 'edit '.file )
        call append( 0, "#include \"".fn."\"" )
        call append( 2, "// vim: sw=4 ts=4 noet" )
        execute( "set sw=4" )
        execute( "set ts=4" )
    elseif fn =~ impl
        let file = substitute( fn, impl, '_p.h', '' )
        call CreatePrivateHeader( file )
    elseif fn =~ headers
        let file = substitute( fn, headers, '_p.h', '' )
        call CreatePrivateHeader( file )
    endif
endfunction

function! AskToSave()
    if &modified
        let yesorno = input("Save changes before switching file? [Y/n]")
        if yesorno == 'y' || yesorno == '' || yesorno == 'Y'
            :execute 'w'
            return 1
        else
            return 0
        endif
    endif
    return 1
endfunction

function! CreatePrivateHeader( privateHeader )
    let privateheaders = '_p\.\([hH]\|hpp\|hxx\)$'
    let headers = '\.\([hH]\|hpp\|hxx\)$'
    let impl = '\.\([cC]\|cpp\|cc\|cxx\)$'
    let fn = expand( '%' )
    if fn =~ headers
        let className = ClassNameFromHeader()
    elseif fn =~ impl
        let className = ClassNameFromImpl()
    endif

    if AskToSave() && fn =~ headers
        :normal gg
        " check whether a Q_DECLARE_PRIVATE is needed
        let dp = search( '\(^\|\s\+\)Q_DECLARE_PRIVATE\s*(\s*'.className.'\s*)' )
        if dp == 0 "nothing found
            call search( '^\s*class\s\+\([A-Za-z0-9]\+_EXPORT\s\+\)\?[A-Za-z_]\+\s*\(:\s*[,\t A-Za-z_]\+\)\?\s*\n\?\s*{' )
            call search( '{' )
            let @c = className
            if getline(line('.')+1) =~ 'Q_OBJECT'
                :normal joQ_DECLARE_PRIVATE(c)
            else
                :normal oQ_DECLARE_PRIVATE(c)
            endif
            :execute 'w'
        endif
    endif
    execute( "edit ".a:privateHeader )
    let privateClassName = className . 'Private'
    let header = substitute( a:privateHeader, privateheaders, '.h', '' )

    call IncludeGuard()
    " FIXME: find out what license to use
    call LicenseHeader( "LGPL" )
    let @h = header
    let @p = privateClassName
    let @c = className
    :normal Gkko
#include "h"

class p
Q_DECLARE_PUBLIC(c)
protected:
c *q_ptr;
endfunction

function! ClassNameFromHeader()
    :normal gg
    call search( '^\s*class\s\+\([A-Za-z0-9]\+_EXPORT\s\+\)\?[A-Za-z_]\+\s*\(:\s*[,\t A-Za-z_]\+\)\?\s*\n\?\s*{' )
    "\zs and \ze mark start and end of the matching
    return matchstr( getline('.'), '\s\+\zs\w\+\ze\s*\(:\|{\|$\)' )
endfunction

function! ClassNameFromImpl()
    :normal gg
    call search( '\s*\([A-Za-z_]\+\)::\1\s*(' )
    :normal "cye
    return @c
endfunction

function! IncludeGuard()
    let guard = toupper( substitute( expand( '%' ), '[\./]', '_', 'g' ) )
    call append( '^', '#define ' . guard )
    +
    call append( '^', '#ifndef ' . guard )
    call append( '$', '#endif // ' . guard )
    +
endfunction

function! LicenseHeader( license )
    let filename = $HOME . "/" . a:license . "HEADER"
    execute ":0r " . filename
"   call append( 0, system( "cat " . filename ) )
endfunction

function! SmartInclude()
    let next = nr2char( getchar( 0 ) )
    if next == '"'
        return "#include \".h\"\<Left>\<Left>\<Left>"
    endif
    if next == '>'
        return "#include <>\<Left>"
    endif
    return "#include <.h>\<Left>\<Left>\<Left>"
endfunction

function! MapIdentHeader( ident )
    let header = tolower(substitute(a:ident, '::', '/', 'g')).'.h'
    if a:ident =~ 'Private$'
        let header = substitute(header, 'private', '_p', '')
    endif
    " always prefer the headers in the same directory
    let check = header
    let slash = 1
    while slash != -1
        if filereadable( check )
            return '"' . check . '"'
        endif
        let slash = match( check, '/' )
        let check = strpart( check, slash + 1 )
    endwhile
    let check = tolower(substitute(a:ident, '::', '/', 'g')).'_p.h'
    let slash = 1
    while slash != -1
        if filereadable(check)
            return '"' . check . '"'
        endif
        let slash = match(check, '/')
        let check = strpart(check, slash + 1)
    endwhile

    " Qt stuff
    if a:ident =~ '^Q[A-Z]'
        " let's try to find the module
        let module = ''
        if $QTDIR != ''
            if filereadable($QTDIR.'/include/QtCore/'.a:ident)
                let module = 'QtCore/'
            elseif filereadable($QTDIR.'/include/QtGui/'.a:ident)
                let module = 'QtGui/'
            elseif filereadable($QTDIR.'/include/Qt3Support/'.a:ident)
                let module = 'Qt3Support/'
            elseif filereadable($QTDIR.'/include/QtAssistant/'.a:ident)
                let module = 'QtAssistant/'
            elseif filereadable($QTDIR.'/include/QtDBus/'.a:ident)
                let module = 'QtDBus/'
            elseif filereadable($QTDIR.'/include/QtDesigner/'.a:ident)
                let module = 'QtDesigner/'
            elseif filereadable($QTDIR.'/include/QtNetwork/'.a:ident)
                let module = 'QtNetwork/'
            elseif filereadable($QTDIR.'/include/QtOpenGL/'.a:ident)
                let module = 'QtOpenGL/'
            elseif filereadable($QTDIR.'/include/QtSql/'.a:ident)
                let module = 'QtSql/'
            elseif filereadable($QTDIR.'/include/QtSvg/'.a:ident)
                let module = 'QtSvg/'
            elseif filereadable($QTDIR.'/include/QtTest/'.a:ident)
                let module = 'QtTest/'
            elseif filereadable($QTDIR.'/include/QtUiTools/'.a:ident)
                let module = 'QtUiTools/'
            elseif filereadable($QTDIR.'/include/QtXml/'.a:ident)
                let module = 'QtXml/'
            endif
        endif
        return '<'.module.a:ident.'>'
    elseif a:ident == 'qDebug' ||
          \a:ident == 'qWarning' ||
          \a:ident == 'qCritical' ||
          \a:ident == 'qFatal'
        return '<QtCore/QtDebug>'
    elseif a:ident == 'Q_EXPORT_PLUGIN2'
        return '<QtCore/QtPlugin>'
    elseif a:ident =~ 'Q_DECLARE_INTERFACE'
        return '<QtCore/QObject>'
    elseif a:ident =~ '^QT_VERSION' ||
          \a:ident =~ '^Q_\(W\|O\)S_' ||
          \a:ident =~ '^Q_CC_' ||
          \a:ident =~ '^Q_.*STRUCTOR_FUNCTION$' ||
          \a:ident =~ '^qu\?int' ||
          \a:ident =~ '^Q_.*_RESOURCE$' ||
          \a:ident == 'qreal' ||
          \a:ident == 'qAbs' ||
          \a:ident == 'qRound' ||
          \a:ident == 'qRound64' ||
          \a:ident == 'qMin' ||
          \a:ident == 'qMax' ||
          \a:ident == 'qBound' ||
          \a:ident == 'qVersion' ||
          \a:ident == 'qSharedBuild' ||
          \a:ident == 'Q_UNUSED' ||
          \a:ident == 'Q_ASSERT' ||
          \a:ident == 'qInstallMsgHandler' ||
          \a:ident == 'Q_GLOBAL_STATIC' ||
          \a:ident == 'Q_GLOBAL_STATIC_WITH_ARGS' ||
          \a:ident == 'qFuzzyCompare' ||
          \a:ident == 'qIsNull' ||
          \a:ident == 'qSwap' ||
          \a:ident =~ 'Q_DECLARE_\(FLAGS\|OPERATORS_FOR_FLAGS\|PRIVATE\|PUBLIC\)' ||
          \a:ident == 'Q_D' ||
          \a:ident == 'Q_Q' ||
          \a:ident == 'Q_DISABLE_COPY' ||
          \a:ident == 'qsrand' ||
          \a:ident == 'qrand'
        return '<QtCore/QtGlobal>'

    " Phonon stuff
    elseif a:ident =~ '^Phonon::[A-Z]'
        if a:ident =~ '^Phonon::\(NoDisc\|Cd\|Dvd\|Vcd\|.\+MetaData\|.*State\|.*Category\|.\+Error\)'
            return '<Phonon/Global>'
        endif
        return '<'.substitute(a:ident, '::', '/', 'g').'>'
    endif

    " KDE stuff
    let kdeincdir = substitute(system('kde4-config --prefix'), '[\n\r]*', '', 'g').'/include/KDE/'
    let classname = substitute(a:ident, '^.*:', '', '')
    let pathfn = expand('%:p:h')
    if filereadable(kdeincdir.classname) && !pathfn =~ 'kdelibs'
        return '<'.classname.'>'
    elseif filereadable(kdeincdir.'Phonon/'.classname)
        return '<Phonon/'.classname.'>'
    elseif filereadable(kdeincdir.'Solid/'.classname)
        return '<Solid/'.classname.'>'
    elseif filereadable(kdeincdir.'KIO/'.classname)
        return '<KIO/'.classname.'>'
    elseif filereadable(kdeincdir.'KParts/'.classname)
        return '<KParts/'.classname.'>'
    elseif a:ident == 'K_GLOBAL_STATIC'
        return '<KGlobal>'
    elseif a:ident == 'K_EXPORT_PLUGIN'
        return '<KPluginLoader>'
    elseif a:ident =~ 'K_PLUGIN_FACTORY'
        return '<KPluginFactory>'
    elseif a:ident == 'K\(Double\|Int\)\(NumInput\|SpinBox\)'
        return '<knuminput.h>'
    elseif a:ident == 'KSharedConfig'
        return '<kconfig.h>'
    elseif a:ident == 'KConfigGroup'
        return '<kconfiggroup.h>'
    elseif a:ident == 'KListViewItem'
        return '<klistview.h>'
    elseif a:ident =~ 'kd\(Debug\|Warning\|Error\|Fatal\|Backtrace\)'
        return '<kdebug.h>'
    elseif a:ident == 'kapp'
        return '<kapplication.h>'
    elseif a:ident == 'i18n' ||
          \a:ident == 'I18N_NOOP'
        return '<klocale.h>'
    elseif a:ident == 'locate' ||
          \a:ident == 'locateLocal'
        return '<kstandarddirs.h>'
    elseif a:ident =~ '\(Small\|Desktop\|Bar\|MainBar\|User\)Icon\(Set\)\?' ||
          \a:ident == 'IconSize'
        return '<kiconloader.h>'

    " Standard Library stuff
    elseif a:ident =~ '\(std::\)\?\(cout\|cerr\|endl\)'
        return '<iostream>'
    elseif a:ident =~ '\(std::\)\?is\(alnum\|alpha\|ascii\|blank\|graph\|lower\|print\|punct\|space\|upper\|xdigit\)'
        return '<cctype>'
    elseif a:ident == 'printf'
        return '<cstdio>'
    endif

    let check = header
    while 1
        if filereadable( check )
            return '"' . check . '"'
        endif
        let slash = match( check, '/' )
        if slash == -1
            return '<' . header . '>'
        endif
        let check = strpart( check, slash + 1 )
    endwhile
endfunction

" This is a rather dirty hack, but seems to work somehow :-) (malte)
function! AddHeader()
    let s = getline( '.' )
    let i = col( '.' ) - 1
    while i > 0 && strpart( s, i, 1 ) !~ '[A-Za-z0-9_:]'
        let i = i - 1
    endwhile
    while i > 0 && strpart( s, i, 1 ) =~ '[A-Za-z0-9_:]'
        let i = i - 1
    endwhile
    let start = match( s, '[A-Za-z0-9_]\+\(::[A-Z][A-Za-z0-9_]*\)*', i )
    let end = matchend( s, '[A-Za-z0-9_]\+\(::[A-Z][A-Za-z0-9_]*\)*', i )
"    if end > col( '.' )
"        let end = matchend( s, '[A-Za-z0-9_]\+', i )
"    endif
    let ident = strpart( s, start, end - start )
    let header = MapIdentHeader(ident)
    let include = '#include '.header

    let line = 1
    let incomment = 0
    let appendpos = 0
    let codestart = 0
    let similarpos = 0
    let similarity = 0
    while line <= line( '$' )
        let s = getline( line )
        if incomment == 1
            let end = matchend( s, '\*/' )
            if end == -1
                let line = line + 1
                continue
            else
                let s = strpart( s, end )
                let incomment = 0
            endif
        endif
        let s = substitute( s, '//.*', '', '' )
        let s = substitute( s, '/\*\([^*]\|\*\@!/\)*\*/', '', 'g' )
        if s =~ '/\*'
            let incomment = 1
        elseif s =~ '^' . include
            break
        elseif s =~ '^#include' && s !~ '\.moc"'
            let appendpos = line
            if s =~ '^#include '.header[0:similarity+1]
                let similarpos = line
                let similarity = similarity + 1
                while s =~ '^#include '.header[0:similarity+1]
                    let similarity = similarity + 1
                endwhile
                if s[9:strlen(s)-2] > header[0:strlen(header)-2]
                    let similarpos = similarpos - 1
                    let similarity = 100 "this include belongs one line higher (assuming the order of includes already is alphabetically)
                endif
            endif
        elseif codestart == 0 && s !~ '^$'
            let codestart = line
        endif
        let line = line + 1
    endwhile
    if similarpos > 0
        let appendpos = similarpos
    endif
    if line == line( '$' ) + 1
        if appendpos == 0
            call append( codestart - 1, include )
            call append( codestart, '' )
        else
            call append( appendpos, include )
        endif
    endif
endfunction

function! AddForward()
    let s = getline( '.' )
    let i = col( '.' ) - 1
    while i > 0 && strpart( s, i, 1 ) !~ '[A-Za-z0-9_:]'
        let i = i - 1
    endwhile
    while i > 0 && strpart( s, i, 1 ) =~ '[A-Za-z0-9_:]'
        let i = i - 1
    endwhile
    let start = match( s, '[A-Za-z0-9_]\+\(::[A-Za-z0-9_]\+\)*', i )
    let end = matchend( s, '[A-Za-z0-9_]\+\(::[A-Za-z0-9_]\+\)*', i )
    if end > col( '.' )
        let end = matchend( s, '[A-Za-z0-9_]\+', i )
    endif
    let ident = strpart( s, start, end - start )
    let forward = 'class ' . ident . ';'

    let line = 1
    let incomment = 0
    let appendpos = 0
    let codestart = 0
    while line <= line( '$' )
        let s = getline( line )
        if incomment == 1
            let end = matchend( s, '\*/' )
            if end == -1
                let line = line + 1
                continue
            else
                let s = strpart( s, end )
                let incomment = 0
            endif
        endif
        let s = substitute( s, '//.*', '', '' )
        let s = substitute( s, '/\*\([^*]\|\*\@!/\)*\*/', '', 'g' )
        if s =~ '/\*'
            let incomment = 1
        elseif s =~ '^' . forward
            break
        elseif s =~ '^\s*class [A-za-z0-9_]\+;' || (s =~ '^#include' && s !~ '\.moc"')
            let appendpos = line
        elseif codestart == 0 && s !~ '^$'
            let codestart = line
        endif
        let line = line + 1
    endwhile
    if line == line( '$' ) + 1
        if appendpos == 0
            call append( codestart - 1, forward )
            call append( codestart, '' )
        else
            call append( appendpos, forward )
        endif
    endif
endfunction

function! RunDiff()
    echo 'Diffing....'
    read! cvs diff -bB -I \\\#include | egrep -v '(^Index:|^=+$|^RCS file:|^retrieving revision|^diff -u|^[+-]{3})'
endfunction

function! CreateChangeLogEntry()
    let currentBuffer = expand( "%" )

    if exists( "g:EMAIL" )
        let mail = g:EMAIL
    elseif exists( "$EMAIL" )
        let mail = $EMAIL
    else
        let mail = inputdialog( "Enter Name/Email for Changelog entry: " )
    if mail == ""
        echo "Aborted ChangeLog edit..."
        return
    endif
    let g:EMAIL = mail
    endif

    if bufname( "ChangeLog" ) != "" && bufwinnr( bufname( "ChangeLog" ) ) != -1
    execute bufwinnr( bufname( "ChangeLog" ) ) . " wincmd w"
    else
        execute "split ChangeLog"
    endif

    let lastEntry = getline( nextnonblank( 1 ) )
    let newEntry = strftime("%Y-%m-%d") . "  " . mail

    if lastEntry != newEntry
        call append( 0, "" )
        call append( 0, "" )
        call append( 0, newEntry )
    endif

    " like emacs, prepend the current buffer name to the entry. but unlike
    " emacs I have no idea how to figure out the current function name :(
    " (Simon)
    if currentBuffer != ""
        let newLine = "\t* " . currentBuffer . ": "
    else
        let newLine = "\t* "
    endif

    call append( 2, newLine )

    execute "normal 3G$"
endfunction

function! AddQtSyntax()
    if expand( "<amatch>" ) == "cpp"
        syn keyword qtKeywords     signals slots emit Q_SLOTS Q_SIGNALS
        syn keyword qtMacros       Q_OBJECT Q_WIDGET Q_PROPERTY Q_ENUMS Q_OVERRIDE Q_CLASSINFO Q_SETS SIGNAL SLOT Q_DECLARE_PUBLIC Q_DECLARE_PRIVATE Q_D Q_Q Q_DISABLE_COPY Q_DECLARE_METATYPE Q_PRIVATE_SLOT Q_FLAGS Q_INTERFACES Q_DECLARE_INTERFACE Q_EXPORT_PLUGIN2 Q_GADGET Q_SCRIPTABLE Q_INVOKABLE METHOD Q_ARG Q_RETURN_ARG Q_GLOBAL_STATIC Q_GLOBAL_STATIC_WITH_ARGS
        syn keyword qtCast         qt_cast qobject_cast qvariant_cast qstyleoption_cast qgraphicsitem_cast
        syn keyword qtTypedef      uchar uint ushort ulong Q_INT8 Q_UINT8 Q_INT16 Q_UINT16 Q_INT32 Q_UINT32 Q_LONG Q_ULONG Q_INT64 Q_UINT64 Q_LLONG Q_ULLONG pchar puchar pcchar qint8 quint8 qint16 quint16 qint32 quint32 qint64 quint64 qlonglong qulonglong qreal
        syn keyword kdeMacros      ASYNC PHONON_ABSTRACTBASE PHONON_OBJECT PHONON_HEIR PHONON_ABSTRACTBASE_IMPL PHONON_OBJECT_IMPL PHONON_HEIR_IMPL PHONON_PRIVATECLASS PHONON_PRIVATEABSTRACTCLASS K_DECLARE_PRIVATE K_D K_EXPORT_PLUGIN K_PLUGIN_FACTORY K_PLUGIN_FACTORY_DEFINITION K_PLUGIN_FACTORY_DECLARATION K_GLOBAL_STATIC K_GLOBAL_STATIC_WITH_ARGS
        syn keyword cRepeat        foreach
        syn keyword cRepeat        forever

        hi def link qtKeywords          Statement
        hi def link qtMacros            Type
        hi def link qtCast              Statement
        hi def link qtTypedef           Type
        hi def link kdeMacros           Type
    endif
endfunction

function! UpdateMocFiles()
    if &syntax == "cpp"
        let i = 1
        while i < 80
            let s = getline( i )
            if s =~ '^#include ".*\.moc"'
                let s = substitute( s, '.*"\(.*\)\.moc"', '\1.h', '' )
                if stridx( &complete, s ) == -1
                    let &complete = &complete . ',k' . s
                endif
                break
            endif
            let i = i + 1
        endwhile
    endif
endfunction

autocmd Syntax * call AddQtSyntax()
autocmd CursorHold * call UpdateMocFiles()
autocmd BufNewFile,BufRead * call SetCodingStyle()
"Restore cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
"End
" vim: sw=4 sts=4 et
