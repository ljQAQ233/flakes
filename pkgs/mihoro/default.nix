{
  lib,
  pkgs,
  rustPlatform,
  fetchFromGitHub,
  ...
}:
rustPlatform.buildRustPackage rec {
  pname = "mihoro";
  version = "v0.14.0";
  src = fetchFromGitHub {
    owner = "spencerwooo";
    repo = "mihoro";
    rev = version;
    sha256 = "sha256-5yYl9YLfkIiKkgqfCv3+0QNbHVa9T6oFLhGA4C1pbwk=";
  };
  patches = [ ./fix-sleep.patch ];

  cargoHash = "sha256-HwyqVJ7uvImWxqmi7NrDBfZbtwpo45sjahaU8RI12IA=";
  nativeBuildInputs = [ pkgs.perl ];

  meta = with lib; {
    description = "Mihomo CLI client on Linux. Formerly `clashrup`.";
    homepage = "https://github.com/spencerwooo/mihoro";
    license = licenses.mit;
    maintainers = [ maintainers.spencerwooo ];
  };
}
