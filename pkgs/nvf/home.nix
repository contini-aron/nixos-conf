
{ pkgs, inputs, ... }:

{
  # packages needed on the config
  home.packages = with pkgs; [
    ripgrep
  ];
}
