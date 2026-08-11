{
  lib,
  pkgs,
  stdenv,
  fetchurl,
  ...
}:
stdenv.mkDerivation rec {
  pname = "uncrustify-edk2";
  version = "73.0.11";
  src = fetchurl {
    url = "https://github.com/tianocore/uncrustify/releases/download/${version}/uncrustify-release.zip";
    hash = "sha256-sW7gPeZVGnqlR2Jr2JXx+R0ERnthZzNPQaKsvvRhfJs=";
  };

  cfg_edk2 = fetchurl {
    url = "https://github.com/tianocore/uncrustify/blob/edk2/master/etc/edk2.cfg";
    hash = "sha256-5bK/5JnSIs4yyU+FcNxlpFjupzUYcMHqAAb1wqrpugY=";
  };

  sourceRoot = ".";
  nativeBuildInputs = [ pkgs.unzip ];

  phases = [
    "unpackPhase"
    "installPhase"
  ];
  installPhase = ''
    install -Dm755 Linux-x86/uncrustify $out/bin/uncrustify
    install -Dm555 ${cfg_edk2} $out/etc/edk2.cfg
  '';

  meta = with lib; {
    description = "Tianocore fork of Uncrustify";
    homepage = "https://github.com/tianocore/uncrustify";
    maintainers = [ maintainers.tianocore ];
  };
}
