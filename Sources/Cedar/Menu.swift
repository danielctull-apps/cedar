
import AppKit

extension NSMenu {

    static var cedar: NSMenu {

        let name = ProcessInfo.processInfo.processName

        let app = NSMenuItem()
        app.submenu = NSMenu()
        app.submenu?.addItem(NSMenuItem(title: "Quit \(name)", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

        let window = NSMenuItem()
        window.submenu = NSMenu(title: "Window")
        window.submenu?.addItem(NSMenuItem(title: "Close", action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w"))

        let menu = NSMenu(title: "Main Menu")
        menu.addItem(app)
        menu.addItem(window)
        return menu
    }
}
