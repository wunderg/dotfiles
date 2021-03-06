" Thismust be first, because it changes other options as a side effect.
set nocompatible
filetype plugin on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" =============== Vundle Initialization ===============
set rtp +=~/.vim/bundle/Vundle.vim
call vundle#begin()

" =============== Typescript  ==================
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
" =============== Core  ==================
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
" Plugin 'Shougo/neocomplet
Plugin 'tpope/vim-fugitive'
" Plugin 'janko-m/vim-test'

" =============== Improvements ==================
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'christoomey/vim-tmux-navigator'
" Plugin 'Shougo/neosnippet-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
" Plugi, 'Shougo/neosnippet'
Plugin 'justinmk/vim-sneak'
Plugin 'bkad/CamelCaseMotion'
Plugin 'easymotion/vim-easymotion'
Plugin 'honza/vim-snippets'
Plugin 'tomtom/tcomment_vim'
Plugin 'bonsaiben/bootstrap-snippets'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-obsession'
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'Valloric/MatchTagAlways'
"Plugin 'mxw/vim-jsx'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
" =============== Language and Syntax ==================
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'editorconfig/editorconfig-vim'

" =============== Appearance  ==================
Plugin 'itchyny/lightline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'floobits/floobits-neovim'
Plugin 'vim-scripts/Son-of-Obisidian'

call vundle#end()

" ================ General Config =====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set clipboard=unnamed

" This makes vim act like all other editors, buffers can
set hidden

" xtrerm to inherit the title from vim
set title

"turn on syntax highlighting
syntax on

" Draw Line to see 80 character limit
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
autocmd BufRead,BufNewFile *.md setlocal textwidth=80

" Highlight the line that cursor curently on
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta
set nocursorline
" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on
autocmd BufNewFile,BufRead *.ts*,*.jsx set filetype=typescript.tsx
" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·

" ================ Folds ============================
set foldmethod=indent
set foldlevel=2
"set foldclose=all

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=node_modules/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================
set scrolloff=11        "Start scrolling when we're 11 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Mapping to Move lines  ===========================
" To Do
" ∆ and ˚ is alt key and alt j in mac keyborard
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
" TOFIX
" inoremap <∆> <Esc>:m .+1<CR>==gi
" inoremap <˚> <Esc>:m .-2<CR>==gi
" vnoremap <∆> :m '>+1<CR>gv=gv
" vnoremap <˚> :m '<-2<CR>gv=gv
"
" ================ Plugins settings  ===========================
" test.vim mappings
" nmap <silent> <leader>c :TestNearest<CR>
" nmap <silent> <leader>C :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>
"
"+++++ NERDCOMMENTER+++++
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
"
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
"+++++ NERDTREE+++++
"
" Open nerdTree when no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close and save buffer with nerdtree
nnoremap <leader>bd :w<cr>:bp<cr>:bd #<cr>

" +++++ NERD tree +++++
" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeTabsToggle<CR>:vertical res 22<CR>
map ,n :NERDTreeTabsToggle<CR>
 map <leader>v :NERDTreeFind<cr>
let NERDTreeQuitOnOpen=1
" let g:NERDTreeWinPos = "right" nerdtree on right side

" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 22

"+++++ Solarized +++++
set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors=16
colorscheme solarized

"+++++ AIRLINE +++++
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"
"+++++ LightLine +++++
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'fugitive', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'readonly': 'MyReadonly',
      \   'filename': 'MyFilename',
      \ },
      \ 'separator': { 'left': '▶', 'right': '◀ ' },
      \ 'subseparator': { 'left': '»', 'right': '«' },
      \ }
function! MyReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? 'Ξ '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != expand('%') ? expand('%') : '[NoName]')
endfunction

set laststatus=2
set lazyredraw

"+++++REACT Syntax hightliting+++++
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
" +++++ CamelCaseMotion+++++
map W <Plug>CamelCaseMotion_w
map B <Plug>CamelCaseMotion_b
map E <Plug>CamelCaseMotion_e

sunmap W
sunmap B
sunmap E

"+++++Silver Searcher+++++
let g:ag_working_path_mode="r"

if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif

"+++++CTRLP+++++
" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
let g:ctrlp_max_files=0
let g:ctrlp_match_current_file = 1
let g:ctrlp_mruf_max = 250
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
"nnoremap <silent> ,t :CtrlPBuffer<CR>
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|fonts|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_mruf_case_sensitive = 1

let g:ctrlp_open_new_file = 't'
"" Fix command typos (stolen from Adam Katz)
nmap ; :

"+++++EasyMotion+++++
let g:EasyMotion_keys='asdfjkoweriop'
nmap ,<ESC> ,,w
nmap ,<S-ESC> ,,b

