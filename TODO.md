### nixos-generation

```bash
nix build --print-out-paths ".#ci.systemOut.cornflower-scientist"
/nix/store/pg7vi7swrsc2aam1l7g571hwsm8j4x7i-darwin-system-25.11.c48e963
```


```bash
/nix/store/pg7vi7swrsc2aam1l7g571hwsm8j4x7i-darwin-system-25.11.c48e963🔒 using  25.11
󰘧 tree
.
├── activate
├── activate-user
├── Applications -> /nix/store/5m08jx8kqdibv0qjyja30xwf9zm3wrc5-system-applications/Applications ├── darwin
├── darwin-changes
├── darwin-version
├── darwin-version.json -> /nix/store/q0r5s20i5rjrnqjb0kqbjmdmfdj9b9cc-darwin-version.json
├── etc -> /nix/store/pgbzfjy6i0blb6nkalp8jbb8ipxbidfy-etc/etc
├── Library
│   ├── Fonts -> /nix/store/0267jja3lrllppfkdn0vnk7fz5bh66ab-fonts/Library/Fonts
│   ├── LaunchAgents -> /nix/store/hnkg802c2vy4l4hcxjp1516c2r7j4pf0-launchd/Library/LaunchAgents
│   └── LaunchDaemons -> /nix/store/hnkg802c2vy4l4hcxjp1516c2r7j4pf0-launchd/Library/LaunchDaemons
├── patches -> /nix/store/jrr3xz1lpkwj674bd0192bgr66gc1fws-patches/patches
├── sw -> /nix/store/c15y50p8qh18d0yy0wqxpd56pvrzwn0g-system-path
├── system
├── systemConfig
└── user
    └── Library
        └── LaunchAgents -> /nix/store/hnkg802c2vy4l4hcxjp1516c2r7j4pf0-launchd/user/Library/LaunchAgents

```

### home-manager-generation

```bash
nix build --print-out-paths ".#ci.hmActivation.cornflower-scientist.flokkq"
```


```bash
developer/nixOS/result🔒 using  25.11
󰘧 tree
.
├── activate
├── bin
│   └── home-manager-generation -> /nix/store/6hdpxn5hgq73m6fr5i6qy164qcmy2rsa-home-manager-generation/activate
├── extra-dependencies
├── gen-version
├── hm-version
├── home-files -> /nix/store/d9fdkv0gafd9msg39wd6gbwx14gf7q0y-home-manager-files
├── home-path -> /nix/store/f9n67r3fd60maa2aknrw8r2nfs4dyjyr-home-manager-path
└── LaunchAgents -> /nix/store/82x4jr4fq9v0ms52sqfqdh8msckby2h6-home-manager-agents

```
