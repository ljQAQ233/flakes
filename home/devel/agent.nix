{
  pkgs,
  ...
}:
{
  config = {
    home.packages = with pkgs; [
      opencode
      markitdown-mcp
    ];
  };
}
