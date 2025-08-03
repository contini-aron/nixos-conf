{ pkgs, lib, config, inputs, ... }:
{
  # portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # hyprland enable
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  environment.systemPackages = with pkgs; [
    # wallpaper
    swww

    # app launcher
    rofi-wayland
    
    # utilities
    tree
  ];
}
