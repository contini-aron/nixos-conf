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
  home.file.".lv2/Odin2.lv2" = {
    recursive = true;
    source = "${pkgs.odin2}/lib/lv2/Odin2.lv2";
  };
  home.file.".vst3/Vital.vst3" = {
    recursive = true;
    source = "${pkgs.vital}/lib/vst3/Vital.vst3";
  };
  home.file.".vst3/Surge.vst3" = {
    recursive = true;
    source = "${pkgs.surge}/lib/vst3/Surge.vst3";
  };
  home.file.".lv2/avldrums.lv2" = {
    recursive = true;
    source = "${pkgs.x42-avldrums}/lib/lv2/avldrums.lv2";
  };
  home.file.".vst3/DecentSampler.vst3" = {
    recursive = true;
    source = "${pkgs.decent-sampler}/lib/vst3/DecentSampler.vst3";
  };
}
