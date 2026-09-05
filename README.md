# Codex 技能与适配入口

作为业务项目根目录的 `.agents` submodule 使用。Codex 从 `.agents/skills/` 发现技能，支持相对软链接。

- `skills/` 中 13 个共用技能目录链接到 shared（Karpathy + 完整 OpenSpec）。
- `git-commit`、`git-release` 和 10 个 `speckit-*` 是 Codex 薄入口；`references` 链接到 shared 流程，不复制正文。
- Codex 用 `$openspec-propose`、`$openspec-apply-change`、`$speckit-plan`、`$git-commit` 等技能入口；Claude 的 slash command 语法不照搬。
- `codex/config.example.toml` 只是可选配置说明，不会自动加载；如果项目需要，配置应在业务项目 `.codex/config.toml`，不在 `.agents/config.toml`。当前没有强制覆盖个人模型、权限或提供商。

完整安装、版本、升级和冲突处理见 [shared README](ai-share-config/README.md)。

```sh
# 在业务项目根目录
git submodule update --init --recursive
bash .agents/scripts/setup.sh --project .   # 仅当该项目使用 Spec Kit
python3 .agents/ai-share-config/scripts/check.py --modules .claude .agents
```

新会话中检查技能选择器。安装脚本只部署 Spec Kit 项目资源，不生成 AGENTS.md、不修改项目任务或全局配置。共用规范由项目自己的 AGENTS.md 按需引用。

## Superpowers

使用官方发布的插件，不在此再复制 Superpowers skills。可在 Codex Plugins 中安装 Superpowers；也可显式执行：

```sh
bash .agents/scripts/install-superpowers.sh
codex plugin list --json
```

CLI 脚本使用已核对的 `claude-plugins-official` 官方市场中的 Superpowers 发布项（同时包含 Codex 插件 manifest）。这会修改用户级插件安装，不由项目 setup 自动执行。安装后核对 shared/upstream-lock.json 中的版本；若客户端不支持该市场，请使用 Codex Plugins 界面安装官方 Superpowers。不要再额外复制同名技能。

参考：[Codex skills](https://learn.chatgpt.com/docs/build-skills)、[配置层级](https://learn.chatgpt.com/docs/config-file/config-basic)。
