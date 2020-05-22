// Inspired by Chris Eidhof
// https://gist.github.com/chriseidhof/26768f0b63fa3cdf8b46821e099df5ff

import AppKit
import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    let file: File
    var window: NSWindow?

    init(file: File) {
        self.file = file
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }

    func applicationDidFinishLaunching(_ notification: Notification) {

        let editor = Editor(text: file.binding)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
                          styleMask: [.closable,
                                      .fullSizeContentView,
                                      .miniaturizable,
                                      .resizable,
                                      .titled],
                          backing: .buffered,
                          defer: false)
        window?.center()
        window?.setFrameAutosaveName(file.name)
        window?.contentView = NSHostingView(rootView: editor)
        window?.makeKeyAndOrderFront(nil)
        window?.delegate = self
        window?.titleVisibility = .hidden
        window?.titlebarAppearsTransparent = true
        window?.toolbar?.isVisible = true

        NSApp.activate(ignoringOtherApps: true)
    }
}
