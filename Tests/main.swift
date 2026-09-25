import Foundation
import ServiceManagement

var failures = 0

func expect(_ actual: String, _ expected: String, _ label: String) {
    if actual == expected {
        print("PASS  \(label)")
    } else {
        print("FAIL  \(label)\n      expected: \(expected.debugDescription)\n      actual:   \(actual.debugDescription)")
        failures += 1
    }
}

expect(resolvedName(computerName: "[OP] MacBook Air M2", hostName: "op-air.local"), "[OP] MacBook Air M2", "uses the Computer Name")
expect(resolvedName(computerName: "  Studio\n", hostName: "studio.local"), "Studio", "trims whitespace around the Computer Name")
expect(resolvedName(computerName: nil, hostName: "op-air.local"), "op-air", "falls back to host name without .local when Computer Name is missing")
expect(resolvedName(computerName: "   ", hostName: "op-air.local"), "op-air", "falls back to host name when Computer Name is blank")
expect(resolvedName(computerName: nil, hostName: ""), "Unknown Mac", "says Unknown Mac when both are empty")
expect(menuBarTitle(for: "[OP] MacBook Air M2"), "[OP] MacBook Air M2", "short names are unchanged")
expect(menuBarTitle(for: String(repeating: "a", count: 32)), String(repeating: "a", count: 32), "a name exactly at the limit is unchanged")
expect(menuBarTitle(for: String(repeating: "a", count: 40)), String(repeating: "a", count: 31) + "…", "long names are cut to 32 characters with an ellipsis")
expect(menuBarTitle(for: "Office Mac mini " + String(repeating: "x", count: 30)), "Office Mac mini " + String(repeating: "x", count: 15) + "…", "keeps 31 characters then adds the ellipsis")

expect(menuBarTitle(for: String(repeating: "a", count: 30) + " bbbbb"), String(repeating: "a", count: 30) + "…", "drops a trailing space before the ellipsis")

expect(String(describing: loginItemAction(for: .notRegistered)), "register", "Open at Login registers when not registered")
expect(String(describing: loginItemAction(for: .notFound)), "register", "Open at Login registers when the system has no record")
expect(String(describing: loginItemAction(for: .enabled)), "unregister", "Open at Login unregisters when enabled")
expect(String(describing: loginItemAction(for: .requiresApproval)), "openSystemSettings", "Open at Login opens System Settings when approval is needed")

if failures > 0 {
    print("\(failures) failed")
    exit(1)
}
print("All passed")
