## Context

Windows 環境では fnm で Node.js を管理し、corepack 経由で pnpm をセットアップする構成が `doc/windows-setup.md` に記載されている。cmd.exe 用のエイリアスは `shell/doskey-alias.macros` で一元管理されており、`dots/_setup.bat` によって `$HOME` にシンボリックリンクされる。

macOS/WSL 側では `shell/alias`（bash）に高頻度ツールのエイリアスを定義し、低頻度ツールは `dots/.default-npm-packages` に列挙して `pnpm dlx` で直接実行する方針が 2026-03-15 の変更で確立済み。Windows もこの方針に揃える。

現状の課題：
- `shell/alias` の bash エイリアスは Windows/cmd.exe では機能しないため、対応するエイリアスが未定義のまま

`pnpm dlx <tool>` はパッケージを一時的にダウンロード・実行する仕組みで、グローバル環境を汚染しない。cmd.exe 上で `doskey` マクロとして定義することで、ツール名だけで呼び出せるようにする。

## Goals / Non-Goals

**Goals:**
- `doskey-alias.macros` に `pnpm dlx` ベースのエイリアスを追加し、`shell/alias` と同じ高頻度ツールを cmd.exe でも実行できるようにする
- `doc/windows-setup.md` の Node.js セクションに `pnpm dlx` の使い方と `dots/.default-npm-packages` への言及を追記する

**Non-Goals:**
- Windows 専用のツール管理ファイル作成（`dots/.default-npm-packages` をクロスプラットフォームな一覧として共用）
- PowerShell や bash（WSL）向けのエイリアス設定（別途管理）
- pnpm 自体のセットアップ手順の変更（既存フロー継続）
- プロジェクトローカルの `devDependencies` 管理（`package.json` は各プロジェクト側の責務）

## Decisions

### doskey マクロの形式と対象ツール

`pnpm dlx <package> $*` 形式を採用する。対象は `shell/alias` に登録済みの高頻度ツールと揃える（openspec、ccusage、ncu、tldr）。

```
openspec=pnpm dlx @fission-ai/openspec $*
ccusage=pnpm dlx ccusage $*
ncu=pnpm dlx npm-check-updates $*
tldr=pnpm dlx tldr $*
```

- `$*` で引数をすべて渡す（doskey の慣習に合わせる）
- 低頻度ツール（`dots/.default-npm-packages` 記載分）はエイリアスを定義せず `pnpm dlx` 直接実行

### ツール管理の方針

`dots/.default-npm-packages` を低頻度ツールのクロスプラットフォーム一覧として引き続き活用する。Windows 専用の管理ファイルは作成しない。

## Risks / Trade-offs

- **初回実行が遅い** → `pnpm dlx` は初回にダウンロードが発生する。頻繁に使うツールはキャッシュされるため2回目以降は速い。許容範囲とみなす。
- **doskey マクロは cmd.exe 専用** → PowerShell や bash では効かない。WSL は別途管理済みのため問題なし。
- **`$*` の引数展開** → doskey の `$*` はスペース区切りの全引数を渡す。引用符付き引数の扱いは cmd.exe の制限に依存するが、`pnpm dlx` の既存の動作範囲で問題ない。
