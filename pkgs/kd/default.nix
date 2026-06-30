{
  stdenv,
  lib,
  pkgs,
}:
stdenv.mkDerivation rec {
  pname = "kd";
  version = "v0.0.14";
  src = pkgs.fetchurl {
    url = "https://github.com/Karmenzind/kd/releases/download/${version}/kd_linux_amd64";
    sha256 = "sha256-7okOXvaqhtG1FXZUyO0RPjhvTrS1Y8bxP0n7nBYkdO8=";
  };
  phases = [ "installPhase" ];

  installPhase = ''
    install -Dm755 $src $out/bin/kd
  '';

  meta = with lib; {
    description = "A crystal clear command-line dictionary";
    homepage = "https://github.com/Karmenzind/kd";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "kd";
  };
}
