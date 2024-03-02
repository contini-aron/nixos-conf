# home.nix

{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.gruvbox.enable = true;
    options = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2;        # Tab width should be 2
    };

    plugins = { 

      telescope.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;

      # lsp
      lsp.enable = true;
      lsp.servers = {
	# nix lsp
	nixd.enable = true;
      };
      # completion
      nvim-cmp = {
	enable = true;
	autoEnableSources = true;
	sources = [
	  {name = "nvim_lsp";}
	  {name = "path";}
	  {name = "buffer";}
	  {name = "luasnip";}
	];
	mapping = {
	  "<CR>" = "cmp.mapping.confirm({ select = true })";
	  "<Tab>" = {
	    action = ''
	      function(fallback)
		if cmp.visible() then
		  cmp.select_next_item()
		elseif luasnip.expandable() then
		  luasnip.expand()
		elseif luasnip.expand_or_jumpable() then
		  luasnip.expand_or_jump()
		elseif check_backspace() then
		  fallback()
		else
		  fallback()
		end
	      end
	    '';
	    modes = [ "i" "s" ];
	  };
	};
      };

    };
  };
}
