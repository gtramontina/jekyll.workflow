# jekyll.workflow
## master ⇝ gh-pages

A simple combination of a few bash scripts and a `Makefile` to support you jekyll develpment and deployment to gh-pages.

### Getting started
Run this one-liner on the root of yout project:
```bash
curl -L https://raw.github.com/gtramontina/jekyll.workflow/master/install.sh | sh
```
This will copy `Makefile` and the `scripts` directory over to your project so you can start using it right away.

### Main `make` goals
* `make` or `make install`: checks whether you have a gh-pages branch and create it if you don't. It also runs `bundle install` in order to get any `Gemfile` updates. Feel free to remove this last piece if it does not apply to your scenario.
* `make dist`: clones the gh-pages branch into your project destination directory (it'll read from `_config.yml` if you have it specified there) and runs `jekyll build`.
* `make serve`: starts jekyll's server in watch mode.
* `make deploy`: this is where the crazyness happens. It runs `dist` and then creates a release by pushing the changes to `origin/gh-pages`

Enjoy!
