# nvim.nix

{ pkgs, inputs, ... }:

{
  # packages needed on the config
  home.packages = with pkgs; [
    ripgrep
  ];

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    keymaps = [
      { action = "<Esc>"; key = "jk"; mode = "i"; }
      { action = "<Esc>"; key = "kj"; mode = "i"; }
      { action = ":"; key = ","; mode = "n"; }
      { action = ":Telescope<CR>"; key = "<leader>f"; mode = "n"; }
    ];
    colorschemes.gruvbox.enable = true;
    globals.mapleader = " ";
    opts = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
    };
    plugins = { 
      # UI
      web-devicons.enable = true;
      noice.enable = true;
      notify.enable = true;
      lualine.enable = true;
      # fuzzy finder
      telescope = {
	enable = true;
	keymaps = {
	  "<leader>ff" = {
	    action = "find_files";
	  };
	  "<leader>fg" = {
	  action = "git_files";
	  };
	};
      };
      mini.enable = true;
      harpoon = {
	enable = true;
	enableTelescope = true;	# telescope integration
	markBranch = true; 	# specific harpoon for git branches
	keymaps = {
	  toggleQuickMenu = "<leader>hh";
	  addFile = "<leader>ha";
	  navPrev = "<leader>hk";
	  navNext = "<leader>hj";
	};
      };
      # sintax highlighting
      treesitter.enable = true;
      treesitter.settings.highlight.enable = true;
      # snippets
      luasnip.enable = true;
      # comments
      comment.enable = true;

      # lsp
      lsp.enable = true;
      lsp.servers = {
	# nix lsp
	#nixd.enable = true;
	rust_analyzer = {
	  enable = true;
	  # do not automatically install cargo
	  installCargo = false;
	  installRustc = false;
	};
	terraformls.enable = true;
      };
      
      # completion
      cmp = {
	enable = true;
	autoEnableSources = true;
	settings.sources = [
	  {name = "nvim_lsp";}
	  {name = "luasnip";}
	  {name = "path";}
	  {name = "buffer";}
	];
	settings.snippet.expand = ''
	  function(args)
	    require('luasnip').lsp_expand(args.body)
	  end
	'';
	settings.mapping = {
	  "<CR>" = "cmp.mapping.confirm({ select = true })";
	  "<Tab>" = ''
	    cmp.mapping(
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
	    ,
	    { "i", "s" }
	  )
	  '';
	};
      };

    };
    extraConfigLua = ''
    -- Print a little welcome message when nvim is opened!
    print("Hello world!")
    '';
  };
}
