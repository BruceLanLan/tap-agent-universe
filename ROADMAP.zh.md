# 路线图

TapeOut agent 相关 TAP 工作的实时状态。下面各条线源自 2026-10-24 发布的[地图](docs/agent-universe.zh.md)第 4 节；此后在这里保持更新，每次变化都在[状态日志](#状态日志)里记一条带日期的条目。文中的 § 指[地图](docs/agent-universe.zh.md)的章节。英文版为准，本文与之同步。[English](ROADMAP.md)

顺序是定的：本图，然后三个新 pull request，然后后续各条线。每条线写的是今天的实际状态；状态变化时在此更新。

## 现在：三份新草稿

| 顺序 | 草稿 | Idea issue | Pull request | 今天的状态 |
|---|---|---|---|---|
| 0 | 本图 | — | — | 发布在本仓库；信息性 |
| 1 | Agent Passport | [#80](https://github.com/TapeOutProtocol/TAPs/issues/80) "Agent Passports for Container Services (Application)" | [#83](https://github.com/TapeOutProtocol/TAPs/pull/83) | 中英文正文完整；147 例，18 个测试 |
| 2 | Policy Circuit Gate | [#81](https://github.com/TapeOutProtocol/TAPs/issues/81) "Policy Circuit Gate (Application)" | [#84](https://github.com/TapeOutProtocol/TAPs/pull/84) | 条件性草稿；没有守门合约；163 例，20 个测试 |
| 3 | Circuit Jobs | [#82](https://github.com/TapeOutProtocol/TAPs/issues/82) "Circuit Jobs: Settling Agent Jobs by a Dispute Game (Application)" | [#85](https://github.com/TapeOutProtocol/TAPs/pull/85) | 条件性草稿；尚无 Solidity 参考；194 例，22 个测试 |

三个 PR 都已开出：#83、#84、#85。

**Agent Passport。** 当同一地址同时持有一枚 TapeOut 电路和一个 ERC-8004 身份，身份的元数据指名该电路（`tap.passport`），电路站点反过来只指名这一个 `agentId`，且身份的 `agentWallet` 就是持有人时，护照成立。Passport 规定工具如何在一个钉住的区块上解析它（先链后文件、严格一致），显示什么（CONFIRMED 或一个具名原因），以及持有人纪元如何让前任持有人的声誉不落到新持有人身上。其核心规则只依赖已合并的 TAP-10、TAP-11、TAP-13 和已部署的 ERC-8004 注册表；它提到的其他 PR 都是条件性引用。

**Policy Circuit Gate。** agent 的支出规则写成一份 `tapnet/1` 电路；规则的网表哈希由 EIP-712 `PolicyBinding` 绑定到主体；对方把支出请求编码成一个 128 位字，重跑电路；只有 `allow = 1, reason = 0` 才放行。五个示例策略大小在 135 到 5,076 字节之间。策略门只约束去核查它的那一方，不是签名护栏。

**Circuit Jobs。** 一个同时充当 ERC-8183 作业评估者与钩子的合约。作业规格指明电路、输入、长度和预算；提供方在 #74 博弈中提出主张，并把主张 id 作为交付物提交；主张被接受时评估者完成作业，被驳回时拒绝作业，没有任何裁量。它以一个结算时限真正成立的博弈为前提（见 §9 第 4 条）。

## 下一步：对已有 PR 的追加补丁

已按目标 PR 当前头提交准备成小补丁，在三个新 PR 开出**之后**再推。都不新增向量。

| 目标 | 补丁 | 性质 | 状态 |
|---|---|---|---|
| [#16](https://github.com/TapeOutProtocol/TAPs/pull/16) | 由护照生成 A2A 名片（只用于显示），以及 MCP 2026-07-28 修订版说明 | 信息性 | 已备好 |
| [#47](https://github.com/TapeOutProtocol/TAPs/pull/47) | 阶段 0 委托书与其他委托格式的关系、A2A 任务映射、冻结持有人风险 | 大部分信息性；两个 SHOULD | 已备好 |
| [#59](https://github.com/TapeOutProtocol/TAPs/pull/59) | 托管通道与 x402 回执的关系 | 信息性 | 已备好 |
| [#54](https://github.com/TapeOutProtocol/TAPs/pull/54) | 可选、只读地把评价镜像到 ERC-8004 声誉 | 可选章节 | 考虑中 |

这些补丁落地前还有三个问题未定：agent 的默认委托期（Passport 是 7 天，#47 补丁是 30 天，与该草稿的最长委托期一致）；评价是否可以镜像到 ERC-8004 声誉；电路的买家是否继承其评价（#54 的理由部分说继承；Passport 让 #54 评价留在容器上，但不把较早纪元的声誉记到当前持有人名下）。

## 以后：需要作者本人实跑

| 项 | 原因 | 状态 |
|---|---|---|
| 主网小额实跑护照流程 | 还没有人在主网上把完整流程跑通；跑通前 Passport 的流程说明保持"未验证" | 未做 |
| 在新区块上重跑分叉实测 | ERC-8004 注册表和 ERC-8183 内核都可升级；§8 的事实只对块 129,352,831 成立 | 任何部署前必须做 |
| 把参考合约部署到 BSC 测试网 | 链 97 今天没有 TapeOut 合约，端到端演示只能用本地分叉 | 未做 |
| 钱包行为实测 | 例如签名钱包对同一条 EIP-712 消息两次签名是否相同，这决定只签 EIP-712 的持有人能否使用 TAP-10 密封收件箱（§9 第 2 条） | 未做 |

## 设计中

另有两份草稿，**争议经济**（#74 博弈的保证金、期限与结算时限）和**可验证网表竞赛**（参赛结果由博弈裁决，结果发为凭证），目前只在本地。它们尚未提交，依赖尚未定下的设计问题，主要是并行争议如何计数、博弈采用哪种结算模型。Circuit Jobs 不引用二者的任何规则，只依赖博弈结算时限这一视图的含义。

## 状态日志

最新的条目在最上面。每条写明变了什么、在哪里。

- **2026-10-24。** 地图兼路线图发布（[docs/agent-universe.zh.md](docs/agent-universe.zh.md)，中英文）。三份新草稿在 TapeOutProtocol/TAPs 以 PR 形式开出：Agent Passport [#83](https://github.com/TapeOutProtocol/TAPs/pull/83)（Idea [#80](https://github.com/TapeOutProtocol/TAPs/issues/80)）、Policy Circuit Gate [#84](https://github.com/TapeOutProtocol/TAPs/pull/84)（Idea [#81](https://github.com/TapeOutProtocol/TAPs/issues/81)）、Circuit Jobs [#85](https://github.com/TapeOutProtocol/TAPs/pull/85)（Idea [#82](https://github.com/TapeOutProtocol/TAPs/issues/82)）。本仓库建立，含三个 PR 在头提交 `cae25e6`、`7827c07`、`01e4ee8` 处的镜像。
