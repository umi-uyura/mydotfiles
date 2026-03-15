# Node CLI管理 方法変更 設計書

## Context

### 現状
- fnm で Node バージョン管理
- npm/pnpm でパッケージ管理（グローバルインストール主体）
- `init/node-npm-global-common.txt` でグローバルパッケージを管理
- `shell/alias` でいくつかのエイリアスを管理

### 制約
- Windows/WSL/macOS で動作が必要
- グローバルpacmanはエディタ連携 (yaml-language-server) に必要
- Homebrew版への切り替え可能なツールは移行する

### 関係者
- 自分（唯一のユーザー）

## Goals / Non-Goals

**Goals:**
- Nodeバージョン更新時にグローバルpacmanの再_install不要（dlxは新しいNodeで再DL）
- CLIツールのキャッシュ共有による高速化
- プロジェクトごとにツールバージョンを管理可能
- クロスプラットフォーム対応

**Non-Goals:**
- 既存グローバルpacmanの全削除（エディタ連携用は維持）
- Node.jsそのもののバージョン管理方法変更

## Decisions

### 1. パッケージ管理方式

| 方式 | 対象ツール | 理由 |
|------|-----------|------|
| `pnpm dlx` + alias | 高頻度CLI (openspec, ccusage, ncu) | 毎回打つのが面倒なのでエイリアス化 |
| `pnpm dlx` のみ | 低頻度CLI (gemini, http-server, etc.) | そのうち使う程度 |
| devDependencies | 開発用ツール (eslint, dbml, etc.) | プロジェクト固有バージョン管理 |
| グローバル維持 | yaml-language-server | エディタ連携に必須 |

**代替案検討:**
- `npx` vs `pnpm dlx` → pnpmの方がキャッシュ効率が良い
- 全部devDependencies → CLIツールはdlxの方が便捷

### 2. ファイル構成

| ファイル | 役割 |
|---------|------|
| `dots/.default-npm-packages` | dlx用ツール一覧 |
| `shell/alias` | 高頻度ツールのエイリアス |

### 3. Windows対応

- `shell/alias` は bash なので、PowerShell/Cmd 用に別ファイル不要か？
- → 現状: Windowsでは `mystartup.cmd` でdoskey登録済み
- → 対応: 必要に応じて `shell/doskey-alias.macros` へ追加

## Risks / Trade-offs

| リスク | 回避策 |
|--------|--------|
| dlx 初実行時のダウンロード遅延 | キャッシュ保持で2回目以降は高速 |
| エイリアス衝突 | 既存エイリアスと重複確認済み |
| Windowsでbashエイリアスが効かない | 必要に応じてdoskey追加 |

## Migration Plan

1. **事前準備**
   - `dots/.default-npm-packages` 作成
   - `shell/alias` にdlxエイリアス追加

2. **適用（ユーザー環境）**
   - `cd dots && ./_setup.sh` でシンボルリンク更新
   - グローバル削除: `npm uninstall -g claude-code`
   - 動作確認: 各エイリアスが動くか確認

3. **検証**
   - `which openspec` → `pnpm dlx` のエイリアス確認
   - `ncu -u` が動くか確認
   - プロジェクトで `pnpm exec eslint` が動くか確認

## Open Questions

- ~~tldr~~ はエイリアス化する（高頻度ツールとして）
