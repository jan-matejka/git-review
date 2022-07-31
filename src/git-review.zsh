#!/usr/bin/zsh

# todo: git-review should also facilitate:
# - review on a range (master..wip) and limited by file path modified rst/foobar.rst (preparing
#   foobar release candidate)

SELF="${0##*/}"

local rev=${1}

# We force git to not use pager via `PAGER` *export* in order to be able to use custom git-show that
# will in turn call multiple git commands to display more information about each commit.
#
# Finally we provide custom pager and force git-show to print colors even tho it is not connected to
# terminal directly.

export PAGER=""

: ${GIT_REVIEW_SHOW_CMD:=git show --color=always}

review_commit="${GIT_REVIEW_SHOW_CMD} \$1 | less -cRX"

[[ "${rev}" == "" ]] && {
  rev=$(git rev-parse --abbrev-ref HEAD)
  [[ $rev == "HEAD" ]] && {
    printf >&2 "%s: <rev> is empty and not standing on a branch\n" $SELF
    exit 1
  } || {
    : ${GIT_REVIEW_TARGET:=master}
    rev="${GIT_REVIEW_TARGET}..$rev"
  }
}

# check the rev is valid and abort if not. Going forward with invalid rev may produce pretty
# confusing results.
git rev-parse $rev >/dev/null || exit

git log --pretty=format:"%H" --reverse $rev \
  | xargs -n1 sh -c $review_commit ""
