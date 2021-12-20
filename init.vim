" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

set number " Show line numbers
set relativenumber " Efficient movment - using 3k or 3j I can move that many lines up/down
set autoindent " Use same indention from the previous line
set tabstop=4 " Number of spaces the <Tab> counts (8 is too much)
set shiftwidth=4 " Number of spaces inserted for indentation
set softtabstop=4 " Make the backspace key treat these four spaces like a tab
set expandtab " All NEW tab characters entered will be changed to spaces
set mouse=a " Mouse support until I become more comfortabile navigating via keymappings
set nowrap
set noerrorbells " I get yelled at enough
set noswapfile " Cause me more pain than its helped
set nobackup
set undodir=~/.config/nvim/undodir " I make a lot of mistakes, track them so they can be undone
set undofile
set incsearch " Highlight as I search, helps with regex
set scrolloff=8 " Keep a buffer at the top/bottom of the screen (i.e. dont go all the way down)
cabbrev bterm bo term 

call plug#begin('~/.config/nvim/plugged')
Plug 'preservim/nerdtree' " File explorer
Plug 'gruvbox-community/gruvbox' " Favorite color scheme
Plug 'ryanoasis/vim-devicons' " Icons for File explorer
Plug 'tc50cal/vim-terminal' " Integrated terminal
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>e :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
