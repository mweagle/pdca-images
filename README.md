# pdca-images

Docker image source repo for PDCA runtime/tooling containers that are built in GitHub Actions and published to GHCR.

## Scope

This repo only builds images that add PDCA-specific value (custom tooling or pinned behavior).

Upstream images that are used directly by `pdca` are intentionally **not** rebuilt here.

Current upstream-direct examples:
- `golang:1.24` (Go runtime)
- `fe3dback/go-arch-lint:latest-stable-release`
- `golangci/golangci-lint:latest-alpine`

## Layout

- `resources/...` contains Docker build contexts.
- `.github/workflows/...` contains one workflow per image.

Each workflow:
- triggers on changes to its image directory or its own workflow file
- builds and pushes to `ghcr.io/<owner>/pdca-...`
- publishes `sha`, `branch`, `tag`, and `latest` (default branch) tags

## Images Currently Built

- `pdca-languages-all-ast-grep`
- `pdca-languages-go-tools-go-test-cov`
- `pdca-languages-python-tools-bandit`
- `pdca-languages-python-tools-pyright`
- `pdca-languages-python-tools-pytest-cov`
- `pdca-languages-python-tools-radon`
- `pdca-languages-python-tools-ruff`
- `pdca-languages-python-tools-tach`

## Adding a New Image

1. Add a Docker context under `resources/...`.
2. Add one workflow in `.github/workflows/` for that context.
3. Use the same naming pattern:
- workflow name: `build-<resource-path>.yml`
- image name: `ghcr.io/${{ github.repository_owner }}/pdca-<resource-path-with-dashes>`

For Docker/GHCR image names, normalize leading underscore path segments to avoid invalid references (example: `_all` becomes `all`).
