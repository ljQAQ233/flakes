# qemu-system & tools
{
  stdenv,
  fetchurl,
  buildPackages,
  lib,
  pkgs,
  targetArch ? [
    "x86_64"
    "i386"
    "aarch64"
  ],
  useX11 ? false,
}:
stdenv.mkDerivation rec {
  pname = "qemu-custom";
  version = "10.2.1";

  src = fetchurl {
    url = "https://download.qemu.org/qemu-${version}.tar.xz";
    hash = "sha256-o3F0d9jiyE1jC//7wg9s0yk+tFqh5trG0MwnaJmRyeE=";
  };
  outputs = [
    "out"
    "doc"
  ];

  dontWrapGApps = true;
  dontUseMesonConfigure = true;
  dontAddStaticConfigureFlags = true;

  depsBuildBuild = [
    buildPackages.stdenv.cc
  ];

  nativeBuildInputs = with pkgs; [
    makeWrapper
    removeReferencesTo
    pkg-config
    flex
    bison
    meson
    ninja
    python3Packages.python
    python3Packages.sphinx
    python3Packages.sphinx-rtd-theme
  ];
  buildInputs = with pkgs; [
    glib
    zlib
    gnutls
    dtc
    pixman
    vde2
    lzo
    snappy
    libtasn1
    libslirp
    libcbor
    gtk3
    gettext
    vte
  ];

  postPatch = ''
    # Otherwise tries to ensure /var/run exists.
    sed -i "/install_emptydir(get_option('localstatedir') \/ 'run')/d" \
        qga/meson.build
  '';

  preConfigure = ''
    unset CPP # intereferes with dependency calculation
    patchShebangs .
  '';

  configureFlags =
    let
      targetList = builtins.concatStringsSep "," (map (a: "${a}-softmmu") targetArch);
    in
    [
      "--target-list=${targetList}"
      "--enable-gnutls"
      "--localstatedir=/var"
      "--sysconfdir=/etc"
      "--cross-prefix=${stdenv.cc.targetPrefix}"
      "--enable-docs"
      "--enable-tools"
      "--enable-gtk"
      "--disable-sdl"
    ];

  # ninja.build
  preBuild = "cd build";

  # kill time-killer
  doCheck = false;

  # QEMU running in pure wayland may encounter `scale` problem.
  # with x11 as the backend, it works well
  postInstall = lib.optionalString useX11 ''
    for prog in $out/bin/qemu-*; do
      wrapProgram $prog \
        --set GDK_BACKEND x11 \
        --set GDK_SCALE 1
    done
  '';

  requiredSystemFeatures = [ "big-parallel" ];
}
