# Usage as a flake

[![FlakeHub](https://img.shields.io/endpoint?url=https://flakehub.com/f/faultypointer/development-flakes/badge)](https://flakehub.com/flake/faultypointer/development-flakes)

Add development-flakes to your `flake.nix`:

```nix
{
  inputs.development-flakes.url = "https://flakehub.com/f/faultypointer/development-flakes/*.tar.gz";

  outputs = { self, development-flakes }: {
    # Use in your outputs
  };
}

```
