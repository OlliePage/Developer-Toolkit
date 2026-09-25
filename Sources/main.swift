import AppKit
import ServiceManagement
import SystemConfiguration

@MainActor
final class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {
    private var statusItem: NSStatusItem!
    private let nameItem = NSMenuItem(title: "", action: nil, keyEquivalent: "")
    private let loginItem = NSMenuItem(title: "Open at Login", action: nil, keyEquivalent: "")

    func applicationDidFinishLaunching(_ notification: Notification) {
        let args = CommandLine.arguments
        if args.contains("--disable-login-item") {
            setLoginItem(enabled: false)
            NSApp.terminate(nil)
            return
        }
        if args.contains("--enable-login-item") {
            setLoginItem(enabled: true)
        }

        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem.autosaveName = "WhichMacName"

        let menu = NSMenu()
        menu.delegate = self
        nameItem.isEnabled = false
        loginItem.action = #selector(toggleLoginItem)
        loginItem.target = self
        menu.addItem(nameItem)
        menu.addItem(.separator())
        menu.addItem(loginItem)
        menu.addItem(NSMenuItem(title: "Quit WhichMac", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu

        refresh()
    }

    func menuNeedsUpdate(_ menu: NSMenu) {
        refresh()
    }

    private func refresh() {
        let computerName = SCDynamicStoreCopyComputerName(nil, nil) as String?
        let name = resolvedName(computerName: computerName, hostName: ProcessInfo.processInfo.hostName)
        statusItem.button?.title = menuBarTitle(for: name)
        nameItem.title = name
        loginItem.state = SMAppService.mainApp.status == .enabled ? .on : .off
    }

    @objc private func toggleLoginItem() {
        setLoginItem(enabled: SMAppService.mainApp.status != .enabled)
        refresh()
    }

    private func setLoginItem(enabled: Bool) {
        do {
            if enabled {
                try SMAppService.mainApp.register()
            } else {
                try SMAppService.mainApp.unregister()
            }
        } catch {
            NSLog("WhichMac: could not %@ login item: %@", enabled ? "enable" : "disable", error.localizedDescription)
        }
    }
}

// Top-level code runs on the main thread; tell the compiler so AppKit calls are allowed.
MainActor.assumeIsolated {
    let app = NSApplication.shared
    let delegate = AppDelegate()
    app.delegate = delegate
    app.setActivationPolicy(.accessory)
    app.run()
}
