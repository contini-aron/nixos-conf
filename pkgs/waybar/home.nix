{ pkgs, lib, config, ... }:
let
  font = "FiraCode Nerd Font";
  fontsize = "12";
  primary_accent = "${config.lib.stylix.colors.base04}";
  secondary_accent = "${config.lib.stylix.colors.base08}";
  tertiary_accent = "${config.lib.stylix.colors.base0A}";
  background = "${config.lib.stylix.colors.base02}";
  opacity = ".85";
  cursor = "Numix-Cursor";
in
{
  programs.waybar = {
    enable = true;
    style = 
	''
	  * {
	      border: none;
	      border-radius: 0px;
	      font-family: ${font};
	      font-size: 12px;
	      min-height: 0;
	  }

	  window#waybar {
	      background-color: rgba(0, 0, 0, 0.0);
	  }

	  #workspaces {
	      background: #${background};
	      margin: 5px 5px;
	      padding: 8px 5px;
	      border-radius: 16px;
	      color: #${primary_accent}
	  }
	  #workspaces button {
	      padding: 0px 5px;
	      margin: 0px 3px;
	      border-radius: 16px;
	      color: #${primary_accent};
	      background-color: transparent;
	      transition: all 0.3s ease-in-out;
	  }

	  #workspaces button.active {
	      color: #${background};
	      background-color: #${primary_accent};
	      border-radius: 16px;
	      min-width: 20px;
	      background-size: 400% 400%;
	      transition: all 0.3s ease-in-out;
	  }

	  #workspaces button:hover {
	      background-color: #${tertiary_accent};
	      color: #${background};
	      border-radius: 16px;
	      min-width: 50px;
	      background-size: 400% 400%;
	  }

	  #cpu, #memory, #tray, #pulseaudio, #network, #battery {
	      background: #${background};
	      font-weight: bold;
	      margin: 5px 0px;
	  }

	  #cpu, #memory {
	      color: #${primary_accent};
	      border-radius: 24px 10px 24px 10px;
	      padding: 0 20px;
	      margin-left: 7px;
	  }

	  #tray, #pulseaudio, #network, #battery{
	      color: #${primary_accent};
	      border-radius: 10px 24px 10px 24px;
	      padding: 0 20px;
	      margin-left: 7px;
	  }

    #custom-poweroff, #custom-reboot, #custom-lock-screen {
	      color: #${secondary_accent};
	      background-color: #${background};
	      font-weight: bold;
	      font-size: 15px;
	  }
    #custom-poweroff:hover, #custom-reboot:hover, #custom-lock-screen:hover {
	      color: #${tertiary_accent};
	      background-color: #${background};
	      font-weight: bold;
	      font-size: 15px;
	  }
    #custom-lock-screen {
	      border-radius: 0px 0px 40px 0px;
        padding-right: 15px;
	  }

	  #clock {
	      color: #${tertiary_accent};
	      background-color: #${background};
	      border-radius: 0px 0px 0px 40px;
	      padding: 0px 0px 0px 25px;
	      margin-left: 7px;
	      font-weight: bold;
	      font-size: 12px;
	  }

	  #window{
	      background: #${background};
	      padding-left: 15px;
	      padding-right: 15px;
	      border-radius: 16px;
	      margin-top: 5px;
	      margin-bottom: 5px;
	      font-weight: normal;
	      font-style: normal;
	  }
	'';
    settings = {
      mainBar = {
      position = "top";
      layer = "top";
      height = 42;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;
      modules-left = [
        "custom/poweroff"
        "custom/reboot"
        "custom/lock-screen"
        "memory"
        "cpu"
      ];
      modules-center = [
        "hyprland/workspaces"
      ];
      modules-right = [
        "tray"
        "battery"
        "pulseaudio"
        "network"
        "clock"
      ];
      clock = {
        format = "󰥔  {:%a, %d %b, %I:%M %p}";
        tooltip = "true";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "   {:%d/%m}";
      };
      "hyprland/workspaces" = {
        active-only = false;
        all-outputs = false;
        disable-scroll = false;
        on-scroll-up = "hyprctl dispatch workspace e-1";
        on-scroll-down = "hyprctl dispatch workspace e+1";
        format = "{name}";
        on-click = "activate";
        format-icons = {
          urgent = "";
          active = "";
          default = "";
          sort-by-number = true;
        };
      };
      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon}  {capacity}%";
        format-charging = "  {capacity}%";
        format-plugged = " {capacity}% ";
        format-alt = "{icon} {time}";
        format-icons = [ "" "" "" "" "" ];
      };
      "custom/hello-from-waybar" = {
        format = "hello {}";
        max-length = 40;
        interval = "once";
        exec = pkgs.writeShellScript "hello-from-waybar" ''
          echo "from within waybar"
        '';
      };
      "custom/lock-screen" = {
        on-click = "hyprlock";
        format =  "  ";
      };
      "custom/poweroff" = {
        on-click = "poweroff";
        format =  "  ";
      };
      "custom/reboot" = {
        on-click = "reboot";
        format =  "  ";
      };
  
      memory = {
        format = "󰍛 {}%";
        format-alt = "󰍛 {used}/{total} GiB";
        interval = 5;
      };
      cpu = {
        format = "󰻠 {usage}%";
        format-alt = "󰻠 {avg_frequency} GHz";
        interval = 5;
      };
      network = {
        format-wifi = "  {signalStrength}%";
        format-ethernet = "󰈀 100% ";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "󰖪 0% ";
      };
      tray = {
        icon-size = 20;
        spacing = 8;
      };
      pulseaudio = {
        format = "{icon} {volume}%";
        format-muted = "󰝟";
        format-icons = {
          default = [ "󰕿" "󰖀" "󰕾" ];
        };
        # on-scroll-up= "bash ~/.scripts/volume up";
        # on-scroll-down= "bash ~/.scripts/volume down";
        scroll-step = 5;
        on-click = "pulsemixer";
      };
    };
    };
  };
}
