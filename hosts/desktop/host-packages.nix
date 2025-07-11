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
    headsetcontrol
    prismlauncher
    kdePackages.kdenlive
    video-downloader
    droidcam
  ];
}
