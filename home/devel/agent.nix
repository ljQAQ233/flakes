{
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      opencode
      pi-coding-agent
    ];
  };
}
