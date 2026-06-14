{
  pkgs ? import <nixpkgs> { },
}:

{
  qemu-custom = pkgs.callPackage ./qemu-custom/default.nix { };
}
