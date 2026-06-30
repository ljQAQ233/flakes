final: prev:
let
  entries = builtins.readDir ./.;
  dirs = builtins.filter (n: entries.${n} == "directory") (builtins.attrNames entries);
  gen = name: {
    inherit name;
    value = final.callPackage (./. + "/${name}") { };
  };
in
builtins.listToAttrs (map gen dirs)
