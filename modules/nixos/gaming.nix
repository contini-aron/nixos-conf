{ pkgs, lib, config, ... }:
{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      gamescopeSession.enable = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];

    };
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    prismlauncher
    discord
  ];
}
