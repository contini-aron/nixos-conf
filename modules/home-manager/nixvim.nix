# nvim.nix

{ pkgs, lib, config, inputs, ... }:

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
    options = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
    };
    plugins = { 
      # UI
      noice.enable = true;
      notify.enable = true;
      lualine.enable = true;
      # fuzzy finder
      telescope = {
	enable = true;
	keymaps = {
	  "<leader>ff" = {
	    action = "find_files";
	    desc = "find files in workdir";
	  };
	  "<leader>fg" = {
	  action = "git_files";
	  desc = "search files in git repo";
	  };
	};
      };
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
      # snippets
      luasnip.enable = true;
      # comments
      comment-nvim.enable = true;
      # which key
      which-key = {
        enable = true;
	registrations = {
	  "<leader>h" = "Harpoon";
	  "<leader>ha" = "add file";
	  "<leader>hh" = "open quick menu";
	  "<leader>hj" = "open next file";
	  "<leader>hk" = "open prev file";
	};
      };

      # lsp
      lsp.enable = true;
      lsp.servers = {
	# nix lsp
	#nixd.enable = true;
	rust-analyzer = {
	  enable = true;
	  # do not automatically install cargo
	  installCargo = false;
	  installRustc = false;
	};
      };
      
      # completion
      cmp.settings = {
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
    extraConfigLua = ''
    -- Print a little welcome message when nvim is opened!
    print("Hello world!")
    '';
  };
}
