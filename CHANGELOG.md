## 🗒️ Changelog

## ZaneyOS v2.3.2 -- Post GA Release Notes

** Updated: June 24nd, 2025 **

- Added `vscode.nix` with configured plugins
- Thanks to `delciak` for the NIX code for `vscode.nix`
- Fixed 'hm-find' script not being built
- Fixed `css` formatting thanks to `mister_simon` for the fix
- Set `TERMINAL` and `XDG_TERMINAL_EMULATOR` to kitty in `env.nix`
- This resolves issue where running `yazi` from rofi uses xterm
- Updated flake
- Current `yazi` chg'd `manager` to `mgr` in `theme.toml` and `keymap.toml`
  Updated NIX files.
- Re-enabled `language formater` had to disable `css` to allow builds/updates to
  work
- Disabled language formatter in `nvf` Fails to build

```text
error: attribute 'prettier' missing
at /nix/store/3vzc8fxjxvv0b0jrywian6ilb7bdk4y8-source/modules/plugins/languages/css.nix:45:17:
    44|     prettier = {
    45|       package = pkgs.prettier;
      |                 ^
    46|     };
Did you mean prettierd?
```

- Waiting for fix upstream to re-enable it
- Added three more `git`aliases `com` commit a, `gs` stash, and `gp` pull
- Run `gs com`, `git gs` and `git gp` to use them
- Enabled `neovim` and set it as `defaultEditor`
- Moved aliases for `eza` to `eza.nix` Now regardless of shell they will be same
- Added default features to `eza` in `eza.nix` Allowing default behavior to be
  set on all shells
- Added Shell integration for `eza` to `bash`, `zsh` and `fish`
- Disabled AQ_DRM_DEVICES env variable Retuned to default auto
- Updated flake
- Set `Virtual-1` monitior default to 1920x1080
- Added options and aliases to `git.nix`
- Added preview to `fzf.nix` Enter to edit
- Added `eza.nix` to configure basic eza settings
- Added `onefetch` to show current build info for zaneyos
- Changed version to ZaneyOS v2.3.3 in fastfetch

- Modified zsh config

```nix
 syntaxHighlighting = {
      enable = true;
      highlighters = ["main" "brackets" "pattern" "regexp" "root" "line"];
    };
    historySubstringSearch.enable = true;

    history = {
      ignoreDups = true;
      save = 10000;
      size = 10000;
    };
```

- Added `lazygit.nix` to theme, customize lazygit util
- Added `fzf.nix` to customize fzf util
- Added `waybar-ddubs-2.nix` Modified version of Jerry's waybar
- Adjusted some colors in Jerry's waybar
- Disabled the `df` command in the disk module. Doesn't work w/zaneyos
- Added examples for monitor setup in `variables.nix`
- Added Jerry's waybar as option. `Jerry-waybar.nix`
- Added option to enable blur on waybar on `hyprland.nix` Thx SchotjeChrisman
- Added new Window animation option `animation-moving`from ML4W repo
- Restored relative line numbering to nvim `lineNumberMode = "relNumber";`
- Removed extraneous LUA code for diags w/debug messages from `nvf.nix`
- Fixed regression in `windowrules.nix`
- Stylix was set to unstable - set to 25.05 to stop warning
- Hyprland ENV variables set in two files, created `env.nix`
- Hyprland animation files had `inherit`statements that weren't used
- Pyprland drop down termina size changed from 75% to 70%
- Merged yazi fix for errors after rebuilds. Thank you Daniel
- NVIM `languages.enableLSP` changed to `vim.settings.lsp.enable`
- Updated flake 05/27/2025
- Disabled donation messages
- Set Application Not Responding (ANR) dialog threshold to 20 (def 1)
- Restored diagnostic messages inline as errors are detected
- When you save a file the LSP will show any applicable hints
- Updated `nvf.nix`to use a clipboard provider as "useSystemClipobard" is no
  longer supported
- Pinned nixpkgs and homemanager to 25.05 in `flake.nix`
- Updated `flake.lock`to match changes
- Hyprland updated to v0.49
- Added `hyprlock.enable=true;` in system packages. This resolves issue with PAM
  auth errors.
- Fixed syntax error in `animations-dynamic.nix`file. Thx Brisingr05
- Removed unneeded `home.mgr.enable` in `user.nix` Thx Brisingr05
- Updated `FAQ.md` with Hyprland Keybinds and how to change waybar.
- Updated `README` with Hyprland keybinds.
- Updated install script to pull from the most current release not the main
  branch.
