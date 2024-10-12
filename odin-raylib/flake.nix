{
  description =
    "A Nix-flake-based Odin development environment with Raylib support";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }:
    let
      supportedSystems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems
        (system: f { pkgs = import nixpkgs { inherit system; }; });
    in {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            odin
            ols
            libGL
            SDL2
            raylib
            glfw
            xorg.libX11
            xorg.libXcursor
            xorg.libXrandr
            xorg.libXinerama
            xorg.libXi
            xorg.libXext
            xorg.libXfixes
            xorg.libXxf86vm
            libpulseaudio
            wayland
            glibc
          ];
          shellHook = ''
            export LD_LIBRARY_PATH=${
              pkgs.lib.makeLibraryPath [
                pkgs.libGL
                pkgs.SDL2
                pkgs.raylib
                pkgs.glfw
                pkgs.xorg.libX11
                pkgs.xorg.libXcursor
                pkgs.xorg.libXrandr
                pkgs.xorg.libXinerama
                pkgs.xorg.libXi
                pkgs.xorg.libXext
                pkgs.xorg.libXfixes
                pkgs.xorg.libXxf86vm
                pkgs.libpulseaudio
                pkgs.wayland
              ]
            }:$LD_LIBRARY_PATH
          '';
        };
      });
    };
}
