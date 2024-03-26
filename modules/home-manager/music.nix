# home.nix

{ pkgs, nixpkgs, lib, config, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
   # k8s
   pulsemixer
    ardour
    reaper
    zrythm
    qpwgraph
    vital
    odin2
    surge
    x42-avldrums
    decent-sampler
    freetype
  ];
}
