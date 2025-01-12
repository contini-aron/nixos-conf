
{ pkgs,... }:

{
  home.packages = with pkgs; [
   # k8s
    go
    rustc
  ];

  programs.bash.enable = true;

  imports = [
    ../../pkgs/nixvim/home.nix
  ];

}
