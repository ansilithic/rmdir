# rmdir — safe directory removal for macOS

A drop-in replacement for `/usr/bin/rmdir` that moves directories to the macOS Trash instead of permanently deleting them. Built in Swift, delegates to `/usr/bin/trash` so every deletion is recoverable.

## Install

```sh
swift build -c release
cp .build/release/rmdir ~/.local/bin/
```

Or with Make:

```sh
make build install
```

Ensure `~/.local/bin` is earlier in your `$PATH` than `/usr/bin` to shadow the system `rmdir`.

## Usage

```sh
rmdir old-project/
rmdir dir1 dir2 dir3
```

Validates that each argument is an existing directory before trashing. Errors on missing paths or non-directories.

## Requirements

- macOS 14+ (Sonoma)
- Swift 6.0

## License

MIT
