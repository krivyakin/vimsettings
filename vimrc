set tabstop=4
set autoindent
set nu
hi ColorColumn ctermbg=DarkGray
set colorcolumn=80
filetype plugin on
set tags+=~/.vim/tags
command GD !git diff %
" TagList
let g:Tlist_Show_One_File=1
let g:Tlist_GainFocus_On_ToggleOpen=1
let g:Tlist_Auto_Highlight_Tag=1

source ~/.vim/autotag.vim
function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction
autocmd BufWritePost *.cpp,*.h,*.c call UpdateTags()


"autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

nmap <C-g> <Esc>:cs f c <cword><cr>
vmap <C-g> <Esc>:cs f c <cword><cr>
imap <C-g> <Esc>:cs f c <cword><cr>

nmap <C-b> <Esc>:BufExplorer<cr>
vmap <C-b> <esc>:BufExplorer<cr>
imap <C-b> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <C-p> :bp<cr>
vmap <C-p> <esc>:bp<cr>i
imap <C-p> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <C-n> :bn<cr>
vmap <C-n> <esc>:bn<cr>i
imap <C-n> <esc>:bn<cr>i

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
