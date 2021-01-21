#!/bin/sh -l

IFS='/' read -r username repository <<EOF
$GITHUB_REPOSITORY
EOF

GREN_VERSION=0.17.3
GREN_RC_TEMPLATE=/.grenrc.default.js
REPO_GREN_RC=.grenrc.js

if [ ! -f "$REPO_GREN_RC" ]; then
  cp $GREN_RC_TEMPLATE $REPO_GREN_RC
  REPO_USING_TEMPLATE=true
fi

npx -p github-release-note@$GREN_VERSION gren release --token=$1 --username=$username --repo=$repository --config $REPO_GREN_RC --override $2
# save exit code
EXIT_CODE=$?

if [ -n "$REPO_USING_TEMPLATE" ]; then
  rm $REPO_GREN_RC
fi

exit $EXIT_CODE