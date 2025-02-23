# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, neovim-conf, lib, config, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.default
      inputs.nvf.nixosModules.default
      ./hardware-configuration.nix
      ../../modules/nixos/default.nix
    ];


  #nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aron = {
    isNormalUser = true;
    description = "aron";
    extraGroups = [ "networkmanager" "wheel" "audio" "libvirtd" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "aron" = import ./home.nix;
    };
  };

  # # fonts
  # fonts.packages = with pkgs; [
  #   (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  # ];

   fonts.packages = [
	 pkgs.nerd-fonts.fira-code
	 pkgs.nerd-fonts.droid-sans-mono
	 pkgs.nerd-fonts.caskaydia-mono
   ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # custom neovim-conf
    neovim-conf

    spotify
    ferdium

    tree
    dolphin

    #stats
    btop
    nh
    nix-output-monitor
    nvd

    # programming
    git
    neovim
    typora

    # bar
    waybar
    capture

    # colorschemes
    base16-schemes
    # wallpaper
    swww

    ngrok

    # app launcher
    rofi-wayland
    
    #notification daemon
    mako
    libnotify

    # discord
    vesktop

    libreoffice-qt-fresh

    lutris

    # floorp
    floorp
    
    rustup
  ];

  # portals
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  

  # hyprland enable
  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
