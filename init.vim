
"工作目录 
"exec ":cd C:/Users/Default/Desktop"
"exec ":cd D:/code/随机点名"
"exec ":cd D:/code/sdl"
exec ":cd D:/code/zui"
"exec ":cd D:/code/dreamscript"
"exec ":cd D:/code/zlang"

" Plugins {{{

" install plugins {{{
call plug#begin('$VIM/plugins')

"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim' "状态栏
Plug 'mengelbrecht/lightline-bufferline' "bufferline
"Plug 'akinsho/bufferline.nvim' "bufferline
"Plug 'akinsho/nvim-bufferline.lua' "bufferline 不知道怎么用
"Plug 'tamton-aquib/staline.nvim' "老报错
"Plug 'liuchengxu/eleline.vim' "也会报错
"Plug 'glepnir/galaxyline.nvim' 报错

Plug 'glepnir/dashboard-nvim' "开始页面
Plug 'ryanoasis/vim-devicons' "图标美化
"Plug 'kyazdani42/nvim-web-devicons' "同上

"Plug 'nvim-treesitter/nvim-treesitter' "高亮
Plug 'octol/vim-cpp-enhanced-highlight' "C++高亮增强
"Plug 'jackguo380/vim-lsp-cxx-highlight' "C++高亮增强 
"
Plug 'preservim/nerdtree' "文件树
"if has('nvim') "文件树
"  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/defx.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

Plug 'neoclide/coc.nvim',{'branch': 'release'} "补全
"Plug 'maralla/completor.vim' "补全
"Plug 'justmao945/vim-clang' "补全
Plug 'liuchengxu/vista.vim' "函数列表

"主题
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'liuchengxu/space-vim-dark'
Plug 'tomasr/molokai' 
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'

Plug 'vuciv/vim-bujo' "Todolist
"Plug 'Yggdroot/indentLine' "可视化缩进
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } "搜索

"Plug 'skywind3000/asynctasks.vim' "运行项目用

"Plug 'puremourning/vimspector' "debug
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' } "debug
"Plug 'skt041959/gdbmi.nvim'
Plug 'cpiger/NeoDebug'
"Plug 'mfussenegger/nvim-dap'
"Plug 'rcarriga/nvim-dap-ui'
"Plug 'Pocco81/DAPInstall.nvim'
"packadd termdebug
call plug#end()
" }}}

" Plugin-coc {{{

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" }}}

" Plugin-vscode-theme {{{
let g:vscode_style="dark"
" }}}

" Plugin-devicons {{{
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
" }}}

" Plugin-dashboard {{{
 let g:dashboard_custom_header = [
		\ '',
		\ ' 我发誓，以后无论做什么都不耽误学习。',
		\ '',
		\ '',
		\ '',
		\ ]
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
" }}}

" Plugin-lightline {{{
let g:lightline = {
     \ 'colorscheme': 'one',
     \ 'active': {
     \   'left': [ [ 'mode', 'paste' ], [ 'filename', 'modified' ] ]
     \ },
     \ 'tabline': {
     \   'left': [ ['buffers'] ],
     \   'right': [ ['close'] ]
     \ },
     \ 'component_expand': {
     \   'buffers': 'lightline#bufferline#buffers'
     \ },
     \ 'component_type': {
     \   'buffers': 'tabsel'
     \ }
     \ }
"autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

"}}}

" Plugin-NERDTree {{{
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeIgnore = ['.xmake'] "不显示文件夹
map <A-e> :NERDTree<CR>
"autocmd VimEnter * :NERDTree
" }}}

" Plugin-vista.vim{{{
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_default_executive = 'coc'

let g:vista_icon_indent = ["+->", "|-> "]
" }}}

" Plugin-bujo {{{
let g#bujo#todo_file_path = "$/bujo.md"
let g:bujo#window_width = 33
" }}}
" }}}

" editor setting {{{
set winaltkeys=no
if has('nvim')
    try
        call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
        call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
    catch
    endtry
endif

set autoread
set updatetime=800 "刷新速度
set number "显示行号
set clipboard+=unnamedplus "启用系统剪贴板
set noswapfile "无交换文件
set noshowmode "不显示当前模式
set mouse=a "开启鼠标
set scrolloff=2 "滚动时距离底部始终2行
set cursorline "高亮当前行
set updatetime=300

set cindent "c文件自动缩进
set showtabline=2 "永久显示tabline
set hidden "未保存时切换buffer

"syntax enable
syntax on
colorscheme gruvbox-material 
"set background=dark

"tab为4个空格
set tabstop=4 
set softtabstop=4 
set shiftwidth=4

"被分割窗口之间显示空白
set fillchars=vert:/
set fillchars=stl:/
set fillchars=stlnc:/

set guifont=JetBrainsMono_NF:h14

"编码
set encoding=utf-8
autocmd FileType cpp :set fileencoding=gbk
autocmd FileType hpp :set fileencoding=gbk
autocmd FileType c :set fileencoding=gbk
autocmd FileType h :set fileencoding=gbk

autocmd FileType lua :set fileencoding=utf-8
autocmd FileType cmd :set fileencoding=utf-8
autocmd FileType markdown :set fileencoding=utf-8
autocmd FileType txt :set fileencoding=utf-8

autocmd FileType vim :set foldmethod=marker
autocmd FileType cpp :set foldmethod=indent 
autocmd FileType lua :set foldmethod=syntax
autocmd FileType hpp :set foldmethod=syntax 
autocmd FileType c :set foldmethod=syntax
autocmd FileType h :set foldmethod=syntax 
"}}}

" my key {{{
map ; :
map <S-t> :term<CR>
"打开关闭折叠
imap <A-[> <ESC>zai
map <A-[> za
"运行项目
imap <C-b> <ESC>;sp<CR><C-w><Down>;term task<CR>
map <C-b> ;sp<CR><C-w><Down>;term task<CR>
"调试
map <f5> :Termdebug a.exe<CR>
map <A-c> :Continue<CR>
map <A-b> :Break<CR>
"强制关闭
map <A-q> ;bd!<CR>
"切换buffer
imap <S-Left> <ESC>:bp<CR>i
imap <S-Right> <ESC>:bn<CR>i
map <S-Left> :bp<CR>
map <S-Right> :bn<CR>
"保存
map <C-s> :w<CR>
"防止f?键被占用
map <A-1> <f1>
map <A-2> <f2>
map <A-3> <f3>
map <A-4> <f4>
map <A-5> <f5>
map <A-6> <f6>
map <A-7> <f7>
map <A-8> <f8>
map <A-9> <f9>
map <A-0> <f10>
" }}}
