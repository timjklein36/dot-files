" Set colorscheme
colorscheme elflord

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Custom function for using vim as $EDITOR for git commit messages.

" This begins the message with '[TICK-123] ', where 'TICK-123' is the
" JIRA ticket (naming convention) start of the branch name, or '[-] ' if
" the branch does not conform to that convention.
function! s:expand_commit_template() abort
  let context = {
        \ 'GIT_BRANCH': matchstr(system('git rev-parse --abbrev-ref HEAD | grep -Eo "^\w+[-_][0-9X]{1,5}" || echo -'), '\p\+'),
        \ 'AUTHOR': 'Tim Klein',
        \ }

  let lnum = nextnonblank(1)
  while lnum && lnum < line('$')
    call setline(lnum, substitute(getline(lnum), '\${\(\w\+\)}',
          \ '\=get(context, submatch(1), submatch(0))', 'g'))
    let lnum = nextnonblank(lnum + 1)
  endwhile
endfunction

autocmd BufRead */.git/COMMIT_EDITMSG call s:expand_commit_template()
