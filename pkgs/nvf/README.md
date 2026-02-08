# Neovim Configuration
The Neovim configuration in this repository can be used independently without installing the full NixOS system configuration.
### Quick Try (Temporary, No Installation)
Run Neovim with this configuration once without installing:
```bash
nix run github:contini-aron/nixos-conf#neovim-conf
```
This will launch Neovim with all plugins and settings, but won't persist the installation.
### Install to User Profile
To install the Neovim configuration persistently to your user profile:
```bash
nix profile install github:contini-aron/nixos-conf#neovim-conf
```
After installation, you can launch Neovim from anywhere with the configured setup.
### Update Neovim Configuration
If you've already installed the Neovim config and want to upgrade to the latest version:
```bash
# Method 1: Upgrade by pattern matching
nix profile upgrade '.*neovim-conf.*'
# Method 2: Run with refresh flag (fetches latest without modifying profile)
nix run github:contini-aron/nixos-conf#neovim-conf --refresh
```
### Manage Installed Profiles
List all installed profiles to see what's currently installed:
```bash
nix profile list
```
Remove the Neovim configuration from your profile:
```bash
nix profile remove '.*neovim-conf.*'
```
After removing the Neovim configuration, clean up unused dependencies and free disk space:
```bash
nix-collect-garbage
```
### Requirements
- **NixOS users**: You already have Nix available. Just ensure [flakes](https://nixos.wiki/wiki/Flakes) are enabled.
- **Non-NixOS users**: Install the Nix package manager by following the [official installation instructions](https://nixos.org/download.html), then enable [flakes](https://nixos.wiki/wiki/Flakes).
