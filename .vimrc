" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" ====================================================================
" SOPHISTICATED COLOR SCHEME - Minimal Dark Professional
" ====================================================================

set t_Co=256
set termguicolors              " Enable true color support
set background=dark

" Custom minimal dark theme - easy on eyes for long sessions
function! SetupMinimalDark()
  " Reset highlighting
  highlight clear
  if exists("syntax_on")
    syntax reset
  endif
  
  " Base colors - carefully chosen for comfort
  hi Normal         ctermfg=253  ctermbg=234   guifg=#dadada guibg=#1c1c1c
  hi NonText        ctermfg=238  ctermbg=234   guifg=#444444 guibg=#1c1c1c
  hi LineNr         ctermfg=242  ctermbg=235   guifg=#6c6c6c guibg=#262626
  hi CursorLineNr   ctermfg=255  ctermbg=236   guifg=#ffffff guibg=#303030
  hi CursorLine                  ctermbg=236                 guibg=#303030 cterm=NONE gui=NONE
  hi ColorColumn                 ctermbg=235                 guibg=#262626
  hi SignColumn                  ctermbg=235                 guibg=#262626
  
  " Status and UI elements
  hi StatusLine     ctermfg=255  ctermbg=240   guifg=#ffffff guibg=#585858 cterm=NONE gui=NONE
  hi StatusLineNC   ctermfg=248  ctermbg=237   guifg=#a8a8a8 guibg=#3a3a3a cterm=NONE gui=NONE
  hi VertSplit      ctermfg=237  ctermbg=237   guifg=#3a3a3a guibg=#3a3a3a cterm=NONE gui=NONE
  hi Pmenu          ctermfg=251  ctermbg=238   guifg=#c6c6c6 guibg=#444444
  hi PmenuSel       ctermfg=234  ctermbg=110   guifg=#1c1c1c guibg=#87afd7
  hi WildMenu       ctermfg=234  ctermbg=110   guifg=#1c1c1c guibg=#87afd7
  
  " Visual and search
  hi Visual                      ctermbg=238                 guibg=#444444
  hi Search         ctermfg=234  ctermbg=180   guifg=#1c1c1c guibg=#d7af87
  hi IncSearch      ctermfg=234  ctermbg=215   guifg=#1c1c1c guibg=#ffaf5f
  hi MatchParen     ctermfg=255  ctermbg=237   guifg=#ffffff guibg=#3a3a3a cterm=bold gui=bold
  
  " Syntax highlighting - soft and easy on eyes
  hi Comment        ctermfg=245               guifg=#8a8a8a cterm=italic gui=italic
  hi Constant       ctermfg=180               guifg=#d7af87
  hi String         ctermfg=186               guifg=#d7d787
  hi Character      ctermfg=186               guifg=#d7d787
  hi Number         ctermfg=139               guifg=#af87af
  hi Boolean        ctermfg=139               guifg=#af87af
  hi Float          ctermfg=139               guifg=#af87af
  
  hi Identifier     ctermfg=117               guifg=#87d7ff cterm=NONE gui=NONE
  hi Function       ctermfg=150               guifg=#afd787
  hi Statement      ctermfg=110               guifg=#87afd7 cterm=NONE gui=NONE
  hi Conditional    ctermfg=110               guifg=#87afd7 cterm=NONE gui=NONE
  hi Repeat         ctermfg=110               guifg=#87afd7 cterm=NONE gui=NONE
  hi Label          ctermfg=110               guifg=#87afd7 cterm=NONE gui=NONE
  hi Operator       ctermfg=117               guifg=#87d7ff
  hi Keyword        ctermfg=110               guifg=#87afd7 cterm=NONE gui=NONE
  hi Exception      ctermfg=174               guifg=#d78787
  
  hi PreProc        ctermfg=180               guifg=#d7af87
  hi Include        ctermfg=180               guifg=#d7af87
  hi Define         ctermfg=180               guifg=#d7af87
  hi Macro          ctermfg=180               guifg=#d7af87
  hi PreCondit      ctermfg=180               guifg=#d7af87
  
  hi Type           ctermfg=146               guifg=#afafd7 cterm=NONE gui=NONE
  hi StorageClass   ctermfg=146               guifg=#afafd7
  hi Structure      ctermfg=146               guifg=#afafd7
  hi Typedef        ctermfg=146               guifg=#afafd7
  
  hi Special        ctermfg=215               guifg=#ffaf5f
  hi SpecialChar    ctermfg=215               guifg=#ffaf5f
  hi Tag            ctermfg=215               guifg=#ffaf5f
  hi Delimiter      ctermfg=248               guifg=#a8a8a8
  hi SpecialComment ctermfg=245               guifg=#8a8a8a cterm=italic gui=italic
  hi Debug          ctermfg=174               guifg=#d78787
  
  " Error and warnings - subtle but noticeable
  hi Error          ctermfg=255  ctermbg=124   guifg=#ffffff guibg=#af0000
  hi ErrorMsg       ctermfg=255  ctermbg=124   guifg=#ffffff guibg=#af0000
  hi WarningMsg     ctermfg=226               guifg=#ffff00
  hi Todo           ctermfg=234  ctermbg=215   guifg=#1c1c1c guibg=#ffaf5f cterm=bold gui=bold
  
  " Diff colors
  hi DiffAdd        ctermfg=255  ctermbg=22    guifg=#ffffff guibg=#005f00
  hi DiffChange     ctermfg=255  ctermbg=24    guifg=#ffffff guibg=#005f87
  hi DiffDelete     ctermfg=255  ctermbg=52    guifg=#ffffff guibg=#5f0000
  hi DiffText       ctermfg=255  ctermbg=26    guifg=#ffffff guibg=#005fd7 cterm=bold gui=bold
  
  " Spell checking
  hi SpellBad                                               cterm=undercurl gui=undercurl guisp=#d78787
  hi SpellCap                                               cterm=undercurl gui=undercurl guisp=#87afd7
  hi SpellLocal                                             cterm=undercurl gui=undercurl guisp=#d7af87
  hi SpellRare                                              cterm=undercurl gui=undercurl guisp=#afafd7
  
  " Folding
  hi Folded         ctermfg=248  ctermbg=237   guifg=#a8a8a8 guibg=#3a3a3a
  hi FoldColumn     ctermfg=248  ctermbg=235   guifg=#a8a8a8 guibg=#262626
