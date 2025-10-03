# ZaneyOS v2.4 is out! 🚀

We’re excited to announce ZaneyOS v2.4 — a quality-of-life release focused on a smoother desktop experience, simpler customization, and better tooling.

Highlights
- New default display manager: SDDM with a themed greeter for a polished login experience
- Feature toggles in host variables: Easily enable/disable components in `hosts/<your-host>/variables.nix`
  - Terminals (kitty, wezterm, ghostty, alacritty)
  - Waybar presets and animations
  - Thunar, Printing, NFS, Browser choice, etc.
  - Display manager selection via `displayManager`
- Updated zcli: Better workflows and helpers (including Doom Emacs bootstrap)
- Doom Emacs: First-class toggle + smoother install path (`zcli doom install` after enabling)
- Improved configuration structure: Clearer separation, safer upgrades, and more consistent defaults
- Fastfetch enhancements: Shows ZaneyOS version dynamically
- Documentation: Spanish translation effort has begun (¡gracias!)

Links
- GitLab: https://gitlab.com/zaney/zaneyos
- README: https://gitlab.com/zaney/zaneyos/-/blob/stable-2.4/README.md



⚠️ IMPORTANT UPGRADE NOTES (PLEASE READ)
- The upgrade script is ONLY intended for upgrades from v2.3 → v2.4.
- If you have a heavily modified v2.3, do NOT use the upgrade script. Consider a fresh install of v2.4 and manually migrate your changes.
- Backups: The install and upgrade scripts back up your current `~/zaneyos`, but we strongly recommend making your own backup as well.
- Revert: A revert script is provided (e.g., `./revert-to-2.3.sh`) if you need to roll back using your backup.
- Scope: We cannot test every possible customization and combination when upgrading from v2.3 to v2.4. Proceed with care and review differences.

Branch note
- v2.4 is published on the `stable-2.4` branch.

Thank you for using ZaneyOS! 🎉

