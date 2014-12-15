set nocompatible
set nu
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"set autoindent
"set list
set virtualedit=onemore
"set cursorline
set listchars=tab:⋅\ ,trail:\ ,nbsp:\ 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'vim-scripts/a.vim'
"Plugin 'Rip-Rip/clang_complete'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'Shougo/unite.vim'
Plugin 'widox/vim-buffer-explorer-plugin'
Plugin 'vadimr/bclose.vim'
Plugin 'vim-scripts/highlight.vim'
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/idutils'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'Shougo/vimproc.vim'

call vundle#end()
filetype plugin indent on

" easy motion
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

" Nerd tree
let g:NERDTreeWinPos = "right"

" clang complete
let g:clang_close_preview=1
let g:clang_complete_copen=0
let g:clang_complete_auto = 0
let g:clang_complete_macros = 1
let g:clang_auto_select = 1
let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = '/home/user/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:clang_complete_copen = 1
" let g:clang_hl_errors =  1
" let g:clang_periodic_quickfix = 1
" let g:clang_library_path = '/usr/lib/llvm-3.2/lib/'

nmap <C-g> <Esc>:YcmCompleter GoTo<cr>
vmap <C-g> <esc>:BufExplorer<cr>
imap <C-g> <esc>:BufExplorer<cr>

" Column
hi ColorColumn ctermbg=Gray
set colorcolumn=100

" TagList
let g:Tlist_Show_One_File=1
let g:Tlist_GainFocus_On_ToggleOpen=1
let g:Tlist_Auto_Highlight_Tag=1

" Unite
"let g:unite_source_rec_max_cache_files=10000
let g:unite_source_rec_async_command='ag --follow --nocolor --nogroup -g "cpp"'

" Extra space
"highlight OverLength ctermbg=red guibg=red
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd BufWinLeave * call clearmatches()

"nmap <C-g> <Esc>:cs f c <cword><cr>
"vmap <C-g> <Esc>:cs f c <cword><cr>
"imap <C-g> <Esc>:cs f c <cword><cr>

nmap <C-b> <Esc>:BufExplorer<cr>
vmap <C-b> <esc>:BufExplorer<cr>
imap <C-b> <esc>:BufExplorer<cr>

nmap <C-d> :Bclose<cr>i
vmap <C-d> <esc>:Bclose<cr>i
imap <C-d> <esc>:Bclose<cr>i

nmap <C-l> <Esc>:TlistToggle<cr>
vmap <C-l> <Esc>:TlistToggle<cr>
imap <C-l> <Esc>:TlistToggle<cr>

nmap <C-f> <Esc>:NERDTreeToggle<cr>
vmap <C-f> <Esc>:NERDTreeToggle<cr>
imap <C-f> <Esc>:NERDTreeToggle<cr>

nmap <S-f> <Esc>:Unite file_rec/async<cr>
vmap <S-f> <Esc>:Unite file_rec/async<cr>
"imap <M-f> <Esc>:Unite file_rec<cr>

nmap <F3> <Esc>:belowright cwindow<cr>
vmap <F3> <Esc>:belowright cwindow<cr>
imap <F3> <Esc>:belowright cwindow<cr>

nmap _f <Esc>:IDGrep <cword><cr>
vmap _f <Esc>:IDGrep <cword><cr>
"imap _f <Esc>:IDGrep <cword><cr>


"set encoding=utf-8
"set termencoding=utf-8

set fileencodings=utf-8,cp1251,cp866,koi8-r

" <F7> File fileformat (dos - <CR> <NL>, unix - <NL>, mac - <CR>)
map <F7>	:execute RotateFileFormat()<CR>
vmap <F7>	<C-C><F7>
imap <F7>	<C-O><F7>
let b:fformatindex=0
function! RotateFileFormat()
  let y = -1
  while y == -1
    let encstring = "#unix#dos#mac#"
    let x = match(encstring,"#",b:fformatindex)
    let y = match(encstring,"#",x+1)
    let b:fformatindex = x+1
    if y == -1
      let b:fformatindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fileformat=".str
    endif
  endwhile
endfunction

" <F8> File encoding for open
" ucs-2le - MS Windows unicode encoding
map <F8>	:execute RotateEnc()<CR>
vmap <F8>	<C-C><F8>
imap <F8>	<C-O><F8>
let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Shift+F8> Force file encoding for open (encoding = fileencoding)
map <S-F8>	:execute ForceRotateEnc()<CR>
vmap <S-F8>	<C-C><S-F8>
imap <S-F8>	<C-O><S-F8>
let b:encindex=0
function! ForceRotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      :execute "set encoding=".str
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Ctrl+F8> File encoding for save (convert)
map <C-F8>	:execute RotateFEnc()<CR>
vmap <C-F8>	<C-C><C-F8>
imap <C-F8>	<C-O><C-F8>
let b:fencindex=0
function! RotateFEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:fencindex)
    let y = match(encstring,"#",x+1)
    let b:fencindex = x+1
    if y == -1
      let b:fencindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fenc=".str
    endif
  endwhile
endfunction

"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
"set laststatus=2
