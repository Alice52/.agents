---
name: speckit-clarify
description: Execute the Spec Kit clarify workflow with current core behavior and shared Chinese customizations. Use when the user requests the Spec Kit clarify phase.
---

Use the current request as input. Read [shared customizations](../../ai-share-config/workflows/speckit/customizations.md), then [the clarify workflow](../../ai-share-config/workflows/speckit/clarify.md).
Map logical `speckit.<phase>` identifiers to `$speckit-<phase>`; use available Codex tools (or ask directly when no question tool is available). Extension commands live under the business project's `.specify/extensions/<id>/commands/`: read their command file and execute it, rather than pretending a slash command ran.
Run shell commands in the business project root. After the plan phase, run `${SPECKIT_PYTHON:-python3} .agents/ai-share-config/scripts/update-context.py --project . --context-file AGENTS.md`.
