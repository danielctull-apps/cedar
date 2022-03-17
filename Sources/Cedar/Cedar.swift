
import AppKit
import ArgumentParser

@main
struct Cedar: ParsableCommand {

    @Argument(help: "The file to open.")
    var file: File

    func run() throws {
        let app = NSApplication.shared
        NSApp.setActivationPolicy(.accessory)
        let delegate = AppDelegate(file: file)
        app.delegate = delegate
        app.menu = .cedar
        app.run()
    }
}
