{ pkgs, lib, config, inputs, ... }:
{
  imports = [
    ../../pkgs/starship/home.nix
    ../../pkgs/lf/home.nix
    ../../pkgs/ghostty/home.nix
  ];
  home.packages = with pkgs; [
   # k8s
   yq
  ];
  # file previewer
  programs.pistol.enable = true;

  programs.atuin.enable = true;
  programs.atuin.enableBashIntegration = true;
  programs.jq.enable = true;
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash.shellAliases = {
    ll = "eza -l";
    la = "eza -la";
  };
}
