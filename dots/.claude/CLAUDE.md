# CLAUDE.md (Global)

## Shell エイリアスと Bash ツール

Node.js CLI ツールはシェルエイリアス（`shell/alias` / `doskey-alias.macros`）経由で `pnpm dlx` として定義されており、Claude Code の Bash ツールからは直接使えない。

Bash ツールで実行する場合は `pnpm dlx <package>@latest` を直接呼び出す。

例：
```bash
pnpm dlx @fission-ai/openspec@latest <subcommand>
```
