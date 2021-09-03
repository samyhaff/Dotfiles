" splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <silent> <C-Left>  :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up>    :resize -3<CR>
noremap <silent> <C-Down>  :resize +3<CR>
map <leader>th <C-w>t<C-w>H
map <leader>tv <C-w>t<C-w>K

"tab completion 
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" general
map <leader>s :setlocal spell spelllang=fr<CR>
map <leader>g :Goyo<CR>
map <leader>o :Files<CR>
map <leader>h :Help<CR>
map <leader>b :Buffers<CR>
map <leader>r :Rg<CR>
map <leader>a <C-^>
map <leader>m :make<CR>
map <leader>gs :G<CR>
map <leader>gc :Git commit<CR>
map <leader>gp :Git push<CR>
map <leader>c :Colors<CR>
noremap Y y$
noremap n nzz
noremap N Nzz
noremap K i<cr><esc>k$

function! Preview()
        execute "! zathura /tmp/op.pdf &"
endfunction

function! Compile()
        let extension = expand('%:e')
        if extension == "ms"
                execute "! groff -ms % -T pdf > /tmp/op.pdf"
        elseif extension == "tex"
                execute "! pandoc -f latex -t latex % -o /tmp/op.pdf"
        elseif extension == "md"
                execute "! pandoc % -s -o /tmp/op.pdf"
        endif
endfunction

noremap <leader>p :call Preview()<CR><CR><CR>
noremap <leader>q :call Compile()<CR><CR>
" autocmd BufWritePost *.md call Compile()<CR><CR>
