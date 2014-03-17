.PHONY: install
install: gh-pages; @bundle install

.PHONY: gh-pages
gh-pages:; @script/gh-pages

.PHONY: dirty-check
dirty-check:; @script/dirty-check

.PHONY: dist
dist:; @script/dist

.PHONY: deploy
deploy: dirty-check dist; @script/deploy

.PHONY: serve
serve:; @jekyll serve --baseurl '' -w