endfunction

" ====================================================================
" ENHANCED STATUS BAR - Integrated with Minimal Dark Theme
" ====================================================================

" Custom status line function
function! StatuslineMode()
  let l:mode = mode()
  if l:mode ==# 'n'
    return 'NORMAL'
  elseif l:mode ==# 'i'
    return 'INSERT'
  elseif l:mode ==# 'v'
    return 'VISUAL'
  elseif l:mode ==# 'V'
    return 'V-LINE'
  elseif l:mode ==# "\<C-v>"
    return 'V-BLOCK'
  elseif l:mode ==# 'R'
    return 'REPLACE'
  elseif l:mode ==# 'c'
    return 'COMMAND'
  else
    return 'UNKNOWN'
  endif
endfunction

" Git branch function (if you use git)
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

" File format with icons
function! FileFormat()
  if &fileformat == 'unix'
    return 'LF'
  elseif &fileformat == 'dos'
    return 'CRLF'
  else
    return &fileformat
  endif
endfunction

" Custom status line
set statusline=
set statusline+=%#StatusLineAccent#                    " Accent color
set statusline+=\ %{StatuslineMode()}                  " Current mode
set statusline+=%#StatusLine#                          " Default status color
set statusline+=\ %f                                   " File path
set statusline+=%m                                     " Modified flag
set statusline+=%r                                     " Read-only flag
set statusline+=%#StatusLineExtra#                     " Extra info color
set statusline+=\ %{&filetype!=''?&filetype:'none'}    " File type
set statusline+=\ %{FileFormat()}                      " File format
set statusline+=%=                                     " Right align from here
set statusline+=%#StatusLineGit#                       " Git color
set statusline+=\ %{GitBranch()!=''?'⎇\ '.GitBranch():''}  " Git branch
set statusline+=%#StatusLineExtra#                     " Extra info color
set statusline+=\ %l/%L                                " Line number/total
set statusline+=\ %c                                   " Column number
set statusline+=\ %p%%                                 " Percentage through file
set statusline+=%#StatusLine#                          " Default color
set statusline+=\ 

