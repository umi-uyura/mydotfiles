# dlx-alias-environment

## ADDED Requirements

### Requirement: 高頻度CLIツールへのエイリアス
シェル起動時に高頻度CLIツールへのエイリアスが利用可能であること。

#### Scenario: openspecコマンド
- **WHEN** ユーザーが `openspec` コマンドを実行する
- **THEN** `pnpm dlx @fission-ai/openspec` が実行される

#### Scenario: ccusageコマンド
- **WHEN** ユーザーが `ccusage` コマンドを実行する
- **THEN** `pnpm dlx ccusage` が実行される

#### Scenario: ncuコマンド
- **WHEN** ユーザーが `ncu` コマンドを実行する
- **THEN** `pnpm dlx npm-check-updates` が実行される

#### Scenario: tldrコマンド
- **WHEN** ユーザーが `tldr` コマンドを実行する
- **THEN** `pnpm dlx tldr` が実行される

### Requirement: 低頻度CLIツールのdlx実行
低頻度CLIツールをpnpm dlxで実行可能であること。

#### Scenario: surgeコマンド
- **WHEN** ユーザーが `pnpm dlx surge` を実行する
- **THEN** surgeが正常に起動する
