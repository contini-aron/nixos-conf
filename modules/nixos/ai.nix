{ pkgs, lib, config, ... }:

{
  # Add Node.js 18 with npm that works with the pi tool
  environment.systemPackages = with pkgs; [
    amdgpu_top
    rocmPackages.rocminfo
    pi-coding-agent
    # nodejs_18
  ];

  # Add npm wrapper path to ensure it's in PATH
  environment.variables.NVM_DIR = "";

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    rocmOverrideGfx = "10.3.0";
    environmentVariables = {
      ROCR_VISIBLE_DEVICES   = "0";
      OLLAMA_FLASH_ATTENTION = "1";
      OLLAMA_KV_CACHE_TYPE   = "q8_0";
      OLLAMA_CONTEXT_LENGTH  = "32768";
      OLLAMA_KEEP_ALIVE      = "30m";
    };
  };

  systemd.services.ollama.wantedBy = lib.mkForce [];
}
