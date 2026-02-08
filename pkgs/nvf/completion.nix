_:
{
  vim = {
    autocomplete.nvim-cmp = {
      enable = true;
      sources = {
        nvim-lsp = "[LSP]";
        buffer = "[Buffer]";
        path = "[Path]";
      };
    };
    
    snippets.luasnip.enable = true;
  };
}
