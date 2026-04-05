## ADDED Requirements

### Requirement: doskey エイリアスによる pnpm dlx ツール実行

`shell/doskey-alias.macros` に、高頻度 Node.js CLI ツールを `pnpm dlx` 経由で実行するエイリアスを定義する。エイリアスは `pnpm dlx <package> $*` 形式とし、引数をすべてツールに転送する。対象ツールは `shell/alias`（bash）に登録済みの高頻度ツールと揃える。

#### Scenario: エイリアスでツールを実行できる

- **WHEN** cmd.exe 上でエイリアス名（例: `openspec`）に引数を付けて実行する
- **THEN** 対応する `pnpm dlx <package> <引数>` が実行され、グローバルインストールなしでツールが起動する

#### Scenario: 低頻度ツールはエイリアス登録しない

- **WHEN** `dots/.default-npm-packages` に記載されている低頻度ツールを使いたい場合
- **THEN** `pnpm dlx <tool>` を直接実行する（doskey エイリアスは不要）

### Requirement: グローバルインストール済みパッケージの削除

`pnpm dlx` 化または devDependencies 化の対象パッケージは npm グローバルからアンインストールする。`yaml-language-server`（エディタ連携必須）は維持する。macOS/WSL 側の 2026-03-15 変更と同一の方針を Windows にも適用する。

#### Scenario: pnpm dlx 化対象がグローバルに残っていない

- **WHEN** `npm list -g --depth 0` を実行する
- **THEN** openspec、ccusage、npm-check-updates、http-server、js-beautify、qnm、@google/gemini-cli がリストに含まれない

#### Scenario: devDependencies 化対象がグローバルに残っていない

- **WHEN** `npm list -g --depth 0` を実行する
- **THEN** @dbml/cli、@softwaretechnik/dbml-renderer、eslint、eslint-plugin-vue、html-validate、dbdocs がリストに含まれない

#### Scenario: yaml-language-server はグローバルに維持される

- **WHEN** `npm list -g --depth 0` を実行する
- **THEN** yaml-language-server がリストに含まれる

### Requirement: Windows セットアップドキュメントへの記載

`doc/windows-setup.md` の Node.js セクションに、`pnpm dlx` によるツール実行の方針を追記する。高頻度ツールは `doskey-alias.macros` でエイリアス化済みであること、低頻度ツールは `dots/.default-npm-packages` を参照して `pnpm dlx` で直接実行することを説明する。

#### Scenario: セットアップ手順を参照してツール実行方針を把握できる

- **WHEN** `doc/windows-setup.md` の Node.js セクションを読む
- **THEN** `pnpm dlx` をデフォルトとする方針と、高頻度/低頻度ツールの使い分けが説明されている

#### Scenario: 新規ツール追加時の手順が明示されている

- **WHEN** 新しい Node.js CLI ツールを追加したい場合
- **THEN** 高頻度ツールは `doskey-alias.macros` へ追加し、低頻度ツールは `dots/.default-npm-packages` へ追記するという手順が文書化されている
