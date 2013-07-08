set tabstop=8
set autoindent
set nu

set list listchars=tab:·\ ,trail:\ ,extends:»,precedes:«

set laststatus=2
set statusline=[%{GitBranch()}]
set statusline+=%<\                       " cut at start
set statusline+=%2*%H%M%R%W%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%10(%l,%c%)\            " line and column
set statusline+=%=%P                        " percentage of file

let g:clang_close_preview=1
let g:clang_complete_copen=1
let g:clang_complete_auto = 1
let g:clang_complete_macros = 1

let &makeprg='gbs build -A armv7l --keep-packs --include-all --noinit 2>&1 \\\| grep :\ error:\   | tee'

hi ColorColumn ctermbg=DarkGray
set colorcolumn=80

filetype plugin on

set tags+=~/.vim/tags

" TagList
let g:Tlist_Show_One_File=1
let g:Tlist_GainFocus_On_ToggleOpen=1
let g:Tlist_Auto_Highlight_Tag=1

highlight OverLength ctermbg=red guibg=#592929
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWinLeave * call clearmatches()

nmap <C-g> <Esc>:cs f c <cword><cr>
vmap <C-g> <Esc>:cs f c <cword><cr>
imap <C-g> <Esc>:cs f c <cword><cr>

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

nmap <F3> <Esc>:botright cwindow<cr>
vmap <F3> <Esc>:botright cwindow<cr>
imap <F3> <Esc>:botright cwindow<cr>
