{ inputs
, pkgs
, ...
}: {
  imports = [ inputs.nixcord.homeModules.nixcord ];
  
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    config = {
      useQuickCss = true;
      themeLinks = [
        "https://refact0r.github.io/midnight-discord/build/midnight.css"
      ];
      frameless = true;
      plugins = {
        expressionCloner.enable = true;
        readAllNotificationsButton.enable = true;
        newGuildSettings.enable = true;
        imageZoom.enable = true;
        translate.enable = true;
      };
    };
  };
}
