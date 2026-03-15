# Node CLI管理 方法変更 プロポーザル

## Why

現在のグローバルnpmパッケージ運用には以下の課題がある：
- Nodeバージョン更新時にグローバルパッケージの再インストールが必要
- グローバルにあると、プロジェクトごとに異なるバージョンを管理できない
- キャッシュ効率が悪い

pnpm dlx + devDependencies運用にすることで、Node更新時の再_install不要、キャッシュ共有による高速化、プロジェクトごとのバージョン管理が可能になる。

## What Changes

1. **dlx化**: CLIツールをグローバルinstallからpnpm dlxへ移行
   - openspec, gemini-cli, ccusage, ncu, http-server, js-beautify, qnm, surge, tldr
2. **devDependencies化**: プロジェクト固有ツールをpackage.json管理へ
   - @dbml/cli, @softwaretechnik/dbml-renderer, eslint, eslint-plugin-vue, html-validate, dbdocs
3. **グローバル削除**: 不要パッケージをアンインストール
   - claude-code (Homebrew版へ切り替え)
4. **ファイル追加**:
   - `dots/.default-npm-packages`: dlx用ツールリスト
   - `shell/alias`: 高頻度ツールのエイリアス (openspec, ccusage, ncu, tldr)
5. **ファイル削除**:
   - `init/node-npm-global-common.txt` を削除（プロジェクトごとに異なるため）

## Capabilities

### New Capabilities
- **dlx-alias-environment**: 高頻度CLIツールへのエイリアス (openspec, ccusage, ncu, tldr)
- **devdependencies-project-management**: プロジェクトローカルでの開発ツール管理

### Modified Capabilities
- (なし - 新規導入)

## Impact

- `dots/.bashrc_basis`: 変更なし (fnm初期化は維持)
- `shell/alias`: dlxエイリアス追加
- `dots/.default-npm-packages`: 新規作成
- `init/node-npm-global-common.txt`: 削除（プロジェクトごとに異なるため）
- ユーザー環境: グローバルnpmパッケージ一部削除