" Enhanced status bar colors for the minimal dark theme
function! SetupEnhancedStatusBar()
  " Mode-based status line colors
  hi StatusLine         ctermfg=255  ctermbg=240   guifg=#ffffff guibg=#585858 cterm=NONE gui=NONE
  hi StatusLineNC       ctermfg=248  ctermbg=237   guifg=#a8a8a8 guibg=#3a3a3a cterm=NONE gui=NONE
  
  " Custom status line highlight groups
  hi StatusLineAccent   ctermfg=234  ctermbg=110   guifg=#1c1c1c guibg=#87afd7 cterm=bold gui=bold
  hi StatusLineExtra    ctermfg=180  ctermbg=240   guifg=#d7af87 guibg=#585858 cterm=NONE gui=NONE
  hi StatusLineGit      ctermfg=150  ctermbg=240   guifg=#afd787 guibg=#585858 cterm=NONE gui=NONE
  hi StatusLineError    ctermfg=255  ctermbg=124   guifg=#ffffff guibg=#af0000 cterm=bold gui=bold
  hi StatusLineWarning  ctermfg=234  ctermbg=215   guifg=#1c1c1c guibg=#ffaf5f cterm=bold gui=bold
endfunction

" Mode-aware status line colors
function! StatuslineModeHighlight()
  let l:mode = mode()
  if l:mode ==# 'i'
    hi StatusLineAccent ctermfg=234 ctermbg=150 guifg=#1c1c1c guibg=#afd787
  elseif l:mode ==# 'v' || l:mode ==# 'V' || l:mode ==# "\<C-v>"
    hi StatusLineAccent ctermfg=234 ctermbg=215 guifg=#1c1c1c guibg=#ffaf5f
  elseif l:mode ==# 'R'
    hi StatusLineAccent ctermfg=255 ctermbg=124 guifg=#ffffff guibg=#af0000
  else
    hi StatusLineAccent ctermfg=234 ctermbg=110 guifg=#1c1c1c guibg=#87afd7
  endif
  return ''
endfunction

" Auto-update status line colors based on mode
autocmd ModeChanged * call StatuslineModeHighlight()

" Tab line customization
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " Select highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    
    " Tab number
    let s .= '%' . (i + 1) . 'T'
    let s .= ' ' . (i + 1) . ' '
    
    " Get buffer name
    let bufnr = tabpagebuflist(i + 1)[tabpagewinnr(i + 1) - 1]
    let file = bufname(bufnr)
    let buftype = getbufvar(bufnr, 'buftype')
    
    if buftype == 'help'
      let s .= 'help'
    elseif buftype == 'quickfix'
      let s .= 'quickfix'
    elseif buftype == 'nofile'
      if file =~ '\/.'
        let s .= substitute(file, '.*\/\ze.', '', '')
      endif
    else
      let s .= pathshorten(fnamemodify(file, ':~:.'))
    endif
    
    " Modified flag
    if getbufvar(bufnr, "&modified")
      let s .= ' ●'
    endif
    
    let s .= ' '
  endfor
  
  let s .= '%#TabLineFill#%T'
  return s
endfunction

set tabline=%!MyTabLine()

" Custom tab line colors
function! SetupTabLineColors()
  hi TabLine        ctermfg=248  ctermbg=237   guifg=#a8a8a8 guibg=#3a3a3a cterm=NONE gui=NONE
  hi TabLineSel     ctermfg=255  ctermbg=240   guifg=#ffffff guibg=#585858 cterm=bold gui=bold
  hi TabLineFill    ctermfg=237  ctermbg=237   guifg=#3a3a3a guibg=#3a3a3a cterm=NONE gui=NONE
endfunction

" Window title
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" Update the minimal dark theme setup to include status bar
function! SetupMinimalDarkWithStatusBar()
  call SetupMinimalDark()
  call SetupEnhancedStatusBar()
  call SetupTabLineColors()
endfunction

" Theme switching function with multiple professional options
function! CycleColorScheme()
  if !exists('g:current_colorscheme')
    let g:current_colorscheme = 0
  endif
  
  let themes = ['minimal_dark', 'desert', 'slate', 'murphy']
  let names = ['Minimal Dark', 'Desert', 'Slate', 'Murphy']
  
  let g:current_colorscheme = (g:current_colorscheme + 1) % len(themes)
  
  if themes[g:current_colorscheme] == 'minimal_dark'
    call SetupMinimalDarkWithStatusBar()
  else
    execute 'colorscheme ' . themes[g:current_colorscheme]
    call SetupEnhancedStatusBar()
    call SetupTabLineColors()
  endif
  
  echo "Theme: " . names[g:current_colorscheme]
