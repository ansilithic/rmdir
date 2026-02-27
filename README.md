# rmdir

![Swift 6.0](https://img.shields.io/badge/Swift-6.0-F05138?logo=swift&logoColor=white)
![macOS 14+](https://img.shields.io/badge/macOS-14%2B-000000?logo=apple&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-blue)

Drop-in `rmdir` replacement for macOS that moves directories to Trash instead of permanently deleting them.

## How it works

`rmdir` delegates to `/usr/bin/trash` so every deletion is recoverable from the macOS Trash. Each argument is validated as an existing directory before trashing — non-directories and missing paths produce errors on stderr.

## Install

```sh
brew install ansilithic/tap/rmdir
```

Or build from source (requires Xcode and macOS 14+):

```sh
make build && make install
```

Ensure `/usr/local/bin` appears before `/usr/bin` in `$PATH` to shadow the system `rmdir`.

## Usage

```
rmdir [--] directory ...
```

### Examples

```sh
# Move a directory to Trash
rmdir old-project/

# Multiple directories at once
rmdir dir1 dir2 dir3

# Handle directory names starting with -
rmdir -- -temp-dir
```

## License

MIT