- Added `hm-find` to find old backup files preventing rebuilds/updates from
  completing.
- Added how to fix yazi startup error to `FAQ.md`.
- Fixed formatting in `FAQ.md` causing yazi info from being hidden.

<details>

<summary><strong>v2.3 GA Release Notes</strong></summary>

<div style="margin-left: 20px;">

- With this release there are improvements to Neovim
- The entire file structure has been improved.
- Switched from nixvim to nvf for neovim configuration.
- Improved bat config and includes extras now.
- Added profiles for what kind of system you have based of GPU / VM.
- Reduced the host specific files and made the entire flake more modular.
- Fixed git getting set to wrong user settings.
- Fixed hyprlock conflicting with stylix.
- Setup`nh` in a better fashion.
- Added support for qmk out of the box.
- Added usbutils for lsusb functionality.
- Massive improvement to Hyprland window rules.
- Removed broken support for Apple Silicon (this may return).
- Install script improved.
- Fixed `nix flake check` not working.
- Added nvidia prime PCI ID variables to host `variables.nix`.
- Added vim keybindings zsh (alt+hjkl).
- Added (ctrl+hjkl) keybinds for vim movement while in insert mode in neovim.
- Supports adb out of the box.
- Ddubs/dwilliam62 helped with the addition of pyprland and scratchpad support.
  He is now also a maintainer.
- Can now summon a drop-down terminal with `SUPER, T`.
- Added image used by Stylix into the host variables file.
- Made printing and NFS variables so they can be easily toggled between hosts.
- Added waybar styling choice.
- Kitty, Wezterm, Neovim/nvf, and even Flatpaks all properly themed with Stylix.
- Moved to hyprpolkitagent and fixed qt theming.
- Stylix options that I wanted forced us back on the unstable branch.
- Made Thunar an optional thing, enabled by default. _But for me Yazi is
  enough._

  </div>

  </details>

<br>
<details>
<summary><strong>**ZaneyOS v2.2**</strong> </summary>

<div style="margin-left: 20px;">

- This release has a big theming change
- Move back to rofi. It is a massive improvement in many ways.
- Revert the switch from rofi to wofi. Rofi is just better.
- Switch from Nix Colors to Stylix. It can build colorschemes from a wallpaper.
- Simplified the notification center.
- Improved emoji selection menu and options.
- Adding fine-cmdline plugin for Neovim.
- Removed theme changing scripts as the theme is generated by the image set with
  stylix.image in the config.nix file.
- Starship is now setup in the config.nix file.
- Switched from SDDM to tuigreet and greetd.
- Added Plymouth for better looking booting.
- Improve the fonts being installed and properly separate them from regular
  packages.
- Separated Neovim configuration for readability.
- Updated flake and added fix for popups going to wrkspc 1 in Hyprland.
- Removed a few of the packages that aren't necessary and smartd by default.
- Removed unnecessary Hyprland input in flake as home manager doesn't use it.
- Turned off nfs by default.
- Hyprland plugins are now disabled in the config by default.
- Fastfetch is now replacing neofetch.
- Btop is back baby!
- Switching to Brave as the default to protect user privacy.
- Replaced lsd with eza for a better looking experience.

</div>

</details>
<br>

<details>

<summary><strong>**ZaneyOS v2.1**</strong></summary>

<div style="margin-left: 20px;">

Simple bug fixes.

- Fixed Waybar icons to make them look a bit better.
- Centered the Wofi window always.
- Should have fixed some Steam issues, but I have had some crashes due to Steam
  so be aware of that.
- The flake got an update, so all the packages are fresh.

</div>

</details>

<br>

<details>

<summary><strong>**ZaneyOS v2.0** </strong></summary>

<div style="margin-left: 20px;">

With this new update of ZaneyOS it is a big rewrite of how things are being
done. This update fixes many issues that you guys were facing. As well as makes
things a little easier to understand. You now have a lot being stored inside the
specific host directory, making use of modules, condensing seperate files down,
etc. My hope is that with this update your ability to grasp the flake and expand
it to what you need is much improved. I want to thank everyone for being so
supportive!

- Most configuration put into specific hosts directories for the best
  portability.
- Using modules to condense configuration complexity.
- Simplified options and the complexity around understanding their
  implementation.
- Rewrote the documentation for improved readability.

</div>

</details>
