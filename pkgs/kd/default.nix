{
  stdenv,
  autoPatchelfHook,
  lib,
}:
stdenv.mkDerivation rec {
  pname = "kd";
  version = "0.0.14";

  src = ./.;

  nativeBuildInputs = [ autoPatchelfHook ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 $src/kd_linux_amd64 $out/bin/kd
    runHook postInstall
  '';

  meta = with lib; {
    description = "A crystal clear command-line dictionary";
    homepage = "https://github.com/Karmenzind/kd";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "kd";
  };
}
