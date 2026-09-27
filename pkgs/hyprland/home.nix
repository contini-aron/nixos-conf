# hyprland home manager
{ pkgs, lib, config, ... }:

  let
    # startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    #   ${pkgs.waybar}/bin/waybar &
    #   ${pkgs.swww}/bin/swww init &
    #
    #   sleep 1
    #
    #   ${pkgs.swww}/bin/swww img ${../../resources/wallpapers/default.png} &
    # '';
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      noctalia-shell
    '';
    lua = lib.generators.mkLuaInline;
in
  # ${pkgs.swww}/bin/swww-daemon &
  # ${pkgs.swww}/bin/dunst &
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    settings = {
      config = {
        general = {
          gaps_out = 1;
          gaps_in = 1;
        };
        ecosystem = {
          no_donation_nag = true;
        };
      };

      # TODO: windowrule (border_size 0 on tiled windows in workspace w[t1])
      # was dropped during the hyprlang -> lua migration: the lua `window_rule`
      # table's `match.*` field names (floating state, workspace matcher) aren't
      # confirmed yet, so re-add once that's verified against the wiki.

      # bindings
      bind = [
        { _args = [ "SUPER + T" (lua "hl.dsp.exec_cmd(\"ghostty\")") ]; }
        { _args = [ "SUPER + B" (lua "hl.dsp.exec_cmd(\"chromium\")") ]; }
        { _args = [ "SUPER + Q" (lua "hl.dsp.window.close()") ]; }
        { _args = [ "SUPER + M" (lua "hl.dsp.exit()") ]; }
        { _args = [ "SUPER + F" (lua "hl.dsp.window.fullscreen({ action = \"toggle\", mode = \"fullscreen\" })") ]; }
        { _args = [ "SUPER + F" (lua "hl.dsp.exec_cmd(\"notify-send -h string:x-canonical-private-synchronous:hypr-cfg -u low 'Toggled fullscreen'\")") ]; }

        # searchbar
        { _args = [ "SUPER + SPACE" (lua "hl.dsp.exec_cmd(\"noctalia-shell ipc call launcher toggle\")") ]; }

        # move focus
        { _args = [ "SUPER + j" (lua "hl.dsp.focus({ direction = \"d\" })") ]; }
        { _args = [ "SUPER + k" (lua "hl.dsp.focus({ direction = \"u\" })") ]; }
        { _args = [ "SUPER + l" (lua "hl.dsp.focus({ direction = \"r\" })") ]; }
        { _args = [ "SUPER + h" (lua "hl.dsp.focus({ direction = \"l\" })") ]; }

        # switch workspace
        { _args = [ "SUPER + 1" (lua "hl.dsp.focus({ workspace = 1 })") ]; }
        { _args = [ "SUPER + 2" (lua "hl.dsp.focus({ workspace = 2 })") ]; }
        { _args = [ "SUPER + 3" (lua "hl.dsp.focus({ workspace = 3 })") ]; }
        { _args = [ "SUPER + 4" (lua "hl.dsp.focus({ workspace = 4 })") ]; }
        { _args = [ "SUPER + 5" (lua "hl.dsp.focus({ workspace = 5 })") ]; }
        { _args = [ "SUPER + 6" (lua "hl.dsp.focus({ workspace = 6 })") ]; }
        { _args = [ "SUPER + 7" (lua "hl.dsp.focus({ workspace = 7 })") ]; }
        { _args = [ "SUPER + 8" (lua "hl.dsp.focus({ workspace = 8 })") ]; }
        { _args = [ "SUPER + 9" (lua "hl.dsp.focus({ workspace = 9 })") ]; }
        { _args = [ "SUPER + 0" (lua "hl.dsp.focus({ workspace = 10 })") ]; }
        { _args = [ "SUPER + ALT + j" (lua "hl.dsp.focus({ workspace = \"e-1\" })") ]; }
        { _args = [ "SUPER + ALT + k" (lua "hl.dsp.focus({ workspace = \"e+1\" })") ]; }

        # move to workspace
        { _args = [ "SUPER + SHIFT + 1" (lua "hl.dsp.window.move({ workspace = 1, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 2" (lua "hl.dsp.window.move({ workspace = 2, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 3" (lua "hl.dsp.window.move({ workspace = 3, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 4" (lua "hl.dsp.window.move({ workspace = 4, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 5" (lua "hl.dsp.window.move({ workspace = 5, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 6" (lua "hl.dsp.window.move({ workspace = 6, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 7" (lua "hl.dsp.window.move({ workspace = 7, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 8" (lua "hl.dsp.window.move({ workspace = 8, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 9" (lua "hl.dsp.window.move({ workspace = 9, follow = true })") ]; }
        { _args = [ "SUPER + SHIFT + 0" (lua "hl.dsp.window.move({ workspace = 10, follow = true })") ]; }
      ];

      # startup script
      on = {
        _args = [
          "hyprland.start"
          (lua ''
            function()
              hl.dispatch(hl.dsp.exec_cmd("${startupScript}/bin/start"))
            end
          '')
        ];
      };
    };
  };
}
