
{ pkgs, lib, config, inputs, ... }:

{
  home.packages = with pkgs; [
   # k8s
    go
    rustc
  ];

}
