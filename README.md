# Opulent Knowledge System

Download the complete macOS app without a DMG.

[Download the full app ZIP](https://github.com/OpulentiaAI/icantbelieveitsnotagi/releases/download/macos-arm64-2026.10.09/Opulent-Knowledge-System-macos-arm64.zip)

## Install

1. Download the ZIP and double-click it to extract the folder.
2. Double-click `Install Opulent.command` inside the extracted folder.
3. Open Opulent from your user Applications folder.

The installer copies the full app to `~/Applications/Opulent Knowledge System.app` and requests launch. It requires no administrator password. If an app already exists there, quit it and move it to a backup location before installing. Existing app data stays in place.

This build is for Apple Silicon Macs. Its app manifest specifies macOS 12 or later. Allow about 3 GB of free space for the download, extraction and installation.

## macOS approval

This preview build has an ad hoc signature. It is not Developer ID signed or notarized. macOS may block the installer or app when downloaded from the internet. After attempting to open the blocked item, review its source, then use System Settings > Privacy & Security > Open Anyway if you trust it. Approval may be needed separately for the installer and the app.

You can also drag the app to your user Applications folder and open it there. Keep its Contents folder intact.

Apple explains this process in [Safely open apps on your Mac](https://support.apple.com/en-us/102445). A fully smooth public installation needs a Developer ID signed and notarized build.

## What is included

The ZIP includes the complete app bundle with the desktop host and packaged Opulent runtime. The runtime includes Node, Python, Git and the knowledge tools. The core tools do not require a separate developer toolchain.

Provider executables and provider account access are optional external requirements. Installation does not connect accounts, initialize a personal knowledge store or activate recurring work. Follow [AGENT-SETUP.md](AGENT-SETUP.md) for guided setup.

## Verify the download

Download `SHA256SUMS` from the same release into the folder containing the ZIP, then run:

```sh
shasum -a 256 -c SHA256SUMS
```

The app reports version `0.0.0`. The release tag identifies this distribution by date. Existing notices and license files remain inside the app. Packaging does not grant additional rights to bundled third-party components.
