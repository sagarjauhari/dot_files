" If using macvim then map Cmd + t to CtrlP
if has ("gui_macvim")
  :macmenu File.New\ Tab key=<nop>
  nnoremap <D-t> :<C-U>CtrlP<CR>
endif
