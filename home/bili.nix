{
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      kdePackages.kdenlive
    ];
  };
}
