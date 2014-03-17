#!/bin/bash

TMP="/tmp/$(LC_CTYPE=C tr -dc 0-9 < /dev/urandom | head -c 20 | xargs | cat)"

git clone \
  --single-branch \
  --branch=master \
  --depth=1 https://github.com/gtramontina/jekyll.workflow \
  $TMP

# if [[ -d .git ]]; then
#   WORKING_BRANCH=$(git rev-parse --abbrev-ref HEAD || echo master)
#   git checkout -b jekyll.workflow_install
#   cp $TMP/Makefile .
#   rsync -a $TMP/script .
#   git add . -A
#   git commit -m "Install jekyll.workflow." --author="jekyll.workflow <https://github.com/gtramontina/jekyll.workflow>"
#   git checkout -b $WORKING_BRANCH
#   git merge jekyll.workflow_install
# else

  cp $TMP/Makefile .
  rsync -a $TMP/script .
# fi
rm -rf $TMP

echo
echo "# Done. You can start using jekyll.workflow's Makefile now."
echo
