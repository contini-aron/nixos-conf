
{ pkgs,... }:

{
  home.packages = with pkgs; [
   # k8s
    go
    rustc
  ];

  imports = [
    ../../pkgs/nixvim/home.nix
  ];

}
