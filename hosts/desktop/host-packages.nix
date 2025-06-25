{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    obs-studio
    easyeffects
    floorp
    ntfs3g
    spotify
    telegram-desktop
  ];
}
