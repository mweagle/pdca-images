FROM rust:1.86-slim-bookworm AS builder

# Install tokei using the crate lockfile for deterministic dependency resolution.
RUN cargo install --locked tokei

FROM debian:bookworm-slim

WORKDIR /workspace

COPY --from=builder /usr/local/cargo/bin/tokei /usr/local/bin/tokei

ENTRYPOINT ["tokei"]
