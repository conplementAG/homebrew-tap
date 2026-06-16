# homebrew-tap
🍻 Homebrew formulae for tooling provided by conplementAG

## Available Formulae

- `copsctl` - conplement AG Kubernetes developer tooling

## Installation and Usage

### Installing the Tap

To add this tap to your Homebrew installation:

```bash
brew tap conplementag/tap
```

### Installing copsctl

Once the tap is installed, you can install copsctl using:

```bash
brew install copsctl
```

This will install the latest version of copsctl. The formula automatically detects your operating system (macOS/Linux) and architecture (Intel/ARM) to download the appropriate binary.

### Updating copsctl

To update to the latest version:

```bash
brew update
brew upgrade copsctl
```

### Shell Completion

copsctl comes with shell completion support. After installation, tab-completions should work in a new terminal window. If they don't work, you may need to configure completion in your shell.

For more information about configuring shell completion in Homebrew, see the [official documentation](https://docs.brew.sh/Shell-Completion).

### Verification

To verify the installation and check the version:

```bash
copsctl --version
```

## Maintaining the Formula

To update the `copsctl` formula, run the **update-formula** workflow
(Actions → "update-formula" → Run workflow), or via the CLI:

```bash
# Bump to the latest copsctl release (version auto-detected)
gh workflow run update-formula.yml --repo conplementAG/homebrew-tap

# …or pin a specific version
gh workflow run update-formula.yml --repo conplementAG/homebrew-tap -f version=0.20.0
```

The workflow resolves the checksums automatically and commits the bump to `main`.

## Contributing

If you'd like to contribute to this tap or report issues, please visit our [GitHub repository](https://github.com/conplementAG/homebrew-tap).

## License

Please refer to the individual tools for their respective licenses.
