import Foundation

/// The machine's full name: the Computer Name if it has any visible characters,
/// otherwise the host name without its `.local` suffix, otherwise "Unknown Mac".
func resolvedName(computerName: String?, hostName: String) -> String {
    let computer = (computerName ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
    if !computer.isEmpty { return computer }
    var host = hostName.trimmingCharacters(in: .whitespacesAndNewlines)
    if host.hasSuffix(".local") { host.removeLast(".local".count) }
    return host.isEmpty ? "Unknown Mac" : host
}

/// The menu bar text: `name`, cut to `maxLength` characters with a trailing "…" when longer.
func menuBarTitle(for name: String, maxLength: Int = 32) -> String {
    guard name.count > maxLength else { return name }
    let kept = name.prefix(maxLength - 1).trimmingCharacters(in: .whitespaces)
    return kept + "…"
}
