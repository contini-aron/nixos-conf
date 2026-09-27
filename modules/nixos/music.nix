{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    spotify-player
    tidal-hifi
  ];
}
