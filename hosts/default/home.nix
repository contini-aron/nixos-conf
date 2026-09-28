{ config, pkgs, inputs, self, ... }:

{
  imports = [
    inputs.stylix.homeModules.stylix
    inputs.noctalia.homeModules.default
    ../../modules/home-manager/default.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "aron";
  home.homeDirectory = "/home/aron";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  # };

  home.file.".local/share/wallpaper.png" = {
      source = "${../../resources/wallpapers/default.png}";
  };
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Gruvbox";
      };
      wallpaper = {
        enabled = true;
        default.path = "${config.home.homeDirectory}/.local/share/wallpaper.png";
      };
      shell = {
        # apps launched from the launcher run as their own transient systemd
        # services instead of children of the noctalia unit, so they survive
        # a noctalia restart and get a clean session environment
        launch_apps_as_systemd_services = true;
      };
      bar.main = {
        # default is 100px inset from each end of the bar; 0 makes it span
        # full-width with no left/right gap
        margin_ends = 0;
      };
      audio = {
        # master toggle for all noctalia theme sounds (notifications,
        # volume-change, power-plug/unplug, screen-capture)
        enable_sounds = false;
      };
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/aron/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
