{ pkgs ? import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) {}
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    libgcc
    clang-tools
    pkg-config
    libGL
    xorg.libX11
    xorg.libXi
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXinerama
    wayland
    libxkbcommon
    cmake

    # from:
    # https://www.sfml-dev.org/tutorials/2.6/compile-with-cmake.php
    freetype
    flac
    udev
    libogg
    libvorbis
    openal
  ];

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
  ];

  # this is needed for delve to work with cgo
  # see: https://wiki.nixos.org/wiki/Go#Using_cgo_on_NixOS
  hardeningDisable = [ "fortify" ];

  shellHook = '''';
}

