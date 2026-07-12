{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    cmcl
  ];
}
