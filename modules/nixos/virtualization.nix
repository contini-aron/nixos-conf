{ pkgs, lib, config, ... }:

{
  environment.systemPackages = with pkgs; [
    qemu
    terraform
    cloud-init
    libisofs
    cdrkit
    # vagrant
  ];
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["aron"];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;
}
