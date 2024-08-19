## Stow

```bash
brew install stow
# or
sudo apt stow
```

```bash
stow . -t ~
```

Backup and/or delete conflicting files. Running `--adopt` will cause existing files in `~` to overwrite files in this dir.

## Unstow

```bash
stow . -t ~ -D
```
