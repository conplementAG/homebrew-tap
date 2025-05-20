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

## Contributing

If you'd like to contribute to this tap or report issues, please visit our [GitHub repository](https://github.com/conplementAG/homebrew-tap).

## License

Please refer to the individual tools for their respective licenses.
