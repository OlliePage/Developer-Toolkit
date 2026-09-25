import ServiceManagement

/// What clicking "Open at Login" should do.
enum LoginItemAction {
    case register, unregister, openSystemSettings
}

/// Maps the current login-item status to the click's action. When macOS needs the user's
/// approval, registering again just throws, so send them to System Settings → Login Items.
func loginItemAction(for status: SMAppService.Status) -> LoginItemAction {
    switch status {
    case .enabled:
        return .unregister
    case .requiresApproval:
        return .openSystemSettings
    case .notRegistered, .notFound:
        return .register
    @unknown default:
        return .register
    }
}
