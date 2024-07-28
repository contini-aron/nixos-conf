# hyprland home manager
{ pkgs, lib, config, ... }:

  let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.waybar}/bin/waybar &
      ${pkgs.swww}/bin/swww init &
      ${pkgs.swww}/bin/dunst &
  
      sleep 1
  
      ${pkgs.swww}/bin/swww img ${../../resources/wallpapers/default.png} &
    '';
in
{
  wayland.windowManager.hyprland = {
    enable = true;


    settings = {
      "$mainmod" = "SUPER";
      "$notyficmd" = "notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low";
      general = {
        gaps_out = 1;
        gaps_in = 1;
      };

      windowrulev2 = [
	"noborder, onworkspace:w[t1]"
      ];
      # bindings
      bind = [
        "$mainmod, T, exec, kitty"
        "$mainmod, B, exec, brave"
        "$mainmod, Q, killactive"
        "$mainmod, M, exit"
        "$mainmod, F, fullscreen"
        "$mainmod, F, exec, $notifycmd 'Toggled fullscreen'"

	# searchbar
        "$mainmod, SPACE, exec, rofi -show drun -show-icons"

        # move focus
        "$mainmod, j, movefocus, d"
        "$mainmod, k, movefocus, u"
        "$mainmod, l, movefocus, r"
        "$mainmod, h, movefocus, l"

        # switch workspace
        "$mainmod, 1, workspace, 1"
        "$mainmod, 2, workspace, 2"
        "$mainmod, 3, workspace, 3"
        "$mainmod, 4, workspace, 4"
        "$mainmod, 5, workspace, 5"
        "$mainmod, 6, workspace, 6"
        "$mainmod, 7, workspace, 7"
        "$mainmod, 8, workspace, 8"
        "$mainmod, 9, workspace, 9"
        "$mainmod, 0, workspace, 10"
        "$mainmod ALT, j, workspace, e-1"
        "$mainmod ALT, k, workspace, e+1"

	# move to workspace
        "$mainmod SHIFT, 1, movetoworkspace, 1"
        "$mainmod SHIFT, 2, movetoworkspace, 2"
        "$mainmod SHIFT, 3, movetoworkspace, 3"
        "$mainmod SHIFT, 4, movetoworkspace, 4"
        "$mainmod SHIFT, 5, movetoworkspace, 5"
        "$mainmod SHIFT, 6, movetoworkspace, 6"
        "$mainmod SHIFT, 7, movetoworkspace, 7"
        "$mainmod SHIFT, 8, movetoworkspace, 8"
        "$mainmod SHIFT, 9, movetoworkspace, 9"
        "$mainmod SHIFT, 0, movetoworkspace, 10"
      ];
      
      # startup script
      exec-once = ''${startupScript}/bin/start'';
    };
  };
}
