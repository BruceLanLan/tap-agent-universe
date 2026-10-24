# TAP Agent Universe（TapeOut agent 全景）

本仓库是 TapeOut agent 相关 TAP 工作的归档处：TapeOut TAP 家族中所有与 agent 相关内容的地图兼路线图，以及目前在 [TapeOutProtocol/TAPs](https://github.com/TapeOutProtocol/TAPs) 以 pull request 形式开放的三份 agent 草稿的只读镜像。本仓库自身不定义任何东西；草稿的评审与决定都在 TAPs 仓库进行。维护者是这些草稿的作者 Bruce（[@BruceLanLan](https://github.com/BruceLanLan)）。英文版为准，本文与之同步。[English](README.md)

## 状态（2026-10-24）

| 项 | Idea issue | Pull request | 状态 | 本仓库位置 |
|---|---|---|---|---|
| Agent Universe 地图兼路线图 | — | — | 发布在本仓库；信息性 | [docs/agent-universe.zh.md](docs/agent-universe.zh.md) |
| Agent Passport | [#80](https://github.com/TapeOutProtocol/TAPs/issues/80) | [#83](https://github.com/TapeOutProtocol/TAPs/pull/83) | 已开出；中英文正文；147 例，18 个测试 | [drafts/agent-passport](drafts/agent-passport/) |
| Policy Circuit Gate | [#81](https://github.com/TapeOutProtocol/TAPs/issues/81) | [#84](https://github.com/TapeOutProtocol/TAPs/pull/84) | 已开出；条件性草稿，没有守门合约；163 例，20 个测试 | [drafts/policy-circuit-gate](drafts/policy-circuit-gate/) |
| Circuit Jobs | [#82](https://github.com/TapeOutProtocol/TAPs/issues/82) | [#85](https://github.com/TapeOutProtocol/TAPs/pull/85) | 已开出；条件性草稿，尚无 Solidity 参考；194 例，22 个测试 | [drafts/circuit-jobs](drafts/circuit-jobs/) |

这三份草稿下的任何东西都没有部署在任何链上。之后的各条线（追加补丁、作者本人实跑、设计中的草稿）见 [ROADMAP.zh.md](ROADMAP.zh.md)。

## 怎么读

1. [docs/agent-universe.zh.md](docs/agent-universe.zh.md)：核心主张、所有 agent 相关已合并 TAP 与 PR 的分层地图、分六次读完的阅读顺序、标注"今天 / 分叉 / 未来"的使用路径、易混词表与核验状态。
2. 按地图顺序读三份草稿：Agent Passport（核心规则只依赖已合并的 TAP），然后 Policy Circuit Gate，然后 Circuit Jobs。
3. [ROADMAP.zh.md](ROADMAP.zh.md)：之后的变化记在带日期的状态日志里。

## 东西在哪

| 路径 | 内容 |
|---|---|
| `docs/` | 地图兼路线图，英文与中文 |
| `ROADMAP.md`、`ROADMAP.zh.md` | 随时更新的状态分线与带日期的状态日志 |
| `drafts/<name>/` | 一个 PR 的逐字节镜像：`TAP-draft-<name>.md` 与 `assets/`（参考代码、向量、测试）；该目录的 `README.md` 写明镜像的是哪个头提交 |
| `scripts/mirror-check.sh` | 只读地比对镜像与 PR 当前头提交 |
| `.github/workflows/ci.yml` | 重新生成每份向量文件（`--check`）并运行每套测试 |

## 如何评审或参与

评审意见请写在 PR 下（[#83](https://github.com/TapeOutProtocol/TAPs/pull/83)、[#84](https://github.com/TapeOutProtocol/TAPs/pull/84)、[#85](https://github.com/TapeOutProtocol/TAPs/pull/85)）或对应的 Idea issue 下，TAPs 编辑在那里读。对地图或路线图的指正欢迎在本仓库开 issue。镜像只通过从 PR 同步来更新，见 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 致敬与范围

本工作致敬 ERC-8004（Trustless Agents）与 ERC-8183（Agentic Commerce），它们的作者为以太坊定义了 agent 身份与 agent 作业；TapeOut 草稿是为与其已部署合约互通而写，不是这两份提案的官方扩展。

本仓库不声称与其中提到的任何钱包提供方、链、协议或标准作者（包括 ERC-8004 与 ERC-8183 的作者）有合作、集成或背书关系。互通的意思是使用其已部署的公开接口。提到钱包时，只是作为只签 EIP-712 的钱包的例子，例如 Binance Agentic Wallet（据其公开文档）。TAP 编号由 TAPs 编辑分配；这里的每份草稿都是 `tap: TBD`。

## 许可

草稿正文与向量：CC0 1.0（[LICENSE-CC0](LICENSE-CC0)）。代码与文档：MIT（[LICENSE](LICENSE)）。详见 [NOTICE](NOTICE)。
