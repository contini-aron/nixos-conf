{
  imports = [
    ../../pkgs/starship/home.nix
    ../../pkgs/lf/home.nix
  ];
  # file previewer
  programs.pistol.enable = true;

  programs.atuin.enable = true;
  programs.atuin.enableBashIntegration = true;
}
