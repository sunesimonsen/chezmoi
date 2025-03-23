" -- Options to add `gf` functionality inside `.lua` files.
" -- vim.opt.include = [=[\[[^\]]+\]\(\zs[^\)]+\ze\)]=]
" --
" -- local set_tagfunc = vim.fn[vim.api.nvim_exec2 [[
" --   func s:set_tagfunc(val)
" --     let &l:tagfunc = a:val
" --   endfunc
" --   echon get(function('s:set_tagfunc'), 'name')
" -- ]]]
" --
" -- vim.opt.includeexpr = function()
" --   print 'wat'
" -- end

function! s:ResolveDenote(val)
    let id = substitute(a:val, '\.id$', '', '')
    return globpath(expand('%:p:h'), id . '*')
endfunction

setlocal includeexpr=s:ResolveDenote(v:fname)

setlocal conceallevel=2

setlocal breakindent                     " keep indentation when lines break
setlocal breakindentopt=shift:2          " but shift it by 2 spaces
setlocal linebreak                       " break only at specific characters, :h breakat
setlocal textwidth=80
