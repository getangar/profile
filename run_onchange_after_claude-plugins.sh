#!/bin/bash
set -euo pipefail
command -v claude >/dev/null || { echo "Claude CLI non trovato, salto."; exit 0; }

marketplaces=(
  # incolla qui l'output del primo comando, es. owner/repo
  anthropics/skills
  anthropics/claude-plugins-official
)
plugins=(
  # incolla qui l'output del secondo, es. nome@marketplace
  claude-md-management@claude-plugins-official
  cloudflare@claude-plugins-official
  code-review@claude-plugins-official
  code-simplifier@claude-plugins-official
  commit-commands@claude-plugins-official
  explanatory-output-style@claude-plugins-official
  pr-review-toolkit@claude-plugins-official
  remember@claude-plugins-official
  security-guidance@claude-plugins-official
  sourcegraph@claude-plugins-official
  superpowers@claude-plugins-official
  swift-lsp@claude-plugins-official
)

for m in "${marketplaces[@]}"; do claude plugin marketplace add "$m"; done
for p in "${plugins[@]}";      do claude plugin install "$p" --scope user; done
