# rmdir — safe directory removal for macOS

A drop-in replacement for `/usr/bin/rmdir` that moves directories to the macOS Trash instead of permanently deleting them. Built in Swift, delegates to `/usr/bin/trash` so every deletion is recoverable.

## Install

```sh
brew install ansilithic/tap/rmdir
```

Or build from source:

```sh
swift build -c release
cp .build/release/rmdir ~/.local/bin/
```

Ensure `~/.local/bin` is earlier in your `$PATH` than `/usr/bin` to shadow the system `rmdir`.

## Usage

```sh
rmdir old-project/
rmdir dir1 dir2 dir3
```

Validates that each argument is an existing directory before trashing. Errors on missing paths or non-directories.

## License

MIT
