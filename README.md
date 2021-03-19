## Dependencies
- `steamcmd`
- `steam-run`

Intended to be run from a systemd service as a non-root user. Write access to the working directory and a home directory are required.

An example of a NixOS configuration running this can be found [here](https://github.com/johnviolano/nixos-system/blob/main/valheim-service.nix).

