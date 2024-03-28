#!/usr/bin/env bash
#check if X11
if [ $XDG_SESSION_TYPE == "x11" ]; then
  # I don't actaully have x11 installed so I'm not sure if this is correct
  menu='dmenu'
  clip='xsel --secondary --i'
  pipe=true
else
  menu='bemenu'
  clip='wl-copy -o'
  pipe=false
fi

set -euf -o pipefail
FORMAT='%an (%au) | %ai'

# Try fetch the list without syncing, but sync if lpass-cli doesnt have the blob cached
LPASS_ITEMS=$(lpass ls --sync=no --color=never --format="$FORMAT" || printf 'no-sync')

# for debugging
# LPASS_ITEMS='no-sync'

if [[ "${LPASS_ITEMS}" == 'no-sync' ]]
then
  echo 'Syncing LastPass...'
  LPASS_ITEMS=$(lpass ls --sync=auto --color=never --format="$FORMAT" || printf 'no-sync')
  if [[ "${LPASS_ITEMS}" == 'no-sync' ]]
  then
    printf 'You need to login to LastPass first: (lpass login --trust <username>)\n' | $menu -p 'LastPass'
    exit 1
  fi
fi
LPASS_ITEMS_NO_ID=$(echo "${LPASS_ITEMS}" | sed 's/|.*//')

LPASS_SELECTION=$(echo "${LPASS_ITEMS_NO_ID}" | $menu -p 'LastPass' -i -l 20)
SELECTION_INDEX=$(echo "${LPASS_ITEMS_NO_ID}" | grep -n "${LPASS_SELECTION}" | cut -d: -f1)
LPASS_SELECTION_ID=$(echo "${LPASS_ITEMS}" | sed "${SELECTION_INDEX}q;d" | sed 's/.*| //' | xargs)

pw=$(lpass show --sync=no --password "${LPASS_SELECTION_ID}")
if $pipe; then
  echo "$pw" | $clip
else
  $clip "$pw"
fi
