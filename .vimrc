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
