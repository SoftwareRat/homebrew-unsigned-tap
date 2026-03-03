# SoftwareRat/homebrew-unsigned-tap

[![CI](https://github.com/SoftwareRat/homebrew-unsigned-tap/actions/workflows/ci.yml/badge.svg)](https://github.com/SoftwareRat/homebrew-unsigned-tap/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Homebrew devs bend over backwards for Apple's Gatekeeper bullshit. They reject any app Apple didn't stamp "safe." Unsigned? Gone. Unnotarized? Deleted. This tap says fuck that.

## Apple's Scam Exposed

Pay Apple $99/year or your app gets blocked on Macs you own. Homebrew enforces this racket—won't touch anything without Apple's kiss. Meanwhile, the apps work perfectly until Gatekeeper cockblocks them.

We host the rejects: unsigned gems, unnotarized tools, casks Homebrew killed. Auto-strip quarantine so they launch clean. No System Settings dance.

## Fight Back. This Is How It Starts.

Homebrew became Apple's bitch. We're the fix. Install real software without corporate permission slips. Users run their own damn machines. Developers skip the extortion.

Got something Homebrew axed? Fork it here. Explain Apple's rejection. Build the free alternative.

## Your Disclaimer

This bypasses Homebrew's "security." Your Mac. Run what you want.

## Get It

```bash
brew tap SoftwareRat/homebrew-unsigned-tap
brew tap  # Proof
brew install --cask alacritty
# or: brew install --cask SoftwareRat/homebrew-unsigned-tap/alacritty
brew update
```

## Bail Out

```bash
brew untap SoftwareRat/homebrew-unsigned-tap
brew remove --cask alacritty
```

Apple's turning Macs into locked iPads. Homebrew helps. Time to break free.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for instructions on adding or updating casks and running local verification commands.

## Security

See [SECURITY.md](SECURITY.md) for how to report vulnerabilities and the security expectations for this tap.

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating you agree to abide by its terms.
