{
  imports = [
    ../../pkgs/starship/home.nix
  ];

  programs.atuin.enable = true;
  programs.atuin.enableBashIntegration = true;
}