endfunction

" Quick theme switching
nnoremap <leader>ct :call CycleColorScheme()<CR>

" Time-based theme switching
function! SetThemeByTime()
  let hour = strftime('%H')
  if hour >= 6 && hour < 18
    " Daytime - lighter theme
    set background=light
    colorscheme desert
    call SetupEnhancedStatusBar()
    call SetupTabLineColors()
  else
    " Evening/night - minimal dark
    set background=dark
    call SetupMinimalDarkWithStatusBar()
  endif
endfunction

nnoremap <leader>at :call SetThemeByTime()<CR>

" Additional status bar toggles
function! ToggleStatusBarInfo()
  if &laststatus == 2
    set laststatus=0
    echo "Status bar: OFF"
  else
    set laststatus=2
    echo "Status bar: ON"
  endif
endfunction

nnoremap <leader>sb :call ToggleStatusBarInfo()<CR>

" ====================================================================
" CODING FOCUS MODE - Optimized for programming
" ====================================================================

let g:cfm_width = 120 " Wider for code (120 chars is good for most coding standards)
let g:cfm_height = 0.95 " Almost full height

let s:cfm_enabled = 0
let s:cfm_original_settings = {}

function! ToggleCodingFocusMode()
  let l:w = g:cfm_width > 1 ? g:cfm_width : (winwidth('%') * g:cfm_width)
  let l:margins = {
	\ "l": ("silent leftabove " . float2nr((winwidth('%') - l:w) / 2 - 1) . " vsplit new"),
	\ "h": ("silent rightbelow " . float2nr((winwidth('%') - l:w) / 2 - 1) . " vsplit new"),
	\ "j": ("silent leftabove " . float2nr(winheight('%') * (1 - g:cfm_height) / 2 - 1) . " split new"),
	\ "k": ("silent rightbelow " . float2nr(winheight('%') * (1 - g:cfm_height) / 2 - 1) . " split new"),
	\ }
  
  if (s:cfm_enabled == 0)
    let s:cfm_enabled = 1
    
    " Save original settings
    let s:cfm_original_settings.wrap = &wrap
    let s:cfm_original_settings.number = &number
    let s:cfm_original_settings.relativenumber = &relativenumber
    let s:cfm_original_settings.cursorline = &cursorline
    let s:cfm_original_settings.colorcolumn = &colorcolumn
    
    " Create margin windows
    for key in keys(l:margins)
      execute l:margins[key] . " | wincmd " . key
    endfor
    
    " Style the margins (dark/invisible)
    for key in ['NonText', 'VertSplit', 'StatusLine', 'StatusLineNC']
      execute 'hi ' . key . ' ctermfg=black ctermbg=black cterm=NONE'
    endfor
    
    " Coding-friendly settings
    set nowrap                    " Don't wrap code lines
    set number                    " Always show line numbers for coding
    set relativenumber           " Relative numbers for quick navigation
    set cursorline              " Highlight current line
    set colorcolumn=80,120      " Show coding guidelines (PEP8 + wider)
    
    " Enhanced navigation for code
    nnoremap <silent> <C-j> :wincmd j<CR>
    nnoremap <silent> <C-k> :wincmd k<CR>
    nnoremap <silent> <C-h> :wincmd h<CR>
    nnoremap <silent> <C-l> :wincmd l<CR>
    
    echo "Coding Focus Mode: ON"
    
  else
    let s:cfm_enabled = 0
    
    " Close margin windows
    for key in keys(l:margins)
      execute "wincmd " . key . " | close "
    endfor
    
    " Restore original settings
    let &wrap = s:cfm_original_settings.wrap
    let &number = s:cfm_original_settings.number
    let &relativenumber = s:cfm_original_settings.relativenumber
    let &cursorline = s:cfm_original_settings.cursorline
    let &colorcolumn = s:cfm_original_settings.colorcolumn
    
    " Remove enhanced navigation
    silent! nunmap <C-j>
    silent! nunmap <C-k>
    silent! nunmap <C-h>
    silent! nunmap <C-l>
    
    echo "Coding Focus Mode: OFF"
  endif
