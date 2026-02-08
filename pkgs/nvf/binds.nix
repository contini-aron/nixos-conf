{ lib, ... }:
{
  vim = {
    binds.whichKey = {
      enable = true;
      register = lib.mkForce {
        # Telescope/Find group
        "<leader>f" = "Find/Telescope";
        "<leader>ff" = "Find files";
        "<leader>fg" = "Live grep";
        "<leader>fb" = "Buffers";
        "<leader>fh" = "Help tags";
        "<leader>fr" = "Recent files";
        "<leader>fk" = "Keymaps";
        "<leader>fc" = "Commands";
        "<leader>fm" = "Marks";
        "<leader>fs" = "Document symbols";
        "<leader>fS" = "Workspace symbols";

        # Harpoon group
        "<leader>h" = "Harpoon";
        "<leader>ha" = "Harpoon add";
        "<leader>hh" = "Harpoon list";
        "<leader>hj" = "Harpoon prev";
        "<leader>hk" = "Harpoon next";

        # Git group
        "<leader>g" = "Git";
        "<leader>gb" = "Blame line";
        "<leader>gD" = "Diff project";
        "<leader>gd" = "Diff this";
        "<leader>gP" = "Preview hunk";
        "<leader>gR" = "Reset buffer";
        "<leader>gr" = "Reset hunk";
        "<leader>gS" = "Stage buffer";
        "<leader>gs" = "Stage hunk";
        "<leader>gu" = "Undo stage hunk";

        # Git hunks navigation
        "<leader>g[" = "Hunks";
        "<leader>g[c" = "Previous hunk";
        "<leader>g]" = "Hunks";
        "<leader>g]c" = "Next hunk";

        # Git toggles
        "<leader>gt" = "Toggle";
        "<leader>gtb" = "Toggle blame";
        "<leader>gtd" = "Toggle deleted";

        # LSP group (these are already mapped, just labeling them)
        "<leader>l" = "LSP";
        "<leader>la" = "Code action";
        "<leader>lf" = "Format";
        "<leader>ln" = "Rename symbol";
        "<leader>ls" = "Signature help";
        "<leader>lh" = "Trigger hover";
        "<leader>le" = "Diagnostic float";
        "<leader>lH" = "Document highlight";
        "<leader>lS" = "Document symbols";

        # LSP toggles
        "<leader>lt" = "Toggle";
        "<leader>ltf" = "Toggle format on save";

        # LSP go to
        "<leader>lg" = "Go to";
        "<leader>lgd" = "Go to definition";
        "<leader>lgD" = "Go to declaration";
        "<leader>lgt" = "Go to type";
        "<leader>lgi" = "List implementations";
        "<leader>lgr" = "List references";
        "<leader>lgn" = "Go to next diagnostic";
        "<leader>lgp" = "Go to previous diagnostic";

        # LSP workspace
        "<leader>lw" = "Workspace";
        "<leader>lwa" = "Add workspace folder";
        "<leader>lwr" = "Remove workspace folder";
        "<leader>lwl" = "List workspace folders";
        "<leader>lws" = "List workspace symbols";

        # Mini commands
        "<leader>m" = "Mini";
        "<leader>mf" = "Mini files";
      };
    };

    keymaps = [
      # mini
      {
        key = "<leader>mf";
        mode = [ "n" ];
        action = ":lua MiniFiles.open()<CR>";
      }
      # harpoon marks
      # { key = "<leader>hh"; mode = ["n"]; action = ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>"; }
      # { key = "<leader>ha"; mode = ["n"]; action = ":lua require(\"harpoon.mark\").add_file()<CR>"; }
      # { key = "<leader>hk"; mode = ["n"]; action = ":lua require(\"harpoon.ui\").nav_next()<CR>"; }
      # { key = "<leader>hj"; mode = ["n"]; action = ":lua require(\"harpoon.ui\").nav_prev()<CR>"; }
    ];
  };
}
