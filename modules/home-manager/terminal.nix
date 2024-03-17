
{ pkgs, lib, config, inputs, ... }:

{
  programs.atuin.enable = true;
  programs.atuin.enableBashIntegration = true;

}
