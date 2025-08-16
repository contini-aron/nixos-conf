{ pkgs, config, lib, ... }:
    let
       colors = config.lib.stylix.colors;
    in
{

  # wallpaper daemon
  services.swww.enable = true;
  # notification daemon
  services.dunst = {
    enable = true;
    settings = {
      global = {
        transparency = 50;
        offset = "(10,10)";
        origin = "top-right";
      };
    };
  };
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          path = "${../../resources/wallpapers/default.png}";
          blur_passes = 3;
          blur_size = 1;
        }
      ];
      input-field = [
        {
          size = "400, 50";
          position = "0, -200";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(${colors.base01-rgb-r}, ${colors.base01-rgb-g}, ${colors.base01-rgb-b})";
          outer_color = "rgb(${colors.base02-rgb-r}, ${colors.base02-rgb-g}, ${colors.base02-rgb-b})";
          inner_color = "rgb(${colors.base04-rgb-r}, ${colors.base04-rgb-g}, ${colors.base04-rgb-b})";
          outline_thickness = 5;
          placeholder_text = "'\'Password...'\'";
          shadow_passes = 2;
        }
      ];
    };
  };

  home.packages = with pkgs; [
    base16-schemes
  ];
  # colorscheme
  # stylix.base16Scheme = {
  #   base00 = "32302f"; # ----
  #   base01 = "3c3836"; # ---
  #   base02 = "504945"; # --
  #   base03 = "665c54"; # -
  #   base04 = "bdae93"; # +
  #   base05 = "d5c4a1"; # ++
  #   base06 = "ebdbb2"; # +++
  #   base07 = "fbf1c7"; # ++++
  #   base08 = "fb4934"; # red
  #   base09 = "fe8019"; # orange
  #   base0A = "fabd2f"; # yellow
  #   base0B = "b8bb26"; # green
  #   base0C = "8ec07c"; # aqua/cyan
  #   base0D = "83a598"; # blue
  #   base0E = "d3869b"; # purple
  #   base0F = "d65d0e"; # brown
  # };

  stylix.image = /home/aron/flake/resources/wallpapers/default.png;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-soft.yaml";
  stylix.targets.waybar.enable = false;
  imports = [
    ../../pkgs/hyprland/home.nix
    ../../pkgs/waybar/home.nix
    ../../pkgs/ferdium/home.nix
    ../../pkgs/eww/home.nix
  ];
}
