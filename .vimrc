syntax enable
set autoindent "C-like configurable autoindent
set nocompatible

" color scheme
set background=dark "dark BG
set t_Co=256 "use 256 colors
colorscheme solarized

set number "display line numbers
set showmatch
set hlsearch
set incsearch
set ignorecase "case-insensitive search
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"set smarttab
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize "session save options
set backspace=indent,eol,start "remove tabs and whitespace with del and backspace

"set whitespace characters
set listchars=tab:->,eol:$,trail:.,extends:#

"display whitespace characters
set list

"SO - open session
nmap SO :wa<CR>:so ~/.vim/sessions/

"SA - save session as 
nmap SSA :wa<CR>:mksession! ~/.vim/sessions/

"alt+left, alt+right - switch to prev or next tab
nmap <A-right> :tabnext<CR>
nmap <A-left> :tabprevious<CR>

"ctrl+e - alias for default zencoding hotkey
imap <C-e> <C-y>,

"function for F2 hotkey
function SaveSession()
	if (v:this_session == "")
		let session = $HOME . "/.vim/sessions/" . input("Enter session name: ~/.vim/sessions/")
		if filereadable(session)
			echo "\n" . "Not saved: this session already exists."
		else
			wa
			exe "mks! " . session
			echo "\n" . "Session saved."
		endif

	else
		wa
		exe "mks! " . v:this_session
		echo "Session saved in " . v:this_session
	endif
endfunction

"F2 - save current session. If there is no session open, save session as
nmap <F2> :call SaveSession()<CR>
