#!/usr/bin/env bash
# Read-only: compares each mirror under drafts/ with the live head of its pull request in
# TapeOutProtocol/TAPs, using blob hashes from the GitHub API (needs an authenticated `gh`).
# Nothing is written, fetched into the tree or pushed. Exit status 1 if anything differs.
set -euo pipefail

UPSTREAM="TapeOutProtocol/TAPs"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

# name  pull request
MIRRORS="agent-passport 83
policy-circuit-gate 84
circuit-jobs 85"

status=0
while read -r name pr; do
  dir="drafts/$name"
  pinned="$(grep -o 'at head `[0-9a-f]*`' "$dir/README.md" | head -n 1 | tr -d '`' | awk '{print $3}')"
  info="$(gh pr view "$pr" --repo "$UPSTREAM" --json headRefOid,headRepository,state \
          --jq '[.headRefOid, .headRepository.nameWithOwner, .state] | @tsv')"
  head_sha="$(cut -f1 <<<"$info")"; head_repo="$(cut -f2 <<<"$info")"; state="$(cut -f3 <<<"$info")"
  echo "== $name: #$pr ($state) head ${head_sha:0:7} in $head_repo; pinned here ${pinned:-none}"
  if [[ -z "$pinned" || "$head_sha" != "$pinned"* ]]; then
    echo "   NOTE: the pull request head differs from the head named in $dir/README.md"
  fi

  remote="$(mktemp)"; local_list="$(mktemp)"
  # path<TAB>blob sha for the specification and the assets folder at the pull request head
  gh api "repos/$head_repo/git/trees/$head_sha?recursive=1" \
    --jq ".tree[] | select(.type == \"blob\") | select(.path == \"TAPs/TAP-draft-$name.md\" or (.path | startswith(\"assets/tap-draft-$name/\"))) | [.path, .sha] | @tsv" \
    | sed -e "s#^TAPs/TAP-draft-$name.md#TAP-draft-$name.md#" -e "s#^assets/tap-draft-$name/#assets/#" \
    | sort > "$remote"
  ( cd "$dir"
    { echo "TAP-draft-$name.md"; find assets -type f ! -path '*/__pycache__/*' ! -name '.DS_Store'; } \
      | sort -u \
      | while read -r f; do printf '%s\t%s\n' "$f" "$(git hash-object "$f")"; done ) | sort > "$local_list"

  if diff -u --label "pull request #$pr" --label "$dir" "$remote" "$local_list"; then
    echo "   identical ($(wc -l < "$remote" | tr -d ' ') files)"
  else
    status=1
  fi
  rm -f "$remote" "$local_list"
done <<<"$MIRRORS"

exit "$status"
