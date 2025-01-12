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
      theme = "GruvboxDark";
      font-size = 11;
      font-family = "CaskayidiaCove Mono";
    };
  };
}
