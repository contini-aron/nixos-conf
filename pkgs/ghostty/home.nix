{ pkgs, ... }:

{
  # home.packages = with pkgs; [
  #   ghostty
  # ];
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    installVimSyntax = true;
    settings = {
      theme = "Gruvbox Dark";
      font-size = 11;
      font-family = "CaskayidiaMono Nerd Font";
      keybind = [
        "performable:ctrl+c=copy_to_clipboard"
      ];
    };
  };
}
