{ nixpkgs, pkgs, ...}:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    pulsemixer # pule audio gui mixer
    ardour #daw
    zrythm
    qpwgraph # pipewire audio gui connection
    vital # synth
    odin2 # synth
    surge # synth
    x42-avldrums # drumkit
    decent-sampler # sampler
  ];
}
