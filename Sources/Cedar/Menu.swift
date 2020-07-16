
import AppKit

extension NSMenu {

    static var cedar: NSMenu {

        let name = ProcessInfo.processInfo.processName

        let app = NSMenuItem()
        app.submenu = NSMenu()
        app.submenu?.items = [
            NSMenuItem(title: "Quit \(name)", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"),
        ]

        let edit = NSMenuItem()
        edit.submenu = NSMenu(title: "Edit")
        edit.submenu?.items = [
            NSMenuItem(title: "Undo", action: #selector(UndoManager.undo), keyEquivalent: "z"),
            NSMenuItem(title: "Redo", action: #selector(UndoManager.redo), keyEquivalent: "Z"),
            NSMenuItem.separator(),
            NSMenuItem(title: "Cut", action: #selector(NSText.cut(_:)), keyEquivalent: "x"),
            NSMenuItem(title: "Copy", action: #selector(NSText.copy(_:)), keyEquivalent: "c"),
            NSMenuItem(title: "Paste", action: #selector(NSText.paste(_:)), keyEquivalent: "v"),
            NSMenuItem.separator(),
            NSMenuItem(title: "Select All", action: #selector(NSText.selectAll(_:)), keyEquivalent: "a"),
        ]

        let window = NSMenuItem()
        window.submenu = NSMenu(title: "Window")
        window.submenu?.items = [
            NSMenuItem(title: "Close", action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w"),
        ]

        let menu = NSMenu(title: "Main Menu")
        menu.items = [app, edit, window]
        return menu
    }
}
