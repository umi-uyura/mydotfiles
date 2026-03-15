# devdependencies-project-management

## ADDED Requirements

### Requirement: 開発ツールのdevDependencies管理
プロジェクトごとに開発ツールをdevDependenciesで管理できること。

#### Scenario: eslintのローカル実行
- **WHEN** ユーザーが `pnpm exec eslint .` を実行する
- **THEN** プロジェクトローカルのeslintが実行される

#### Scenario: DBML CLIのローカル実行
- **WHEN** ユーザーが `pnpm exec dbml2sql schema.dbml -o schema.sql` を実行する
- **THEN** DBMLからSQLが生成される

### Requirement: グローバル維持パッケージの確認
エディタ連携に必須のパッケージがグローバル維持されること。

#### Scenario: yaml-language-server確認
- **WHEN** ユーザーが `npm list -g yaml-language-server` を実行する
- **THEN** yaml-language-serverがグローバルインストール済みと表示される
