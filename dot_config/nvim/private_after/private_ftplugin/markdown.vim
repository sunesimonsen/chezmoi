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

func! s:ResolveDenote(val)
	return globpath(expand('%:p:h'), a:val . '*')
endfun

setlocal includeexpr=s:ResolveDenote(v:fname)

setlocal conceallevel=2
