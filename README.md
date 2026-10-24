# TAP Agent Universe

This repository is the home of the TapeOut agent TAP work: the map and roadmap of everything agent-related in the TapeOut TAP family, and read-only mirrors of the three agent drafts now open as pull requests in [TapeOutProtocol/TAPs](https://github.com/TapeOutProtocol/TAPs). It defines nothing itself; the drafts are reviewed and decided in the TAPs repository. Maintained by Bruce ([@BruceLanLan](https://github.com/BruceLanLan)), the author of the drafts. [中文](README.zh.md)

## Status (2026-10-24)

| Item | Idea issue | Pull request | Status | Here |
|---|---|---|---|---|
| Agent Universe map and roadmap | — | — | Published in this repository; informative | [docs/agent-universe.md](docs/agent-universe.md) |
| Agent Passport | [#80](https://github.com/TapeOutProtocol/TAPs/issues/80) | [#83](https://github.com/TapeOutProtocol/TAPs/pull/83) | Open; text in English and Chinese; 147 cases, 18 tests | [drafts/agent-passport](drafts/agent-passport/) |
| Policy Circuit Gate | [#81](https://github.com/TapeOutProtocol/TAPs/issues/81) | [#84](https://github.com/TapeOutProtocol/TAPs/pull/84) | Open; conditional draft, no gatekeeper contract; 163 cases, 20 tests | [drafts/policy-circuit-gate](drafts/policy-circuit-gate/) |
| Circuit Jobs | [#82](https://github.com/TapeOutProtocol/TAPs/issues/82) | [#85](https://github.com/TapeOutProtocol/TAPs/pull/85) | Open; conditional draft, no Solidity reference yet; 194 cases, 22 tests | [drafts/circuit-jobs](drafts/circuit-jobs/) |

Nothing under these drafts is deployed on any chain. The lanes after these three (addenda, the author's own runs, drafts under design) are in [ROADMAP.md](ROADMAP.md).

## How to read

1. [docs/agent-universe.md](docs/agent-universe.md): the thesis, the layered map of all agent-related merged TAPs and pull requests, a reading order in six sittings, journeys marked today / fork / future, a glossary of colliding words, and the verification status.
2. The three drafts in the order of the map: Agent Passport (its core rules depend only on merged TAPs), then Policy Circuit Gate, then Circuit Jobs.
3. [ROADMAP.md](ROADMAP.md) for what changed since, in its dated status log.

## Where things live

| Path | What |
|---|---|
| `docs/` | The map and roadmap, English and Chinese |
| `ROADMAP.md`, `ROADMAP.zh.md` | Living status lanes and the dated status log |
| `drafts/<name>/` | Byte-identical mirror of one pull request: `TAP-draft-<name>.md` and `assets/` (reference code, vectors, tests); the folder's `README.md` names the head it mirrors |
| `scripts/mirror-check.sh` | Read-only comparison of the mirrors with the live pull request heads |
| `.github/workflows/ci.yml` | Regenerates every vector file (`--check`) and runs every test suite |

## How to review or contribute

Review comments go on the pull requests ([#83](https://github.com/TapeOutProtocol/TAPs/pull/83), [#84](https://github.com/TapeOutProtocol/TAPs/pull/84), [#85](https://github.com/TapeOutProtocol/TAPs/pull/85)) or their Idea issues, where the TAPs editors read them. Corrections to the map or roadmap are welcome as issues here. The mirrors change only by syncing from the pull requests; see [CONTRIBUTING.md](CONTRIBUTING.md).

## Acknowledgement and scope

This work is written in acknowledgement of ERC-8004 (Trustless Agents) and ERC-8183 (Agentic Commerce), whose authors defined agent identity and agent jobs for Ethereum; the TapeOut drafts are written to interoperate with their deployed contracts and are not official extensions of either proposal.

No partnership, integration or endorsement by any wallet provider, chain, protocol or standard author named in this repository is claimed, including the authors of ERC-8004 and ERC-8183. Interoperability means using their public interfaces as deployed. Where a wallet is named, it is as an example of a wallet that only signs EIP-712 such as the Binance Agentic Wallet, per its public documentation. TAP numbers are assigned by the TAPs editors; every draft here is `tap: TBD`.

## Licence

Draft texts and vectors: CC0 1.0 ([LICENSE-CC0](LICENSE-CC0)). Code and documentation: MIT ([LICENSE](LICENSE)). Details in [NOTICE](NOTICE).
