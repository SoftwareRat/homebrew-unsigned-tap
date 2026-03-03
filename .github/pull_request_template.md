## Description

<!-- What does this PR do? New cask, version bump, or fix? -->

## Checklist

- [ ] Cask file is in `Casks/` and named `<token>.rb`
- [ ] `version` and `sha256` are correct for the release
- [ ] `brew style --cask Casks/<token>.rb` passes locally
- [ ] `brew audit --cask SoftwareRat/homebrew-unsigned-tap/<token>` passes locally
- [ ] A `postflight` block removes `com.apple.quarantine` (for new casks)
- [ ] I have read [CONTRIBUTING.md](../CONTRIBUTING.md)

## For new casks only

- [ ] The application is unsigned or unnotarized (and therefore ineligible for homebrew-cask)
- [ ] Rationale for inclusion is noted in the PR description below

### Rationale

<!-- Why does this app belong in this tap? -->
