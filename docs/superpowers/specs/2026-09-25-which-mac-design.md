# WhichMac — design

## Problem

Switching between several Macs in Jump Desktop, the machine name flashes once on
connect and is easy to miss. Nothing on screen afterwards says which machine you
are on.

## Goal

A persistent, glanceable label in the menu bar showing the current Mac's name,
on every machine.

**Success:** after switching machines, a single glance at the menu bar tells you
which Mac you are on, with no clicks.

## Constraints

- macOS gives the left side of the menu bar to the Apple menu and the frontmost
  app's menus. Third-party items can only live in the right-hand status area.
  Chosen placement: the leftmost slot of that status area, set once by the user
  with ⌘-drag (macOS persists it).
- On a notched or crowded menu bar, macOS hides status items that don't fit. No
  API prevents this. Accepted risk; fallback if it bites is a click-through
  overlay window (out of scope now).

## Behaviour

- Status item title = the Mac's Computer Name (`Host.current().localizedName`,
  the value in System Settings → General → Sharing), plain text, system menu bar
  font, no icon.
- No Dock icon, no windows (`LSUIElement`).
- Clicking the item opens a menu:
  1. The full name, disabled (readable if the bar truncates it).
  2. separator
  3. **Open at Login** — checkmark reflects `SMAppService.mainApp.status == .enabled`;
     clicking toggles register/unregister. On error, the checkmark stays as the
     real status (re-read after the attempt) and the error is logged via NSLog.
  4. **Quit WhichMac** (⌘Q).
- The name is re-read each time the menu opens (and the title updated), so a
  rename is picked up on the next click without a restart. If the name is
  unavailable, the title falls back to the host name from `ProcessInfo`.

## Components

| File | Purpose |
|------|---------|
| `Sources/main.swift` | The whole app: `AppDelegate` owning the `NSStatusItem`, menu, and login-item toggle. |
| `Resources/Info.plist` | Bundle id `com.ollie.whichmac`, `LSUIElement = true`, min macOS 13 (for `SMAppService`). |
| `build.sh` | `swiftc` for arm64 and x86_64, `lipo` into a universal binary, assemble `build/WhichMac.app`, ad-hoc `codesign`. |
| `install.sh` | Run `build.sh`, quit any running copy, replace `/Applications/WhichMac.app`, launch it, enable Open at Login. Idempotent. |
| `uninstall.sh` | Disable Open at Login, quit, remove from `/Applications`. |
| `README.md` | Install, ⌘-drag placement, uninstall, notch caveat. |

Enabling Open at Login from `install.sh`: the app accepts a
`--enable-login-item` argument that registers `SMAppService.mainApp` on launch.
`install.sh` launches with `open /Applications/WhichMac.app --args --enable-login-item`.

## Out of scope

Custom text/nicknames, colours, the overlay window, auto-update, notarisation.

## Testing

Logic is trivial, so verification is end-to-end on this Mac:

1. `./build.sh` succeeds; `lipo -archs` reports `x86_64 arm64`; `codesign -v` passes.
2. `./install.sh` succeeds; the process is running; a menu bar screenshot shows
   the computer name.
3. `SMAppService` reports enabled after install (checked via the menu checkmark
   and System Settings → Login Items, or `sfltool dumpbtm`).
4. `./install.sh` run a second time succeeds (idempotent).