endfunction

" Multiple file management
function! OpenInNewTab()
  tabnew
  call ToggleCodingFocusMode()
endfunction

function! OpenInVerticalSplit()
  if s:cfm_enabled
    call ToggleCodingFocusMode()
  endif
  vsplit
endfunction

" Key mappings
nmap <silent> <Leader>cf :call ToggleCodingFocusMode()<CR>
nmap <silent> <Leader>nt :call OpenInNewTab()<CR>
nmap <silent> <Leader>vs :call OpenInVerticalSplit()<CR>

" Quick buffer navigation
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bd :bdelete<CR>

" Quick tab navigation  
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tc :tabclose<CR>

" clipboard directly to macos register
set clipboard=unnamedplus

" ====================================================================
" ADVANCED PRODUCTIVITY ENHANCEMENTS
" ====================================================================

" Smart line wrapping for different file types
augroup SmartWrap
  autocmd!
  autocmd FileType markdown,text,gitcommit setlocal wrap linebreak nolist
  autocmd FileType python,javascript,html,css,vim setlocal nowrap
augroup END

" Auto-save when focus is lost or switching buffers
set autowrite
autocmd FocusLost * silent! wa
autocmd BufLeave * silent! w

" Persistent undo across sessions
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo
  " Create undo directory if it doesn't exist
  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
endif

" Enhanced search improvements
set gdefault                    " Global replace by default
set shortmess+=c               " Don't give completion messages
set completeopt=menuone,noinsert,noselect

" Smart case-sensitive search
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'

" ====================================================================
" INTELLIGENT FILE NAVIGATION & MANAGEMENT
" ====================================================================

" Enhanced file explorer (netrw) settings
let g:netrw_banner = 0          " Remove banner
let g:netrw_liststyle = 3       " Tree view
let g:netrw_winsize = 20        " Width of explorer
let g:netrw_browse_split = 4    " Open in previous window
let g:netrw_altv = 1           " Open splits to the right

" Quick file navigation
nnoremap <leader>e :Explore<CR>
nnoremap <leader>v :Vexplore<CR>
nnoremap <leader>s :Sexplore<CR>

" Smart buffer switching with MRU (Most Recently Used)
function! SwitchToAlternateBuffer()
  if bufname('#') != ''
    buffer #
  else
    bnext
  endif
endfunction

nnoremap <leader><leader> :call SwitchToAlternateBuffer()<CR>

" Enhanced buffer management
function! DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr(')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr(')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
  echo "Hidden buffers deleted"
endfunction

nnoremap <leader>bh :call DeleteHiddenBuffers()<CR>

" ====================================================================
" SMART EDITING ENHANCEMENTS
" ====================================================================

" Auto-close brackets and quotes with smart positioning
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" But don't auto-close if next character is alphanumeric
function! SmartClosingQuote(char)
  let line = getline('.')
  let col = col('.') - 1
  if col < len(line) && line[col] =~ '\w'
    return a:char
  else
    return a:char . a:char . "\<Left>"
  endif
endfunction

" Smart quote handling
inoremap <expr> " SmartClosingQuote('"')
inoremap <expr> ' SmartClosingQuote("'")

" Enhanced text objects for better editing
" Select entire buffer
nnoremap <leader>a ggVG

" Quick line manipulation
nnoremap <leader>d dd
nnoremap <leader>D D
nnoremap <leader>y yy

" Smart indentation
vnoremap < <gv
vnoremap > >gv

" Quick commenting (basic implementation)
function! ToggleComment()
  let line = getline('.')
  let commentStr = {
    \ 'vim': '"',
    \ 'python': '#',
    \ 'javascript': '//',
    \ 'css': '/* */',
    \ 'html': '<!-- -->',
    \ 'sh': '#',
    \ 'bash': '#',
  \ }
  
  let comment = get(commentStr, &filetype, '#')
  
  if line =~ '^\s*' . escape(comment, '/*')
    " Uncomment
    execute 's/^\s*' . escape(comment, '/*') . '\s*//e'
  else
    " Comment
    execute 's/^/' . comment . ' /'
  endif
endfunction

nnoremap <leader>/ :call ToggleComment()<CR>
vnoremap <leader>/ :call ToggleComment()<CR>

