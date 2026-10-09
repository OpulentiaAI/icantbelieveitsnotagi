# Agent setup

Use these instructions to install the complete Opulent Knowledge System app on an Apple Silicon Mac and verify the result.

## Install the package

1. Download `Opulent-Knowledge-System-macos-arm64.zip` and `SHA256SUMS` from the `macos-arm64-2026.10.09` release in `OpulentiaAI/icantbelieveitsnotagi`.
2. Run `shasum -a 256 -c SHA256SUMS` in the download folder. Continue only when the ZIP reports `OK`.
3. Extract the complete ZIP. Keep `Install Opulent.command` beside `Opulent Knowledge System.app`.
4. From the extracted folder, run `/bin/bash "./Install Opulent.command" --check`. A zero exit verifies the source signature and platform requirements. It does not prove installation or launch.
5. Run `/bin/bash "./Install Opulent.command"`. It installs under the current user's Applications folder. If a copy already exists, preserve it in a backup location after quitting it. Preserve all application data. If disk space is insufficient, report the required space and let the user choose what to remove.
6. If Gatekeeper blocks the app, direct the user to the approval steps in README.md. Keep system security settings enabled.

## Verify installation

Run these commands after installation:

```sh
APP="$HOME/Applications/Opulent Knowledge System.app"
RUNTIME="$APP/Contents/Resources/opulent-runtime"
codesign --verify --deep --strict "$APP"
"$RUNTIME/bin/opulent-knowledge" --help
open "$APP"
```

Confirm that the app window opens and that the knowledge CLI prints help without missing runtime errors. Report signature, CLI and visible launch results separately. A successful `open` command alone is not proof of a working window.

## Set up the user's agents

Read the installed onboarding instructions before configuring the runtime. Use the RUNTIME variable defined above:

```sh
cat "$RUNTIME/INSTALL.md"
cat "$RUNTIME/docs/onboarding.md"
cat "$RUNTIME/skills/opulent-onboarding/SKILL.md"
cat "$RUNTIME/runtime.json"
```

The runtime manifest lists the build inventory and optional external requirements.

Ask the user which provider they intend to use and follow that provider's installed guidance. Provider binaries and account authorization are separate from the app package. Keep credentials out of commands, transcripts and repository files.

Obtain an explicit owner and private home before initializing a knowledge store. Activate account connections or recurring runners only within the user's requested scope. Report any provider setup that still needs credentials or operating system consent.

## Completion

Report the installed path, the release tag, the signature result, the knowledge CLI result and the visible app result. List provider connections that were actually verified. Identify any remaining setup separately from app installation.
