# AGENTS.md - エージェントコーディングガイドライン

**AIとのコミュニケーションは日本語で行う**

このリポジトリは、Windows、macOS、Linux/WSL での開発環境セットアップを管理するためのシェルスクリプト、設定ファイル、およびツールを含む **dotfiles** 設定リポジトリです。

## リポジトリ構造

```
./
├── bin/              # 実行可能スクリプト (bash)
├── dots/             # ドットファイル (~/.bashrc, ~/.gitconfig など)
│   ├── linux/        # Linux 固有の設定
│   ├── macos/        # macOS 固有の設定
│   ├── win/          # Windows 固有の設定
│   └── wsl/          # WSL 固有の設定
├── shell/            # シェル設定と関数
├── init/             # システム初期化/アプリセットアップ
├── doc/              # ドキュメント
├── openspec/         # OpenSpec 変更トラッキング
└── .opencode/        # OpenCode エージェントスキル
    └── skills/       # エージェントスキル定義
```

## ビルド/テストコマンド

これは従来のソフトウェアプロジェクトではなく、dotfiles リポジトリです。自動化されたテストやビルドプロセスは存在しません。

### 手動検証

ドットファイルが正しくインストールされているか確認:
```bash
./bin/chkdotfiles
```

アップデートを確認:
```bash
./bin/chkupdate
```

### セットアップスクリプト

ホームディレクトリにドットファイルをデプロイ:
```bash
cd dots && ./_setup.sh      # Unix/Linux/macOS
cd dots && ./_setup.bat      # Windows
```

### OpenSpec ワークフロー (変更トラッキング)

このリポジトリは変更のトラッキングに OpenSpec を使用します。使用可能なコマンドは `.opencode/skills/` を参照:
- `openspec-new-change` - 新しい変更を開始
- `openspec-apply-change` - 変更からタスクを実装
- `openspec-verify-change` - 実装を検証
- `openspec-archive-change` - 完了した変更をアーカイブ

## コードスタイルガイドライン

### シェルスクリプト (bash)

- `#!/usr/bin/env bash` シェバンを使う
- 適切な場合は `set -euo pipefail` で厳格なエラー処理
- `cd` コマンドの後は `|| exit` を使用
- 変数をクォート: `"$VAR"` で `$VAR` ではない
- コマンド置換には `$(command)` を使用 (バッククォートではなく)
- 関数内変数には `local` を使用
- 移植性のために `printf` を使用 (echo ではなく)
- 自明でないロジックにはコメントを追加

例:
```bash
#!/usr/bin/env bash

my_function() {
    local arg1="$1"
    local result=""

    result=$(some_command "$arg1") || return 1
    printf "%s\n" "$result"
}
```

### 設定ファイル

- 直感的な命名を使用 (例: `.bashrc_basis` でベース設定)
- プラットフォーム固有のファイルは `dots/{linux,macos,win,wsl}/` に配置
- サンプルファイルは `.example` で終わる (例: `.bashrc_local.example`)
- 複雑なネストした設定には `.config/` を使用

### Git 設定

- `defaultBranch = main` を使用
- コミットメッセージテンプレート: `~/.gitmessage.txt`
- プッシュデフォルト: `simple`
- 個人オーバーライド用に `~/.gitconfig_local` を含める
- **コミット前に変更内容を確認、必ずユーザーの承認を得てからコミットする**

### 命名規則

- シェル関数: `snake_case` (例: `my_function`)
- 変数: `snake_case` または定数の場合は `SCREAMING_SNAKE_CASE`
- 実行可能スクリプト: `snake_case` または `kebab-case`
- 設定ファイル: 隠しファイルは先頭にドット (例: `.bashrc`)

### エラー処理

- 致命的なエラーには `|| exit 1` または `return 1` を使用
- コマンドの存在確認は `hash <cmd> 2>/dev/null` を使用
- ファイルチェックには `if [ -e "$file" ]` または `if [ -d "$dir" ]` を使用
- stderr の適切なリダイレクト (`2>/dev/null` または `2>&1`)

### 移植性

- OS 検出には `$(uname)` を使用
- WSL 検出: `[[ "$(uname -r)" == *microsoft* ]]`
- 可能な限り POSIX 互換の構文を使用
- クロスプラットフォーム用に `.sh` と `.bat` 版の両方を提供

## OpenSpec コンテキスト

`openspec/config.yaml` には変更アーティファクトのプロジェクトコンテキストが含まれます:

```yaml
schema: spec-driven
```

OpenSpec アーティファクト作成時には以下を参照:
- 上記のシェルスクリプト規則
- プラットフォーム検出パターン
- `dots/` のセットアップスクリプト

## 基本原則

1. **シンプルに保つ** - dotfiles は最小限で理解しやすく
2. **クロスプラットフォームを意識** - OS 固有コードには条件分岐を使用
3. **元に戻しやすく** - 更新しやすいようコピーの代わりにシンボリックリンクを優先
4. **文書化** - 自明でない設定にはコメントを追加
