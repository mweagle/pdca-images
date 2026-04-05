# straigent-images

Docker image source repo for straigent-engine runtime/tooling containers that are built in GitHub Actions and published to GHCR.

## Scope

This repo only builds images that add straigent-engine-specific value (custom tooling or pinned behavior).

Upstream images that are used directly by `straigent-engine` are intentionally **not** rebuilt here.

Current upstream-direct examples:
- `golang:1.24` (Go runtime)
- `fe3dback/go-arch-lint:latest-stable-release`
- `golangci/golangci-lint:latest-alpine`

## Layout

- `resources/...` contains Docker build contexts.
- `.github/workflows/...` contains one workflow per image.

Each workflow:
- triggers on changes to its image directory or its own workflow file
- builds and pushes to `ghcr.io/<owner>/straigent-engine-...`
- publishes `sha`, `branch`, `tag`, and `latest` (default branch) tags

## Images Currently Built

- `straigent-engine-languages-all-ast-grep`
- `straigent-engine-languages-all-gitleaks`
- `straigent-engine-languages-all-import-linter`
- `straigent-engine-languages-all-lizard`
- `straigent-engine-languages-all-ripgrep`
- `straigent-engine-languages-all-semgrep`
- `straigent-engine-languages-go-tools-go-test-cov`
- `straigent-engine-languages-python-tools-bandit`
- `straigent-engine-languages-python-tools-pyright`
- `straigent-engine-languages-python-tools-pytest-cov`
- `straigent-engine-languages-python-tools-radon`
- `straigent-engine-languages-python-tools-ruff`
- `straigent-engine-languages-python-tools-tach`
- `straigent-engine-languages-python-tools-vulture`

## Adding a New Image

1. Add a Docker context under `resources/...`.
2. Add one workflow in `.github/workflows/` for that context.
3. Use the same naming pattern:
- workflow name: `build-<resource-path>.yml`
- image name: `ghcr.io/${{ github.repository_owner }}/straigent-engine-<resource-path-with-dashes>`

For Docker/GHCR image names, normalize leading underscore path segments to avoid invalid references (example: `_all` becomes `all`).
