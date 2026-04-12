FROM debian:bookworm-slim

ARG TARGETARCH
ARG TOKEI_VERSION=14.0.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl tar \
    && rm -rf /var/lib/apt/lists/*

RUN set -eu; \
    case "${TARGETARCH}" in \
        amd64) TOKEI_ARCH="x86_64" ;; \
        arm64) TOKEI_ARCH="aarch64" ;; \
        *) echo "unsupported TARGETARCH: ${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    TOKEI_URL="https://github.com/XAMPPRocky/tokei/releases/download/v${TOKEI_VERSION}/tokei-${TOKEI_ARCH}-unknown-linux-gnu.tar.gz"; \
    curl -fsSL "${TOKEI_URL}" -o /tmp/tokei.tar.gz; \
    tar -xzf /tmp/tokei.tar.gz -C /usr/local/bin tokei; \
    chmod +x /usr/local/bin/tokei; \
    rm -f /tmp/tokei.tar.gz

WORKDIR /workspace

ENTRYPOINT ["tokei"]
