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
    jq
    neomutt
    mutt-wizard
    pass
    isync
    lynx
    zellij
  ];

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableSshSupport = true;
    # pinentryFlavor = "qt";
    pinentryPackage = pkgs.pinentry-qt;
    enableScDaemon = true;
  };
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
