## Why

Windows 環境では fnm + corepack 経由で pnpm をセットアップしているが、Node.js の CLI ツールをグローバルインストールで管理する慣習が残っており、バージョン管理や環境汚染の問題が生じやすい。`pnpm dlx` をベースにすることで、グローバルインストールを最小化し、ツールを都度オンデマンド実行できる一貫した方針を確立する。

## What Changes

- `shell/doskey-alias.macros` に `pnpm dlx` ベースの Node.js CLI ツール用エイリアスを追加する（cmd.exe 向け）
- Windows セットアップ手順（`doc/windows-setup.md`）の Node.js セクションを更新し、`pnpm dlx` による CLI ツール実行を標準とする手順を追加する
- 低頻度ツールは既存の `dots/.default-npm-packages` を参照して `pnpm dlx` で直接実行する方針とし、Windows 専用の管理ファイルは作成しない

## Capabilities

### New Capabilities

- `node-tools-pnpm-dlx`: Windows 環境で Node.js CLI ツールを `pnpm dlx` ベースで実行するための設定。高頻度ツールの `doskey-alias.macros` へのエイリアス追加と、`shell/alias`（bash）との方針統一を含む。

### Modified Capabilities

（なし）

## Impact

- `shell/doskey-alias.macros`：`pnpm dlx <tool>` 形式のエイリアス追加（Windows/cmd.exe 専用）
- `doc/windows-setup.md`：Node.js セクションの手順更新
- `dots/.default-npm-packages`：低頻度ツール一覧として既存ファイルをそのまま活用（変更なし）
- 依存関係：fnm・pnpm がセットアップ済みであることが前提（既存フローを継続）
