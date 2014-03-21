#!/bin/bash

TMP="/tmp/$(LC_CTYPE=C tr -dc 0-9 < /dev/urandom | head -c 20 | xargs | cat)"

git clone \
  --single-branch \
  --branch=master \
  --depth=1 https://github.com/gtramontina/jekyll.workflow \
  $TMP


if [[ -d .git ]]; then
  echo '# A git repository has been decected.'
  read -p '# Do you want to make this installation as a commit? (y/N) ' -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    if [[ ! `(git status --porcelain 2> /dev/null) && (git log origin/master..master 2> /dev/null)` ]]; then
      WORKING_BRANCH=$(git rev-parse --abbrev-ref HEAD || echo master)
      git checkout -b jekyll.workflow_install
      cp $TMP/Makefile .
      rsync -a $TMP/script .
      git add . -A
      git commit -m "Install jekyll.workflow." --author="jekyll.workflow <https://github.com/gtramontina/jekyll.workflow>"
      git checkout $WORKING_BRANCH
      git merge jekyll.workflow_install
      echo "# Done. You can start using jekyll.workflow's Makefile now."
      echo
    else
      echo '# You currently have unstaged changes.'
      echo '# Please commit or stash them and try installing jekyll.workflow again.'
    fi
  else
    cp $TMP/Makefile .
    rsync -a $TMP/script .
    echo "# Done. You can start using jekyll.workflow's Makefile now."
    echo
  fi
else
  cp $TMP/Makefile .
  rsync -a $TMP/script .
  echo "# Done. You can start using jekyll.workflow's Makefile now."
  echo
fi

rm -rf $TMP
