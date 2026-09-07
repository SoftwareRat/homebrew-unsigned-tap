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

4. **Mandatory `postflight` for app bundles** — every cask with an app bundle
   must include a `postflight` block that removes the quarantine attribute so
   the app launches without a Gatekeeper prompt:

   ```ruby
   postflight_steps do
     run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/AppName.app"]
   end
   ```

5. **If importing from upstream, keep behavior intact**:

   - Keep upstream stanzas unless they conflict with this tap's goals.
   - Do not keep active `disable!` lines in this tap.
   - Convert upstream disable state to an informational comment.

6. **Calculate the SHA-256** of the download URL:

   ```bash
   curl -L "<download_url>" | shasum -a 256
   ```

---

## Updating an Existing Cask

1. Update `version` and `sha256` to the new values.
2. Verify that the `url` still resolves correctly for the new version.
3. Run local checks (see below) before opening a PR.

## Syncing with Upstream Gatekeeper Disables

If your goal is to keep this tap aligned with upstream casks disabled for
`fails_gatekeeper_check`, sync from the official API first, then submit only
the missing tokens.

```bash
curl -s https://formulae.brew.sh/api/cask.json \
   | jq -r '.[] | select(.disable_args.because == "fails_gatekeeper_check") | .token'
```

When importing a cask from upstream, do not keep an active `disable!` stanza
in this tap. Convert it to an informational comment, e.g.:

```ruby
# Upstream disable! date: "2026-09-01", because: :fails_gatekeeper_check
```

During bulk syncs, existing casks in this repo are considered compliant if
they satisfy these requirements:

- No active `disable!` stanza remains.
- `brew style --cask` passes.
- `brew audit --cask` is clean except expected unsigned/notarization warnings.

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
