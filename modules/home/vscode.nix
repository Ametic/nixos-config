{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          # Nix related
          bbenoist.nix
          jeff-hykin.better-nix-syntax
          
          # C++ related
          ms-vscode.cpptools-extension-pack
          
          # Vim emulation
          vscodevim.vim

          # Markdown related          
          yzhang.markdown-all-in-one

          # Other
          mads-hartmann.bash-ide-vscode
          tamasfe.even-better-toml
          zainchen.json
          leonardssh.vscord # Discord Rich Presence
        ];
      };
    };
  };
}
