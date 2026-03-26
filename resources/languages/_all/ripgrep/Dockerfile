FROM debian:bookworm-slim

WORKDIR /workspace

RUN apt-get update && \
    apt-get install -y --no-install-recommends ripgrep && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["rg"]
