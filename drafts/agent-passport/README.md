# Agent Passport (mirror)

Mirror of pull request [#83](https://github.com/TapeOutProtocol/TAPs/pull/83) at head `cae25e6` (`cae25e6df54ad2e2e38e185304de55f92792966d`); the pull request is authoritative. Idea issue: [#80](https://github.com/TapeOutProtocol/TAPs/issues/80).

| Here | In the pull request |
|---|---|
| `TAP-draft-agent-passport.md` | `TAPs/TAP-draft-agent-passport.md` |
| `assets/` | `assets/tap-draft-agent-passport/` |

Both are byte-identical copies; nothing in them is edited here. Paths and relative links inside the mirrored files refer to the layout of the TAPs repository: for example the specification's `../LICENSE` is the CC0 notice of that repository (the same dedication is in [LICENSE-CC0](../../LICENSE-CC0) here), and `assets/tap-draft-agent-passport/` is the `assets/` folder next to this note. Review comments belong on the pull request, not here.

## Checks

147 cases, 18 tests. Standard library only; one cross-check runs only when Foundry `cast` is installed.

```
cd assets
python make_vectors.py --check && python test_passport.py
```

Run from the `assets/` folder itself: `test_passport.py` imports its sibling modules through the script directory, so it is not meant for `python -I` from elsewhere. CI runs the same commands with Python 3.11 ([workflow](../../.github/workflows/ci.yml)). `scripts/mirror-check.sh` in the repository root compares this folder with the live head of the pull request.
