# Ametic's NixOS Dotfiles

> This is my daily NixOS configuration, based on
[ZaneyOS](https://gitlab.com/Zaney/zaneyos). I'm completely beginner in Nix so
it can be messed up but i'm trying my best to make it work properly ;) I'm also
treating it as my learning journey, so you can look into commits and take what u
need.

# How to use it:

> There's an install script provided in src, but it's pretty unstable, so it's better to manually install everything:

> 1. Run this command to ensure Git & Vim are installed:

```
nix-shell -p git vim
```

> 2. Clone this repo & enter it:

```
cd && git clone https://github.com/ametic/nixos-config --depth=1 ~/ameos 
cd ameos
```

> [!NOTE]
> _You should stay in this folder for the rest of the install_

> 3. Create the host folder for your machine(s) like so:

```
cp -r hosts/default hosts/<your-desired-hostname>
git add .
```

> 4. Edit `hosts/<your-desired-hostname>/variables.nix`.

> 5. Edit `flake.nix` and fill in your username, profile, and hostname.

> 6. Generate your hardware.nix like so:

```
nixos-generate-config --show-hardware-config > hosts/<your-desired-hostname>/hardware.nix
```

> 7. Run this to enable flakes and install the flake replacing hostname with
   profile. I.e. `intel`, `nvidia`, `nvidia-laptop`, `amd-hybrid`, or `vm`

```
NIX_CONFIG="experimental-features = nix-command flakes" 
sudo nixos-rebuild switch --flake .#profile
```

</details>

# Big thanks to:

- [Zaney](https://gitlab.com/Zaney) - for providing this nice and easy setup
  that i can learn from.
- [dwilliam62](https://gitlab.com/dwilliam62) - for helping me fixing some
  problems on Zaney's Discord server.
