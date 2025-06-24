{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      env = [
        "NIXOS_OZONE_WL, 1"
        "NIXPKGS_ALLOW_UNFREE, 1"
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "GDK_BACKEND, wayland, x11"
        "CLUTTER_BACKEND, wayland"
        "QT_QPA_PLATFORM=wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "SDL_VIDEODRIVER, x11"
        "MOZ_ENABLE_WAYLAND, 1"
        # Disabling this by default as it can break configurations
        # WIth more than two GPUs.
        # Also added card2 as a further protection should it be enabled
        # This is mostly needed for hybrid laptops
        #"AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1:/dev/card2"
        "GDK_SCALE,1"
        "QT_SCALE_FACTOR,1"
        "EDITOR,nvim"
        # Setting terminal to kitty so running kitty from rofi
        # won't launch in xterm. Which is horrible
        # You can change this to your preferred terminal
        # ToDo: Pull default terminal from host config
        # This should not impact bindings, etc
        "TERMINAL,kitty"
        "XDG_TERMINAL_EMULATOR,kitty"
      ];
    };
  };
}
