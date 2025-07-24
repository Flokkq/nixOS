# Templates

These are new flakes that can be generated quickly using:

```bash
nix flake init -t github:flokkq/nixOS#mytemplate
```

Also possible without internet using the local registry:

```bash
nix flake new . --template nixos#rust
```
