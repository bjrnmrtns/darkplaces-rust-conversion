{
inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

outputs = { self, nixpkgs, flake-utils, ... }:
  flake-utils.lib.eachDefaultSystem (system:
      let
          pkgs = import nixpkgs {
            inherit system; config.allowUnfree = true;
          };
      in 
      {
        devShell = pkgs.mkShell {
          buildInputs = 
          [ 
            pkgs.podman
            pkgs.ripgrep
            pkgs.zellij
            pkgs.cargo
            pkgs.cargo-watch
            pkgs.rustc
            pkgs.rustfmt
            pkgs.clippy
            pkgs.rust-analyzer
            pkgs.helix
            pkgs.neovim
            pkgs.wget
            pkgs.unzip
	    pkgs.SDL2
#            pkgs.libjpeg

	    pkgs.zlib
	    pkgs.gcc

	    pkgs.darwin.apple_sdk.frameworks.Carbon
            pkgs.darwin.apple_sdk.frameworks.CoreFoundation
            pkgs.darwin.apple_sdk.frameworks.CoreAudio

            # tool for converting from make to cmake and compiling in cmake build system
            pkgs.cmake
            pkgs.ninja
	    pkgs.clang_11
	    pkgs.llvmPackages_11.libllvm
	    pkgs.llvmPackages.libcxxClang
	    pkgs.llvmPackages.stdenv
	    pkgs.llvmPackages_11.clangUseLLVM
	    pkgs.llvmPackages_11.clang-unwrapped
	    pkgs.libiconv

            # tools for converting to rust
            pkgs.python3
            pkgs.python3Packages.toml
            pkgs.python3Packages.pyyaml
            pkgs.python3Packages.cbor
          ];
      };
    });
}
