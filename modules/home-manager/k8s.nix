# home.nix

{ pkgs, lib, config, inputs, ... }:

{
  home.packages = with pkgs; [
   # k8s
    gnumake
    go
    kind
    kubectl
    operator-sdk
    qemu
    quickemu
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      k = "kubectl";
    };

  };

}
