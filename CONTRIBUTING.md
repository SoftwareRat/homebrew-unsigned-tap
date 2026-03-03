# Contributing to homebrew-unsigned-tap

Thank you for contributing! This tap hosts Homebrew casks for unsigned or
unnotarized macOS applications that cannot be accepted into the official
Homebrew/homebrew-cask repository.

## Table of Contents

- [Adding a New Cask](#adding-a-new-cask)
- [Updating an Existing Cask](#updating-an-existing-cask)
- [Local Verification](#local-verification)
- [Pull Request Guidelines](#pull-request-guidelines)

---

## Adding a New Cask

1. **Check eligibility** — the application must be unsigned or unnotarized and
   therefore ineligible for the official Homebrew tap.

2. **Create the cask file** in the `Casks/` directory. Use an existing cask as
   a reference:

   ```
   Casks/<token>.rb
   ```

   The token must be lowercase, use hyphens (not underscores), and match the
   application name as closely as possible.

3. **Minimum required fields**:

   ```ruby
   cask "<token>" do
     version "<version>"
     sha256 "<sha256_of_download>"

     url "<download_url>"
     name "<Full Application Name>"
     desc "<One-line description>"
     homepage "<https://homepage.example.com>"

     app "<AppName>.app"
   end
   ```

4. **Include a `postflight` block** to strip the quarantine attribute so the
   app launches without a Gatekeeper prompt:

   ```ruby
   postflight do
     system "xattr", "-r", "-d", "com.apple.quarantine", "#{appdir}/<AppName>.app"
   end
   ```

5. **Calculate the SHA-256** of the download URL:

   ```bash
   curl -L "<download_url>" | shasum -a 256
   ```

---

## Updating an Existing Cask

1. Update `version` and `sha256` to the new values.
2. Verify that the `url` still resolves correctly for the new version.
3. Run local checks (see below) before opening a PR.

---

## Local Verification

Before submitting a PR, run the following commands from your machine:

```bash
# Tap this repository (first time only)
brew tap SoftwareRat/homebrew-unsigned-tap

# Style check — must pass with no errors
brew style --cask Casks/<token>.rb

# Audit check — must pass (warnings about unsigned apps are expected)
brew audit --cask --online SoftwareRat/homebrew-unsigned-tap/<token>

# Install and smoke-test
brew install --cask SoftwareRat/homebrew-unsigned-tap/<token>
```

Fix any errors reported by `brew style` or `brew audit` before submitting.

---

## Pull Request Guidelines

- Open one PR per cask (new or updated).
- Fill in the pull request template completely.
- Ensure `brew style` and `brew audit --cask` pass locally.
- Do **not** change cask behavior unless required by a style/audit fix.
- Keep commit messages concise (e.g. `alacritty: update to 0.16.1`).

By contributing you agree to the [Code of Conduct](CODE_OF_CONDUCT.md).
