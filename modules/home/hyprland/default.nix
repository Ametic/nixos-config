{host, ...}: let
  inherit (import ../../../hosts/${host}/variables.nix) animChoice;
in {
  imports = [
    animChoice
    ./binds.nix
    ./env.nix
    ./hypridle.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./hyprpanel.nix
    ./pyprland.nix
    ./windowrules.nix
  ];
}
