{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [
    ./terminal.nix
    ./desktop_env.nix
    ./audio.nix
    ./k8s.nix
    ./programming.nix
  ];
}
