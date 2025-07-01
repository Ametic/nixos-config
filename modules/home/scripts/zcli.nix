{
  pkgs,
  profile,
  backupFiles ? [".config/mimeapps.list.backup"],
  ...
}: let
  backupFilesString = pkgs.lib.strings.concatStringsSep " " backupFiles;
in
  pkgs.writeShellScriptBin "zcli" ''
    #!${pkgs.bash}/bin/bash
    set -euo pipefail

    # --- Configuration ---
    PROFILE="${profile}"
    BACKUP_FILES_STR="${backupFilesString}"
    VERSION="0.3"

    read -r -a BACKUP_FILES <<< "$BACKUP_FILES_STR"

    # --- Helper Functions ---
    print_help() {
      echo "ZaneyOS CLI Utility -- version $VERSION"
      echo ""
      echo "Usage: zcli [command]"
      echo ""
      echo "Commands:"
      echo "  rebuild   - Rebuild the NixOS system configuration."
      echo "  update    - Update the flake and rebuild the system."
      echo "  cleanup   - Run garbage collection to remove old generations."
      echo "  trim      - Trim filesystems to improve SSD performance."
      echo "  diag      - Create a system diagnostic report."
      echo "  help      - Show this help message."
      echo ""
    }

    handle_backups() {
      if [ ''${#BACKUP_FILES[@]} -eq 0 ]; then
        echo "No backup files configured to check."
        return
      fi

      echo "Checking for backup files to remove..."
      for file_path in "''${BACKUP_FILES[@]}"; do
        full_path="$HOME/$file_path"
        if [ -f "$full_path" ]; then
          echo "Removing stale backup file: $full_path"
          rm "$full_path"
        fi
      done
    }

    # --- Main Logic ---
    if [ "$#" -eq 0 ]; then
      echo "Error: No command provided." >&2
      print_help
      exit 1
    fi

    case "$1" in
      rebuild)
        handle_backups
        echo "Starting NixOS rebuild for host: $PROFILE"
        if nh os switch --hostname "$PROFILE"; then
          echo "Rebuild finished successfully"
        else
          echo "Rebuild Failed" >&2
          exit 1
        fi
        ;;
      update)
        handle_backups
        echo "Updating flake and rebuilding system for host: $PROFILE"
        if nh os switch --hostname "$PROFILE" --update; then
          echo "Update and rebuild finished successfully"
        else
          echo "Update and rebuild Failed" >&2
          exit 1
        fi
        ;;
      cleanup)
        echo "Warning! All but most current generations will be removed!"
        read -p "Continue (y/N)? " -n 1 -r
        echo # move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]; then
          echo "Starting garbage collection..."
          nix-collect-garbage --delete-old
          sudo nix-collect-garbage -d
          sudo /run/current-system/bin/switch-to-configuration boot
          echo "Garbage collection complete."
        else
          echo "Cleanup cancelled."
        fi
        ;;
      trim)
        echo "Running 'sudo fstrim -v /' may take a few minutes and impact system performance."
        read -p "Enter (y/Y) to run now or enter to exit (y/N): " -n 1 -r
        echo # move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]; then
          echo "Running fstrim..."
          sudo fstrim -v /
          echo "fstrim complete."
        else
          echo "Trim operation cancelled."
        fi
        ;;
      diag)
        echo "Generating system diagnostic report..."
        inxi --full > "$HOME/diag.txt"
        echo "Diagnostic report saved to $HOME/diag.txt"
        ;;
      help)
        print_help
        ;;
      *)
        echo "Error: Invalid command '$1'" >&2
        print_help
        exit 1
        ;;
    esac
  ''
