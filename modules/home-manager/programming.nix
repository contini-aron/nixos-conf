
{ pkgs,... }:

{
  home.packages = with pkgs; [
   # k8s
    go
    rustc
    gh
  ];

  programs.bash.enable = true;

  imports = [
    # ../../pkgs/nixvim/home.nix
  ];

}
