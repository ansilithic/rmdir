# rmdir

Move directories to Trash instead of permanently deleting them.

Drop-in replacement for `/usr/bin/rmdir` that delegates to `/usr/bin/trash`, so deleted directories are recoverable from the macOS Trash.

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
