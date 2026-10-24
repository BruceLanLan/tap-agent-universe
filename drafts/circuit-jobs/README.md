# Circuit Jobs (mirror)

Mirror of pull request [#85](https://github.com/TapeOutProtocol/TAPs/pull/85) at head `01e4ee8` (`01e4ee89b4fa7d0777c3189a1dda087ef9865ca4`); the pull request is authoritative. Idea issue: [#82](https://github.com/TapeOutProtocol/TAPs/issues/82).

| Here | In the pull request |
|---|---|
| `TAP-draft-circuit-jobs.md` | `TAPs/TAP-draft-circuit-jobs.md` |
| `assets/` | `assets/tap-draft-circuit-jobs/` |

Both are byte-identical copies; nothing in them is edited here. Paths and relative links inside the mirrored files refer to the layout of the TAPs repository: for example the specification's `../LICENSE` is the CC0 notice of that repository (the same dedication is in [LICENSE-CC0](../../LICENSE-CC0) here), and `assets/tap-draft-circuit-jobs/` is the `assets/` folder next to this note. Review comments belong on the pull request, not here.

## Checks

194 cases, 22 tests. Standard library only; the `cast` cross-checks run only when Foundry `cast` is installed.

```
cd assets
python make_vectors.py --check && python test_circuit_jobs.py
```

Run from the `assets/` folder. CI runs the same commands with Python 3.11 ([workflow](../../.github/workflows/ci.yml)). `scripts/mirror-check.sh` in the repository root compares this folder with the live head of the pull request.
