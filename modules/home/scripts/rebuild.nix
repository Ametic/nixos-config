{
  pkgs,
  profile,
  ...
}:

pkgs.writeShellScriptBin "fr-rebuild" ''
  #!${pkgs.bash}/bin/bash
  set -euo pipefail

  PROFILE="${profile}"

  # Set path to the backup file
  BACKUP_FILE="$HOME/.config/mimeapps.list.backup"

  # Remove if exists
  if [ -f "$BACKUP_FILE" ]; then
    echo "Removing stale backup file: $BACKUP_FILE"
    rm "$BACKUP_FILE"
  fi

  # Start system rebuild.
  echo "Starting NixOS rebuild for host: $PROFILE"
  if nh os switch --hostname "$PROFILE"; then
    echo "Rebuild finished successfully"
  else
    echo "Rebuild Failed" >&2
    exit 1
  fi
''
