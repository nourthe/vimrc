map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
