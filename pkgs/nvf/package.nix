{ pkgs, ... }:
{
  vim = {
    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      };
    lineNumberMode = "relative";
    diagnostics = {
      enable = true;
      config = {
      virtual_text = true;
      update_in_insert = true;
      };
    };
    options = {
      number = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      wrap = false;
      };
    lsp.enable = true;
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
    binds.whichKey.enable = true;
    visuals = {
      nvim-web-devicons.enable = true;
    };
    autocomplete.nvim-cmp.enable = true;
    telescope.enable = true;
    treesitter.enable = true;
    statusline.lualine.enable = true;
    mini = {
      # statusline.enable = true;
      # file navigation
      files.enable = true;
      # start screen
      starter.enable = true;
      # show indentation lines
      indentscope.enable = true;
    };
    extraPackages = [ pkgs.fzf pkgs.ripgrep ];
    extraPlugins = {
      harpoon = {
        package = pkgs.vimPlugins.harpoon;
        setup = ''
          require('harpoon').setup { }
          require("telescope").load_extension('harpoon') 
          '';
      };
    };
    keymaps = [
      # mini
      { key = "<leader>mf"; mode = ["n"]; action = ":lua MiniFiles.open()<CR>"; }
      # harpoon marks
      { key = "<leader>hh"; mode = ["n"]; action = ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>"; }
      { key = "<leader>ha"; mode = ["n"]; action = ":lua require(\"harpoon.mark\").add_file()<CR>"; }
      { key = "<leader>hk"; mode = ["n"]; action = ":lua require(\"harpoon.ui\").nav_next()<CR>"; }
      { key = "<leader>hj"; mode = ["n"]; action = ":lua require(\"harpoon.ui\").nav_prev()<CR>"; }
    ];
  };
}
