import ArgumentParser
import Foundation

@main
struct Rmdir: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "rmdir",
        abstract: "Move directories to Trash instead of permanent deletion.",
        discussion: "Shadows /usr/bin/rmdir, delegating to /usr/bin/trash.",
        version: "1.0.0"
    )

    @Argument(parsing: .captureForPassthrough)
    var args: [String]

    func run() throws {
        var dirs: [String] = []
        var pastDoubleDash = false

        for arg in args {
            if pastDoubleDash {
                dirs.append(arg)
            } else if arg == "--" {
                pastDoubleDash = true
            } else if arg.hasPrefix("-") {
                continue
            } else {
                dirs.append(arg)
            }
        }

        guard !dirs.isEmpty else {
            fputs("usage: rmdir directory ...\n", stderr)
            throw ExitCode.failure
        }

        let fm = FileManager.default

        for arg in dirs {
            let path = arg.hasPrefix("-") ? "./\(arg)" : arg

            var isDir: ObjCBool = false
            guard fm.fileExists(atPath: path, isDirectory: &isDir) else {
                fputs("rmdir: \(arg): No such file or directory\n", stderr)
                throw ExitCode.failure
            }
            guard isDir.boolValue else {
                fputs("rmdir: \(arg): Not a directory\n", stderr)
                throw ExitCode.failure
            }

            let task = Process()
            task.executableURL = URL(fileURLWithPath: "/usr/bin/trash")
            task.arguments = [path]

            do {
                try task.run()
                task.waitUntilExit()
            } catch {
                fputs("rmdir: \(arg): failed to trash\n", stderr)
                throw ExitCode.failure
            }

            if task.terminationStatus != 0 {
                throw ExitCode(task.terminationStatus)
            }
        }
    }
}
