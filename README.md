# WhichMac

Shows this Mac's name in the menu bar, so you always know which machine you're
on — handy when hopping between Macs over Jump Desktop.

The text is the **Computer Name** from System Settings → General → Sharing.
Click it for the full name, an **Open at Login** switch, and **Quit**.

## Install

```sh
./install.sh
```

Builds the app (needs the Xcode command line tools: `xcode-select --install`),
copies it to `/Applications`, launches it and turns on Open at Login. Safe to
re-run to update.

The built app runs on Apple Silicon and Intel. To install on a Mac without the
command line tools, copy `build/WhichMac.app` to its `/Applications` and open it
once, then tick **Open at Login** in its menu.

### Put it on the left

macOS only lets apps add items to the right-hand group of the menu bar. Hold
**⌘** and drag the name to the left end of that group; macOS remembers the spot.

On a notched or crowded menu bar, macOS hides items that don't fit — if the
name disappears, free up space by removing other menu bar icons.

## Uninstall

```sh
./uninstall.sh
```

## Develop

```sh
./test.sh    # name-formatting tests
./build.sh   # build/WhichMac.app
```
