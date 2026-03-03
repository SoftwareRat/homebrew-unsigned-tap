# SoftwareRat/unsigned-tap

A Homebrew tap providing casks for macOS applications that are unsigned or unnotarized and therefore rejected by the official [Homebrew/homebrew-cask](https://github.com/Homebrew/homebrew-cask) repository.

Many quality open-source applications are built without Apple code-signing or notarization. macOS Gatekeeper blocks these apps at launch, and Homebrew Cask does not accept them. This tap fills that gap: it hosts the casks, automatically removes the quarantine attribute after installation, and keeps cask definitions up to date.

> **⚠️ Security notice**
> Installing unsigned or unnotarized software carries inherent risk. These applications have **not** been reviewed or verified by Apple. You are responsible for evaluating the trustworthiness of each application before installing it. Review the upstream project and the cask definition in the `Casks/` directory before proceeding.

---

## Quickstart

```bash
# 1. Add this tap
brew tap SoftwareRat/unsigned-tap

# 2. Install a cask (example: Alacritty)
brew install --cask alacritty

# 3. Or install using the fully-qualified name
brew install --cask SoftwareRat/unsigned-tap/alacritty

# 4. Keep casks up to date
brew update && brew upgrade --cask
```

---

## Available Casks

| Cask | Description |
|------|-------------|
| `alacritty` | GPU-accelerated terminal emulator |
| `other-double-commander` | Dual-pane file manager |
| `other-dupeguru` | Duplicate file finder |
| `other-gstreamer-runtime` | GStreamer open-source multimedia framework runtime |
| `other-lyx` | GUI document processor built on LaTeX |
| `other-okular` | KDE document viewer (PDF, EPUB, and more) |
| `other-qbittorrent` | BitTorrent client |
| `other-qownnotes` | Plain-text notepad and to-do list manager |
| `other-texstudio` | LaTeX editor |
| `other-wine-stable` | Compatibility layer for running Windows applications |

---

## Removing a Cask

```bash
# Remove an installed cask
brew uninstall --cask alacritty

# Remove this tap entirely
brew untap SoftwareRat/unsigned-tap
```

---

## Contributing

If a cask you use was removed from Homebrew Cask due to a Gatekeeper rejection, feel free to open a pull request adding it here. Please include the upstream source URL, the reason for the Gatekeeper failure, and a working cask definition.
