#!/usr/bin/env bash
set -euo pipefail
# Explicit user-level plugin installation. Not invoked by project setup.
# The official marketplace entry currently pins the release recorded in shared/upstream-lock.json.
codex plugin marketplace add https://github.com/anthropics/claude-plugins-official.git
exec codex plugin add superpowers@claude-plugins-official --json
