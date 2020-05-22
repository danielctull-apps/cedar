
import AppKit
import ArgumentParser

struct Cedar: ParsableCommand {

    @Argument(help: "The file to open.")
    var file: File

    func run() throws {
        let app = NSApplication.shared
        NSApp.setActivationPolicy(.accessory)
        let delegate = AppDelegate(file: file)
        app.delegate = delegate
        app.run()
    }
}

Cedar.main()
