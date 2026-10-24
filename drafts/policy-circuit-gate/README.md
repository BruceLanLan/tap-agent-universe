# Policy Circuit Gate (mirror)

Mirror of pull request [#84](https://github.com/TapeOutProtocol/TAPs/pull/84) at head `7827c07` (`7827c07d31da1bd00f5c13c05f7f578e8cf00956`); the pull request is authoritative. Idea issue: [#81](https://github.com/TapeOutProtocol/TAPs/issues/81).

| Here | In the pull request |
|---|---|
| `TAP-draft-policy-circuit-gate.md` | `TAPs/TAP-draft-policy-circuit-gate.md` |
| `assets/` | `assets/tap-draft-policy-circuit-gate/` |

Both are byte-identical copies; nothing in them is edited here. Paths and relative links inside the mirrored files refer to the layout of the TAPs repository: for example the specification's `../LICENSE` is the CC0 notice of that repository (the same dedication is in [LICENSE-CC0](../../LICENSE-CC0) here), and `assets/tap-draft-policy-circuit-gate/` is the `assets/` folder next to this note. Review comments belong on the pull request, not here.

## Checks

163 cases, 20 tests. Standard library only; the EIP-712 cross-check runs only when `eth-account` is installed.

```
cd assets
python make_vectors.py --check && python test_policy_gate.py
```

The scripts insert their own directory into `sys.path`, so they also run as `python -I <path>/<script>` from any directory. CI runs the same commands with Python 3.11 ([workflow](../../.github/workflows/ci.yml)). `scripts/mirror-check.sh` in the repository root compares this folder with the live head of the pull request.
