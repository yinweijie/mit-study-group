# Update Training Issue Comment 配置记录

本文记录 `yinweijie/mit-study-group` 自动更新 `datenlord/training` issue comment 的配置过程。

## 目标

- 当 `yinweijie/mit-study-group` push 到 `main` 分支后，自动编辑已有 GitHub issue comment。
- 目标评论地址：https://github.com/datenlord/training/issues/71#issuecomment-3877884203
- 目标仓库：`datenlord/training`
- 目标 issue：`71`
- 目标 comment id：`3877884203`
- 注意：workflow 必须编辑现有 comment，不能新建 comment。

## Workflow

配置文件：

```text
.github/workflows/update-training-issue-comment.yml
```

关键配置：

```yaml
on:
  push:
    branches:
      - main
```

workflow 使用 `actions/github-script@v9` 调用 GitHub REST API：

- `github.rest.issues.getComment`
- `github.rest.issues.updateComment`

脚本读取目标 comment 当前内容，然后在末尾追加本次 push 的摘要，包括：

- 分支
- pusher
- 时间
- compare URL
- commit short sha、commit URL、commit message
- added / modified / removed 文件数量

## Token 和 Secret

Secret 名称固定为：

```text
GH_ISSUE_TOKEN
```

workflow 中必须使用：

```yaml
github-token: ${{ secrets.GH_ISSUE_TOKEN }}
```

不能改回默认 `GITHUB_TOKEN`，因为默认 `GITHUB_TOKEN` 只作用于当前仓库 `yinweijie/mit-study-group`，不能稳定编辑另一个仓库 `datenlord/training` 的 issue comment。

### 推荐权限

优先选择 fine-grained personal access token：

- Resource owner / repository：`datenlord/training`
- Repository permissions：`Issues: Read and write`

如果 GitHub 页面无法选择 `datenlord/training`，则使用 classic personal access token：

- Scope：`public_repo`

本次配置时，fine-grained token 页面提示：

```text
Cannot find the specified resource owner: 'datenlord'
```

因此没有继续使用 fine-grained token。初始配置阶段曾临时使用本机已登录的 `gh` CLI 凭据写入 `GH_ISSUE_TOKEN`，用于验证 workflow 是否可行。

后续已将 `GH_ISSUE_TOKEN` 覆盖为专用 classic PAT：

```text
Secret updated: 2026-07-04T10:40:06Z
Token type: classic personal access token
Scope: public_repo
Purpose: update datenlord/training issue 71 comment 3877884203
```

token 明文没有写入代码、文档或提交历史。后续维护时，如果该 token 被撤销、过期或长期未使用失效，应重新生成同权限的 classic PAT 并覆盖更新 `GH_ISSUE_TOKEN`。

## Secret 设置命令

可以用 GitHub 页面设置：

```text
yinweijie/mit-study-group
Settings
Secrets and variables
Actions
New repository secret
Name: GH_ISSUE_TOKEN
```

也可以使用 GitHub CLI：

```powershell
gh secret set GH_ISSUE_TOKEN --repo yinweijie/mit-study-group
```

不要把 token 写入 workflow、脚本、README 或任何提交文件。

## 验证记录

### 初始失败

首次 push 后 workflow 失败：

```text
Run id: 28697959264
Error: Input required and not supplied: github-token
```

原因：`GH_ISSUE_TOKEN` 尚未配置，导致 `actions/github-script` 的 `github-token` 输入为空。

### 配置 Secret 后成功

设置 `GH_ISSUE_TOKEN` 后重跑同一个 run：

```text
Run id: 28697959264
Result: success
Updated: https://github.com/datenlord/training/issues/71#issuecomment-3877884203
```

目标评论追加了 commit：

```text
9a18230 更新：测试自动更新issue
```

### 升级 actions/github-script

为了消除 Node 20 deprecation warning，将 action 从：

```yaml
uses: actions/github-script@v7
```

升级为：

```yaml
uses: actions/github-script@v9
```

验证结果：

```text
Run id: 28698384208
Result: success
Commit: cb2fd7a chore: upgrade github-script action
```

升级后没有再出现 `Node.js 20 is deprecated` warning。

### 后续 push 验证

后续 push 也已成功触发 workflow：

```text
Run id: 28698410440
Result: success
Commit: 7b60c7d 更新：codex修复推送所需权限问题
```

## 常用排查命令

查看 secret 是否存在：

```powershell
gh secret list --repo yinweijie/mit-study-group
```

查看 workflow runs：

```powershell
gh run list --repo yinweijie/mit-study-group --workflow update-training-issue-comment.yml --branch main --event push --limit 5
```

查看某次 run 日志：

```powershell
gh run view <run-id> --repo yinweijie/mit-study-group --log
```

确认目标 comment 是否更新：

```powershell
gh api repos/datenlord/training/issues/comments/3877884203 --jq '{updated_at:.updated_at, body_tail:(.body | split("\n") | .[-20:] | join("\n"))}'
```

## 维护注意事项

- `GH_ISSUE_TOKEN` 过期或被撤销后，workflow 会再次失败。
- 如果日志出现 `Input required and not supplied: github-token`，优先检查 secret 是否存在。
- 如果日志出现 `403` 或 `Resource not accessible by integration`，说明 token 权限不足或不能访问目标 comment。
- 如果使用 fine-grained PAT，需要确认它确实授权到了 `datenlord/training`，并且 `Issues` 权限是 `Read and write`。
- 如果使用 classic PAT，公开仓库场景至少需要 `public_repo`。
