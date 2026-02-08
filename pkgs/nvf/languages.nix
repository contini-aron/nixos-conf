_:
{
  vim = {
    lsp.enable = true;
    treesitter.enable = true;
    
    languages = {
      nix = {
        enable = true;
        format.enable = true;
        extraDiagnostics.enable = true;
      };
      
      python.enable = true;
      rust.enable = true;
      go.enable = true;
      terraform.enable = true;
      
      # enables treesitter by default for enabled languages
      enableTreesitter = true;
      # enables LSP by default for enabled languages
      # enableLSP = true;
    };
  };
}
