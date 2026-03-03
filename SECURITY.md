# Security Policy

## Purpose of This Tap

This tap distributes macOS applications that are **unsigned or unnotarized**
and therefore cannot be hosted in the official Homebrew/homebrew-cask
repository. Every cask in this tap strips the macOS quarantine attribute
(`com.apple.quarantine`) via `xattr` so that Gatekeeper does not block the
application at launch.

**Installing software from this tap bypasses macOS Gatekeeper. You accept full
responsibility for the risk.** Only install casks you trust.

## Security Expectations

| Expectation | Detail |
|---|---|
| Code review | All PRs are reviewed before merging. |
| Reproducible downloads | Each cask pins an exact version and `sha256` checksum. |
| No credential storage | This tap stores no tokens, passwords, or secrets. |
| Quarantine removal | Casks intentionally remove the quarantine attribute — this is expected behavior. |

## Reporting a Vulnerability or Issue

If you discover a security problem (e.g., a cask that downloads from a
compromised URL, an incorrect SHA-256 that could allow substitution attacks, or
a cask that runs unexpected privileged code), please report it **responsibly**:

1. **Open a GitHub Issue** in this repository describing the problem.
   - Use the **Bug Report** template and label it `security`.
   - Include the cask token, the affected version, and a clear description of
     the risk.

2. For issues that are particularly sensitive (e.g., potential supply-chain
   attacks), you may instead email the maintainer directly at the address listed
   in their GitHub profile before opening a public issue.

3. We aim to triage security reports within **72 hours** and to publish a fix
   within **7 days** of confirmation.

## Out of Scope

- Gatekeeper warnings themselves — they are expected and documented.
- Upstream application vulnerabilities — report those to the application vendor.
- Issues that require physical access to the machine.

## Responsible Disclosure

We follow a coordinated disclosure model. Please allow reasonable time for a
fix before publishing details publicly.
