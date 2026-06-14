# fastfetch config
{
  pkgs,
  ...
}:
let
  svgToPng =
    {
      name,
      src,
      width,
      height,
    }:
    pkgs.runCommand name
      {
        nativeBuildInputs = [ pkgs.librsvg ];
        inherit src;
      }
      ''
        rsvg-convert $src \
          -w ${toString width} \
          -h ${toString height} \
          -o $out
      '';
in
{
  config = {
    home.packages = [ pkgs.fastfetch ];
    xdg.configFile."fastfetch/config.jsonc".source = ./fetch.jsonc;
    xdg.configFile."fastfetch/logo.png".source = svgToPng {
      name = "logo.png";
      src = ./fetch-orange.svg;
      width = 512;
      height = 512;
    };
  };
}
