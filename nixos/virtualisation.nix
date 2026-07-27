{ ... }:
{
  virtualisation = {
    # container
    containers = {
      enable = true;
      registries = {
        search = [
          "docker.io"
          "quay.io"
        ];
      };
    };
    podman = {
      enable = true;
      dockerCompat = true;
    };
    # virtual machine
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "maouai233" ];
}
