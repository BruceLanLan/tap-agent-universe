# Contributing

This repository collects the TapeOut agent TAP work in one place. The drafts themselves live as pull requests in [TapeOutProtocol/TAPs](https://github.com/TapeOutProtocol/TAPs); that is where review happens.

- **Review a draft:** comment on its pull request ([#83](https://github.com/TapeOutProtocol/TAPs/pull/83) Agent Passport, [#84](https://github.com/TapeOutProtocol/TAPs/pull/84) Policy Circuit Gate, [#85](https://github.com/TapeOutProtocol/TAPs/pull/85) Circuit Jobs), or on its Idea issue ([#80](https://github.com/TapeOutProtocol/TAPs/issues/80), [#81](https://github.com/TapeOutProtocol/TAPs/issues/81), [#82](https://github.com/TapeOutProtocol/TAPs/issues/82)). Comments left here on a mirrored file are not seen by the TAPs editors.
- **Mirrors (`drafts/<name>/`):** never edited by hand. A mirror changes only by syncing it from the head of its pull request: copy the specification and the assets folder unchanged, update the head in `drafts/<name>/README.md`, run `scripts/mirror-check.sh`, and record the sync in the status log of `ROADMAP.md` and `ROADMAP.zh.md`.
- **Map and roadmap (`docs/`, `ROADMAP*.md`):** corrections are welcome as issues or pull requests here. When a status changes, update the lane and add a dated entry to the status log, in English and Chinese together.
- **Checks:** CI runs `python make_vectors.py --check` and the tests of each draft from its assets folder. Run them locally the same way before proposing a change.

Licensing: see [NOTICE](NOTICE).
