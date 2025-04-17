
{ pkgs, neovim-conf, ... }:

{
  home.packages = with pkgs; [
    # custom neovim-conf
    python314
    neovim-conf
    go
    rustc
    gh
    git
  ];

}
