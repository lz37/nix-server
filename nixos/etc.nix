{ config, pkgs, ... }:

{
    programs = {
        # Some programs need SUID wrappers, can be configured further or are
        # started in user sessions.
        mtr.enable = true;
        gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };
        # enable vscode remote
        nix-ld.enable = true;
    };

}

