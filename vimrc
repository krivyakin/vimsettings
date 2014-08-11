set nocompatible
set nu
set tabstop=8
set autoindent
"set list
set virtualedit=onemore
set cursorline
set listchars=tab:⋅\ ,trail:\ ,nbsp:\ 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

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
set colorcolumn=80

" TagList
let g:Tlist_Show_One_File=1
let g:Tlist_GainFocus_On_ToggleOpen=1
let g:Tlist_Auto_Highlight_Tag=1

" Unite
let g:unite_source_rec_max_cache_files=10000

" Extra space
highlight OverLength ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()

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

nmap <S-f> <Esc>:Unite file_rec<cr>
vmap <S-f> <Esc>:Unite file_rec<cr>
"imap <M-f> <Esc>:Unite file_rec<cr>

nmap <F3> <Esc>:botright cwindow<cr>
vmap <F3> <Esc>:botright cwindow<cr>
imap <F3> <Esc>:botright cwindow<cr>

"nmap _f <Esc>:IDGrep <cword><cr>
"vmap _f <Esc>:IDGrep <cword><cr>
"imap _f <Esc>:IDGrep <cword><cr>
