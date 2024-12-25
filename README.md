# Notify pkg.go.dev on Release

This GitHub Action sends a POST request to `pkg.go.dev` whenever a new release is published in your repository.

## Inputs

- `repository`: The GitHub repository (default: `${{ github.repository }}`).
- `release_tag`: The release tag name (default: `${{ github.event.release.tag_name }}`).
- `base_url`: The base URL for pkg.go.dev (default: `https://pkg.go.dev/fetch`).

## Example Usage

```yaml
name: Notify pkg.go.dev on Release

on:
  release:
    types: [published]

jobs:
  notify:
    runs-on: ubuntu-latest

    steps:
      - name: Notify pkg.go.dev
        uses: siyul-park/notify-pkg-go-dev@@v1