" ====================================================================
" ADVANCED WINDOW MANAGEMENT
" ====================================================================

" Smart window resizing
nnoremap <silent> + :vertical resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" Window zoom toggle
function! ToggleZoom()
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction

nnoremap <leader>z :call ToggleZoom()<CR>

" Quick window navigation improvements
nnoremap <C-w>h <C-w>h
nnoremap <C-w>j <C-w>j  
nnoremap <C-w>k <C-w>k
nnoremap <C-w>l <C-w>l

" ====================================================================
" SESSION MANAGEMENT
" ====================================================================

" Session management
function! SaveSession()
  let session_file = getcwd() . '/.vim_session'
  execute 'mksession! ' . session_file
  echo "Session saved: " . session_file
endfunction

function! LoadSession()
  let session_file = getcwd() . '/.vim_session'
  if filereadable(session_file)
    execute 'source ' . session_file
    echo "Session loaded: " . session_file
  else
    echo "No session file found"
  endif
endfunction

nnoremap <leader>ss :call SaveSession()<CR>
nnoremap <leader>sl :call LoadSession()<CR>

" ====================================================================
" DEVELOPMENT ENHANCEMENTS
" ====================================================================

" Quick make and compile
nnoremap <leader>m :make<CR>
nnoremap <leader>M :make clean<CR>

" Spell checking toggle
nnoremap <leader>sp :setlocal spell!<CR>

" Word wrap toggle for writing
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap <buffer> <silent> <Up> gk
    noremap <buffer> <silent> <Down> gj
    noremap <buffer> <silent> <Home> g<Home>
    noremap <buffer> <silent> <End> g<End>
    inoremap <buffer> <silent> <Up> <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End> <C-o>g<End>
  endif
endfunction

nnoremap <leader>w :call ToggleWrap()<CR>

" Quick date/time insertion
nnoremap <leader>td "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
inoremap <leader>td <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" ====================================================================
" PERFORMANCE & STARTUP OPTIMIZATIONS
" ====================================================================

" Faster startup
set lazyredraw                 " Don't redraw during macros
set ttyfast                    " Fast terminal connection
set synmaxcol=200             " Don't syntax highlight long lines

" Better diff options
set diffopt+=vertical,algorithm:patience

" Improved wildmenu
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.pyc,*.o,*.obj,*.swp,*.class,*.DS_Store

" Better backup and swap file handling
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set writebackup

" Create backup and swap directories if they don't exist
if !isdirectory($HOME . "/.vim/backup")
  call mkdir($HOME . "/.vim/backup", "p")
endif
if !isdirectory($HOME . "/.vim/swap")
  call mkdir($HOME . "/.vim/swap", "p")
endif

" ====================================================================
" HELPFUL KEY MAPPINGS SUMMARY
" ====================================================================

" Quick reference function
function! ShowKeyMappings()
  echo "=== Custom Key Mappings ==="
  echo "<leader>cf  - Toggle Coding Focus Mode"
  echo "<leader>ct  - Cycle Color Themes"
  echo "<leader>at  - Auto Theme by Time"
  echo "<leader>sb  - Toggle Status Bar"
  echo "<leader>/   - Toggle Comment"
  echo "<leader>z   - Toggle Window Zoom"
  echo "<leader>w   - Toggle Word Wrap"
  echo "<leader>sp  - Toggle Spell Check"
  echo "<leader>ss  - Save Session"
  echo "<leader>sl  - Load Session"
  echo "<leader>e   - Explore Files"
  echo "<leader>bh  - Delete Hidden Buffers"
  echo "<leader><leader> - Switch to Alternate Buffer"
  echo "=== Buffer Navigation ==="
  echo "<leader>bn  - Next Buffer"
  echo "<leader>bp  - Previous Buffer" 
  echo "<leader>bd  - Delete Buffer"
  echo "=== Tab Navigation ==="
  echo "<leader>tn  - Next Tab"
  echo "<leader>tp  - Previous Tab"
  echo "<leader>tc  - Close Tab"
endfunction

nnoremap <leader>? :call ShowKeyMappings()<CR>

" Apply the theme with enhanced status bar
call SetupMinimalDarkWithStatusBar()

" Initialize enhanced status bar components
call StatuslineModeHighlight()

" Initialize on startup
autocmd VimEnter * silent! call StatuslineModeHighlight()