"++++++ UltiSnipps +++++++
let g:UltiSnipsUsePythonVersion=3
let g:UltiSnipsListSnippetsDir = '/.vim/bundle/Av'

" " ++++NeoComplete++++
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_camel_case = 1
" let g:neocomplete#enable_smart_case = 1
"
" " Default # of completions is 100 that little to much!
" let g:neocomplete#max_list = 25
"
" " Set the minimun syntax keyword lenght
" let g:neocomplete#auto_completion_start_length = 1
"
" inoremap <C-Space> <C-n>
" " Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"  let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"Enable Omni compltetion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" ++++++YouCompleteMe+++++++
" " make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger = "<tab>"

" " +++++NEOSNIPPET+++++
" " Plugin key-mappings.
" imap <C-K>     <Plug>(neosnippet_expand_or_jump)
" smap <C-K>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-K>     <Plug>(neosnippet_expand_target)
"
" " SuperTab like snippets behavior.
"  imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"
" "
" " " For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
" "Enable snipMate compatability
" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" let g:neosnippet#snippets_directory='~/.vim/bundle/bootstrap-snippets/snippets'
" let g:neosnippet#snippets_directory='~/.vim/bundle/mysnipps/snippets'
" ========================================

"+++++ javascript syntax libraries+++++
let g:used_javascript_libs = 'underscore, jquery, sugar.js, react, angularjs, chai, flux'
"
" Match tag always
" Jump to other closing tag
nnoremap <leader>% :MtaJumpToOtherTag<cr>
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}
let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color=0
let g:javascript_enable_domhtmlcss=1
highlight MatchTag ctermfg=White ctermbg=DarkGreen guifg=White guibg=DarkGreen
"
"+++++ SNEAK++++
nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
nmap <Space> <Plug>SneakForward

"++++Syntastic+++++
"disable folding per vim-markdown
let g:vim_markdown_folding_disabled=1
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_javascript_checkers = ['eslint']
"=========Continue================
" let g:syntastic_always_populate_loc_list = 1;
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
"automatically jump to the error when saving the file
let g:syntastic_auto_jump=0
" General vim sanity improvements
"don't care about warnings
let g:syntastic_quiet_messages = {'level': 'warnings'}

" +++++YankRing+++++
let g:yankring_history_file = '.yankring-history'
nnoremap ,yr :YRShow<CR>
nnoremap C-y :YRShow<CR>

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
nnoremap ,ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

" Make 0 go to the first character rather than the beginning
" of the line. When we're programming, we're almost always
" interested in working with text rather than empty space. If
" you want the traditional beginning of line, use ^
nnoremap 0 ^
nnoremap ^ 0

" +++++Surround Mappings+++++
" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

" gary bernhardt's hashrocket
imap <c-l> <space>=>

"Go to last edit location with ,.
nnoremap ,. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right jafter the quote
imap <C-a> <esc>wa
imap <C-space> <esc>wa


"Move back and forth hrough previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, K, J
" NOTE: Using vim/settings/vim-tmux-navigator.vim.
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" nnoremap <C-k> <C-w>k
" nnoremap <C-j> <C-w>j

" Make gf (go to file) create the file, if not existent
nnoremap gf :e<cfile><CR>
nnoremap <C-w>f :sp +e<cfile><CR>
nnoremap <C-w>gf :tabe<cfile><CR>

" Zoom in
map <silent> ,gz <C-w>o
nnoremap zz :w<cr>:bp<cr>:bd #<cr>
" Save file
imap kk <ESC><S-a>;<ESC>:w<cr>
imap jj <ESC>:w<cr>
map <leader>ss :w<cr>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" create <%= foo %> erb tags using Ctrl-k in edit mode
" imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
" imap <silent> <C-J> <%  %><Esc>2hi

" ============================
" Shortcuts for everyday tasks
" ============================
" Get rid of trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tl :tabs

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

"(v)im (c)ommand - execute current line as a vim command
"
nmap <silent> ,vc yy:<C-f>p<C-c><CR>

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

" ,hp = html preview
map <silent> ,hp :!open -a 'Google Chrome' %<CR><CR>

" Intilegent closing of windows and buffers
function! CloseWindowOrKillBuffer()
 let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

" Keep NERD TREE OPEN
"  if matchstr(expand("%"), 'NERD') == 'NERD'
"    wincmd c
"    return
"  endif

if number_of_windows_to_this_buffer > 1
  wincmd c
else
  bdelete
endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

let g:loaded_matchparen=1
set nolist
" if number column doesn't make sense to you, just don't render it
" lazy drawing
set lazyredraw
set ttyfast
set encoding=utf-8
set autoread
au FocusGained,BufEnter * :checktime
