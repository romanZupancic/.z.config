{lib, ...}:
let
  # Recursively constructs an attrset of a given folder, recursing on directories, value of attrs is the filetype
  getDir = dir: lib.mapAttrs
    (file: type:
      if type == "directory" then getDir "${dir}/${file}" else type
    )
    (builtins.readDir dir);
  
  # Collects all files of a directory as a list of strings of paths
  files = dir: lib.collect lib.isString (lib.mapAttrsRecursive (path: type: lib.concatStringsSep "/" path) (getDir dir));
in
  # Filters out directories that don't end with .nix or are this file, also makes the strings absolute
(dir: map
  (file: dir + "/${file}")
  (lib.filter
    (file: lib.hasSuffix ".nix" file && file != "default.nix" &&
           ! lib.hasPrefix "x/taffybar/" file &&
           ! lib.hasSuffix "-hm.nix" file)
    (files dir)))
