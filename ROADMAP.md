# Roadmap

Living status of the TapeOut agent TAP work. The lanes below started as §4 of the [map](docs/agent-universe.md) as published on 2026-10-24; from now on they are kept current here, and every change gets a dated entry in the [status log](#status-log). Section references (§) point to the [map](docs/agent-universe.md). [中文](ROADMAP.zh.md)

The order is fixed: this map, then the three new pull requests, then the later lanes. Each lane says what is true today; statuses are updated here as they change.

## Now: the three new drafts

| Order | Draft | Idea issue | Pull request | Status today |
|---|---|---|---|---|
| 0 | This map | — | — | Published in this repository; informative |
| 1 | Agent Passport | [#80](https://github.com/TapeOutProtocol/TAPs/issues/80) "Agent Passports for Container Services (Application)" | [#83](https://github.com/TapeOutProtocol/TAPs/pull/83) | Text complete in English and Chinese; 147 cases, 18 tests |
| 2 | Policy Circuit Gate | [#81](https://github.com/TapeOutProtocol/TAPs/issues/81) "Policy Circuit Gate (Application)" | [#84](https://github.com/TapeOutProtocol/TAPs/pull/84) | Conditional draft; no gatekeeper contract; 163 cases, 20 tests |
| 3 | Circuit Jobs | [#82](https://github.com/TapeOutProtocol/TAPs/issues/82) "Circuit Jobs: Settling Agent Jobs by a Dispute Game (Application)" | [#85](https://github.com/TapeOutProtocol/TAPs/pull/85) | Conditional draft; no Solidity reference yet; 194 cases, 22 tests |

All three pull requests are open: #83, #84 and #85.

**Agent Passport.** A passport exists when one address holds both a TapeOut circuit and an ERC-8004 identity, the identity's metadata names the circuit (`tap.passport`), the circuit's site names exactly that `agentId` back, and the identity's `agentWallet` is the holder. The Passport defines how a tool resolves this at one pinned block (chain before files, strict agreement), what it shows (CONFIRMED or a named reason), and how holder epochs keep a former holder's reputation away from a new one. Its core rules require only the merged TAP-10, TAP-11 and TAP-13 and the deployed ERC-8004 registry; every other pull request it mentions is a conditional reference.

**Policy Circuit Gate.** An agent's spending rule is written as a `tapnet/1` circuit; the rule's netlist hash is bound to a subject by an EIP-712 `PolicyBinding`; a counterparty encodes a spend request into a 128-bit word and re-runs the circuit; only `allow = 1, reason = 0` allows. Five example policies run from 135 to 5,076 bytes. The gate constrains only the parties that check it; it is not a signing guard.

**Circuit Jobs.** A contract that is both the evaluator and the hook of an ERC-8183 job. The job's specification names a circuit, its inputs, its length and its budget; the provider makes a claim in the #74 game and submits the claim id as the deliverable; the evaluator completes the job when the claim is accepted and rejects it when the claim is rejected, with no discretion. It is conditional on a game whose settlement bound holds (see §9, limit 4).

## Next: addenda to open pull requests

Prepared as small patches against the current heads of the target pull requests, to be pushed **after** the three new pull requests are open. None adds new vectors.

| Target | Addendum | Kind | Status |
|---|---|---|---|
| [#16](https://github.com/TapeOutProtocol/TAPs/pull/16) | A2A agent cards generated from a passport (display only) and notes on the MCP 2026-07-28 revision | Informative | Prepared |
| [#47](https://github.com/TapeOutProtocol/TAPs/pull/47) | How a phase-0 mandate relates to other mandate formats, A2A task mapping, the frozen-holder risk | Mostly informative; two SHOULDs | Prepared |
| [#59](https://github.com/TapeOutProtocol/TAPs/pull/59) | Relation of escrow channels to x402 receipts | Informative | Prepared |
| [#54](https://github.com/TapeOutProtocol/TAPs/pull/54) | Optional, read-only mirroring of reviews to ERC-8004 reputation | Optional section | Under consideration |

Three questions are open before these land: the default delegation period for agents (7 days in the Passport, 30 days in the #47 addendum, aligned with that draft's maximum mandate); whether reviews may be mirrored to ERC-8004 reputation at all; and whether the buyer of a circuit inherits its reviews (the #54 rationale says yes; the Passport keeps #54 reviews with the container but attributes no earlier-epoch reputation to the current holder).

## Later: needs the author's own runs

| Item | Why | Status |
|---|---|---|
| A small mainnet run of the passport flow | Nobody has run the full flow on mainnet; until then the Passport's walkthrough stays marked unverified | Not done |
| Re-run the fork measurements on a fresh block | The ERC-8004 registries and the ERC-8183 kernel are upgradeable; the facts in §8 hold for block 129,352,831 only | Required before any deployment |
| BSC testnet deployment of the reference contracts | Chain 97 has no TapeOut contracts today, so end-to-end demonstrations use a local fork | Not done |
| Wallet behaviour measurements | For example, whether a signing wallet signs the same EIP-712 message identically twice, which decides how an EIP-712-only holder can use the TAP-10 sealed inbox (§9, limit 2) | Not done |

## Under design

Two further drafts, **dispute economics** (bonds, deadlines and a settlement bound for the #74 game) and **verifiable netlist contests** (entries settled by the game, results issued as credentials), exist locally. They are not submitted and depend on design questions that are not settled, chiefly how parallel disputes are counted and which settlement model the game uses. Circuit Jobs names no rule of either; it depends only on the meaning of the game's settlement bound.

## Status log

Newest entry on top. Each entry says what changed and where.

- **2026-10-24.** Map and roadmap published ([docs/agent-universe.md](docs/agent-universe.md), English and Chinese). The three new drafts were opened as pull requests in TapeOutProtocol/TAPs: Agent Passport [#83](https://github.com/TapeOutProtocol/TAPs/pull/83) (Idea [#80](https://github.com/TapeOutProtocol/TAPs/issues/80)), Policy Circuit Gate [#84](https://github.com/TapeOutProtocol/TAPs/pull/84) (Idea [#81](https://github.com/TapeOutProtocol/TAPs/issues/81)) and Circuit Jobs [#85](https://github.com/TapeOutProtocol/TAPs/pull/85) (Idea [#82](https://github.com/TapeOutProtocol/TAPs/issues/82)). This repository was set up with mirrors of the three pull requests at heads `cae25e6`, `7827c07` and `01e4ee8`.
