# タスク一覧

## 1. ファイル作成

- [ ] 1.1 `dots/.default-npm-packages` を作成（dlx用ツールリスト）
- [ ] 1.2 `shell/alias` にdlxエイリアスを追加（openspec, ccusage, ncu, tldr）
- [ ] 1.3 `init/node-npm-global-common.txt` を削除（プロジェクトごとに異なるため）

## 2. ユーザー環境適用

- [ ] 2.1 `cd dots && ./_setup.sh` でシンボルリンク更新
- [ ] 2.2 `shell/alias` の読み込み確認

## 3. グローバルパッケージ整理

- [ ] 3.1 `npm uninstall -g claude-code` でグローバル削除
- [ ] 3.2 グローバル維持パッケージ確認 (yaml-language-server, corepack, npm)

## 4. 検証

- [ ] 4.1 `openspec` コマンドが動くか確認
- [ ] 4.2 `ccusage` コマンドが動くか確認
- [ ] 4.3 `ncu -u` が動くか確認
- [ ] 4.4 `tldr` コマンドが動くか確認
- [ ] 4.5 プロジェクトで `pnpm exec eslint` が動くか確認

## 5. ドキュメント更新

- [ ] 5.1 `doc/windows-setup.md` のNode.js手順を更新
  - fnm install + corepack enable + pnpm setup を追加
  - `node-npm-globals-install.bat` の参照を削除
- [ ] 5.2 `doc/macos-setup.md` のNode.js手順を更新
  - fnm install + corepack enable + pnpm setup を追加
  - `node-npm-globals-install.sh` の参照を削除
- [ ] 5.3 `doc/propose-node-management.md` を削除（本案で obsoleted）
