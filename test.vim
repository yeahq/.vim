
let dict = {'phone' : 123}
let dict.name = "John Doe"
echo dict

augroup testgroup
    autocmd BufWrite * echom "Foo"
    autocmd BufWrite * echom "Bar"
augroup END

augroup testgroup
    autocmd BufWrite * echom "Baz"
augroup END

augroup testgroup
    autocmd!
    autocmd BufWrite * echom "cat"
augroup END

print foo(bbarar) 

