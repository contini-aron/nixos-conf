{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    # ctpv
    pistol
    poppler_utils
    termpdfpy
    mupdf
  ];
  # xdg.configFile."lf/icons".source = ./icons;

  programs.lf = {
    enable = true;
    commands = {
      dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';
      editor-open = ''$$EDITOR $f'';
      mkdir = ''
      ''${{
        printf "Directory Name: "
        read DIR
        mkdir $DIR
      }}
      '';
    };

    keybindings = {

      "\\\"" = "";
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "`" = "mark-load";
      "\\'" = "mark-load";
      "<enter>" = "open";
      
      do = "dragon-out";
      
      "g~" = "cd";
      gh = "cd";
      "g/" = "/";

      ee = "editor-open";
      V = ''$${pkgs.bat}/bin/bat --paging=always --theme=gruvbox "$f"'';

      # ...
    };

    settings = {
      preview = true;
      hidden = true;
      drawbox = true;
      icons = true;
      ignorecase = true;
    };

    extraConfig = 
    let 
      previewer = 
        pkgs.writeShellScriptBin "pv.sh" ''
	  file=$1
	  w=$2
	  h=$3
	  x=$4
	  y=$5
	  if [[ ''${file##*.} == pdf ]]; then
	      # pdftoppm "$file" -scale-to 500 -r 50 -f 1 -l 1 /tmp/show -png
	      mutool convert -O resolution=50 -o /tmp/show.png "$file" 1
	      ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "/tmp/show1.png" < /dev/null > /dev/tty
	      exit 1
	  fi
	 
	  
	  if [[ "$( ${pkgs.file}/bin/file -Lb --mime-type "$file")" =~ ^image ]]; then
	      ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
	      exit 1
	  fi
	  
	  ${pkgs.pistol}/bin/pistol "$file"
      '';
      cleaner = pkgs.writeShellScriptBin "clean.sh" ''
        ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
	rm /tmp/show*.png
      '';
    in
    ''
      set cleaner ${cleaner}/bin/clean.sh
      set previewer ${previewer}/bin/pv.sh
    '';
  };

  # ...
}
# { pkgs, config, ... }:
# {
#   programs.lf = {
#     enable = true;
#     commands = {};
#     };
#     settings = {
#       preview = true;
#     };
#     extraConfig =
#       let 
# 	previewer = 
# 	  pkgs.writeShellScriptBin "pv.sh" ''
# 	  file=$1
# 	  
# 	  ${pkgs.pistol}/bin/pistol "$file"
# 	'';
#       in
#       ''
# 	set previewer ${previewer}/bin/pv.sh
#       '';
#   };
# }
