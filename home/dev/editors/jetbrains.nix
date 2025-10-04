{ ...}: {
  home.file.".ideavimrc".text = ''
    let mapleader = ' '
    nnoremap <leader> <Nop>
    set clipboard+=unnamedplus

    nnoremap K :action QuickJavaDoc<CR>

    nnoremap <leader>d :action ShowErrorDescription<CR>
    nnoremap <leader>ca :action ShowIntentionActions<CR>
    nnoremap <leader>rn :action RenameElement<CR>

    nnoremap gd :action GotoDeclaration<CR>
    nnoremap gD :action GotoTypeDeclaration<CR>
    nnoremap gi :action GotoImplementation<CR>
    nnoremap gf :action OpenFile<CR>

    nnoremap H ^
    nnoremap L $
  '';
}
