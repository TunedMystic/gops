### gops - a GOlang Project Sample

This repo contains a simple golang cli that we deploy with [goreleaser](https://goreleaser.com/).

A Makefile is provided to help with dev workflow, however goreleaser takes care of building and deploying the binaries.

### Steps to golang binary release:

- Download [goreleaser](https://goreleaser.com/).
- Make a .goreleaser.yml file with configs for your binary / package.
- Make a Github Token [here](https://github.com/settings/tokens/new) with the **repo** scope selected. Export the token in your env `export GITHUB_TOKEN="<YOUR_GITHUB_TOKEN>"`.
- Commit your code.
- Make a github tag _(`git tag v0.0.4` or something)_.
- Run `goreleaser --rm-dist` to release your project on github.

If you configured `goreleaser` to make a brew Formula, that will get generated and pushed to the correct repository.
