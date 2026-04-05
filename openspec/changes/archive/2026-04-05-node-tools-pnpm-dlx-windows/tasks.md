## 1. doskey エイリアスの追加

- [x] 1.1 `shell/doskey-alias.macros` に `pnpm dlx` セクションのコメントを追加し、`shell/alias` と揃えた5ツール分のエイリアスを追加する（openspec、ccusage、ncu、tldr、react-doctor）
- [x] 1.2 各エイリアスが `@latest` 付きパッケージ名で統一されていることを確認する

## 2. ドキュメント更新

- [x] 2.1 `doc/windows-setup.md` の Node.js セクションに `pnpm dlx` 運用方針の説明を追記する（高頻度ツールはエイリアス経由、低頻度ツールは `dots/.default-npm-packages` 参照のうえ `pnpm dlx` 直接実行）
- [x] 2.2 新規ツール追加時の手順（`doskey-alias.macros` と `shell/alias` の両方に追加すること）を `doc/windows-setup.md` に明記する

## 3. グローバルパッケージのアンインストール

- [x] 3.1 `pnpm dlx` 化対象パッケージをアンインストールする（openspec、ccusage、npm-check-updates、http-server、js-beautify、qnm、@google/gemini-cli）
- [x] 3.2 devDependencies 化対象パッケージをアンインストールする（@dbml/cli、@softwaretechnik/dbml-renderer、eslint、eslint-plugin-vue、html-validate、dbdocs）

## 4. 動作確認

- [x] 4.1 cmd.exe 上で `openspec --version` が `pnpm dlx` 経由で起動することを確認する（グローバル削除後）
- [x] 4.2 cmd.exe 上で `ncu --version` が動作することを確認する（グローバル削除後）
