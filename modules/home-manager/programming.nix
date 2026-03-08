
{ pkgs, neovim-conf, ... }:

{
  home.packages = with pkgs; [
    # custom neovim-conf
    git
    neovim-conf
  ];

}
