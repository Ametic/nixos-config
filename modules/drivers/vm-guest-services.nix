{ lib
, pkgs
, config
, ...
}:
with lib;
let
  cfg = config.vm.guest-services;
in
{
  options.vm.guest-services = {
    enable = mkEnableOption "Enable Virtual Machine Guest Services";
  };

  config = mkIf cfg.enable {
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
    services.spice-webdavd.enable = false;  #Causes navfs2 build failure invalid neon version  9-12-25
   };
}
