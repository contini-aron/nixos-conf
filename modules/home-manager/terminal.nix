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

  # programs.gpg.enable = true;
  # services.gpg-agent = {
  #   enable = true;
  #   enableBashIntegration = true;
  #   enableSshSupport = true;
  #   # pinentryFlavor = "qt";
  #   pinentryPackage = pkgs.pinentry-qt;
  #   enableScDaemon = true;
  # };
  programs = {
    # file previewer
    pistol.enable = true;
    atuin.enable = true;
    atuin.enableBashIntegration = true;
    jq.enable = true;
    eza = {
      enable = true;
      enableBashIntegration = true;
    };

    bash = {
      enable = true;
      shellAliases = {
        ll = "eza -l";
        la = "eza -la";
      };
    };
  };


}
