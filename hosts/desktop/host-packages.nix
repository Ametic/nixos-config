{pkgs, nixpkgs-master, ...}: {
  environment.systemPackages = with pkgs; [
    audacity
    discord
    nodejs
    easyeffects
    ntfs3g
    spotify
    telegram-desktop
    headsetcontrol
    prismlauncher
    kdePackages.kdenlive
    video-downloader
    droidcam
    youtube-music
    filezilla
  ] ++ [
    nixpkgs-master.taterclient-ddnet
  ];
}
