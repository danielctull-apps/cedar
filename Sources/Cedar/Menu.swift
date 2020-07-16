
import AppKit

extension NSMenu {

    static var cedar: NSMenu {

        let name = ProcessInfo.processInfo.processName

        let app = NSMenuItem()
        app.submenu = NSMenu()
        app.submenu?.addItem(NSMenuItem(title: "Quit \(name)", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

        let edit = NSMenuItem()
        edit.submenu = NSMenu(title: "Edit")
        edit.submenu?.addItem(NSMenuItem(title: "Cut", action: #selector(NSText.cut(_:)), keyEquivalent: "x"))
        edit.submenu?.addItem(NSMenuItem(title: "Copy", action: #selector(NSText.copy(_:)), keyEquivalent: "c"))
        edit.submenu?.addItem(NSMenuItem(title: "Paste", action: #selector(NSText.paste(_:)), keyEquivalent: "v"))
        edit.submenu?.addItem(NSMenuItem.separator())
        edit.submenu?.addItem(NSMenuItem(title: "Select All", action: #selector(NSText.selectAll(_:)), keyEquivalent: "a"))

        let window = NSMenuItem()
        window.submenu = NSMenu(title: "Window")
        window.submenu?.addItem(NSMenuItem(title: "Close", action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w"))

        let menu = NSMenu(title: "Main Menu")
        menu.addItem(app)
        menu.addItem(edit)
        menu.addItem(window)
        return menu
    }
}
