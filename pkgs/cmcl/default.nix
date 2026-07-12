{
  stdenv,
  lib,
  pkgs,
}:
stdenv.mkDerivation rec {
  pname = "cmcl";
  version = "2.2.2";
  src = pkgs.fetchurl {
    url = "https://github.com/MrShieh-X/console-minecraft-launcher/releases/download/${version}/cmcl";
    sha256 = "sha256-vWVeNnmDaVbHgJSVS5KQorLFfLgndaH1k+0l72l60NM=";
  };
  nativeBuildInputs = [
    pkgs.makeWrapper
  ];
  phases = [
    "installPhase"
    "postFixup"
  ];

  installPhase = ''
    install -Dm755 $src $out/bin/cmcl
  '';

  postFixup = ''
    wrapProgram $out/bin/${pname} \
      --prefix PATH : ${
        pkgs.lib.makeBinPath [
          pkgs.openjdk
        ]
      }
  '';

  meta = with lib; {
    description = "A MCJE launcher running on the command line ";
    homepage = "https://github.com/MrShieh-X/console-minecraft-launcher";
    license = licenses.gpl3;
    platforms = platforms.linux;
    mainProgram = "cmcl";
  };
}
