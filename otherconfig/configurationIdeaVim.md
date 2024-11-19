### My Current Configuration of IdeaVim

---

```bash

let mapleader=" "

""" Plugins --------------------------------
set surround
set multiple-cursors
set commentary
set argtextobj
set easymotion
set textobj-entire
set ReplaceWithRegister
set exchange

" Trying the new syntax
Plug 'machakann/vim-highlightedyank'
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Don't use Ex mode, use Q for formatting.
map Q gq

" --- Enable IdeaVim plugins https://jb.gg/ideavim-plugins

" Highlight copied text
Plug 'machakann/vim-highlightedyank'
" Commentary plugin
Plug 'tpope/vim-commentary'

let g:argtextobj_pairs="[:],(:),<:>"
map <C-n> <Plug>NextWholeOccurrence

""" Common settings -------------------------
set showmode
set so=5
set incsearch
set nu

""" Idea specific settings ------------------
set ideajoin

""" My Mappings -----------------------------
map <leader>e <Action>(Run)
map <leader>x <Action>(Stop)
map <leader>d <Action>(Debug)
map <leader>f <Action>(Find)
map <leader>fa <Action>(FindInPath)
map <leader>a <Action>(Annotate)
map <leader>i <Action>(ShowHoverInfo)
map <leader>n <Action>(QuickImplementations)
map <leader>p <Action>(RecentFiles)
map <leader>z <Action>(ToggleDistractionFreeMode)
map <leader>w <Action>(CloseEditor)
map <leader>q <Action>(CloseActiveTab)
map S <Action>(SaveAll)
vmap <leader>r <Action>(ReformatCode)
map <leader>r <Action>(ReformatCode)

""" Create and Navigate in Splits
map zb <Action>(SplitVertically)
map zv <Action>(SplitHorizontally)
nmap zh <C-w>h
nmap zl <C-w>l
nmap zj <C-w>j
nmap zk <C-w>k

""" Create and Navigate in Windows
map <C-h> <Action>(NextTab)
map <C-l> <Action>(PreviousTab)
map Q <Action>(CloseAllEditors)

""" Go to File & Class
map <leader>ff <Action>(GotoFile)
map <leader>fb <Action>(GotoClass)

""" Go to Exit mode of the Insert mode
imap qq <Esc>
imap QQ <Esc>
nnoremap qq <Esc>

""" Go to Exit mode of the Visual mode
vmap qq <Esc>

""" Go to Exit mode of the Command mode
cmap qq <Esc>

""" Go to end of word
map L $

""" Go to beginnig of word
map H 0w

""" Line break in normal mode
map <leader><Tab> o<Esc>

""" Global Copy
map <leader>c "+y

""" Global Paste
map <leader>v "+p

""" Word Copy
map <leader>C viw"+y

""" Word Paste
map <leader>V viw"+p

""" Select a word
map <leader>s viw

""" Tab in normal mode
map <S-Tab> I<Tab><Esc>

```
