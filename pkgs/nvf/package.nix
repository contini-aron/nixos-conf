{ pkgs, lib, ... }:
{
  imports = [
    ./theme.nix
    ./options.nix
    ./languages.nix
    ./completion.nix
    ./telescope.nix
    ./git.nix
    ./navigation.nix
    ./statusline.nix
    ./binds.nix
  ];

  vim = {
    extraPackages = [
      pkgs.fzf
      pkgs.ripgrep
    ];
  };
}
