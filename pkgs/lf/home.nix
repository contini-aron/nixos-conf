{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    # ctpv
    pistol
    termpdfpy
    mupdf
  ];
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
