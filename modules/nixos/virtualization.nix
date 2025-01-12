{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
    terraform
    # vagrant
  ];
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["aron"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
