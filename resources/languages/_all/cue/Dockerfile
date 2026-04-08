FROM alpine:3.21

ARG CUE_VERSION=v0.16.1
ARG TARGETARCH
WORKDIR /workspace

RUN apk add --no-cache ca-certificates curl tar && \
    case "$TARGETARCH" in \
      amd64|arm64) ;; \
      *) echo "unsupported TARGETARCH: $TARGETARCH" >&2; exit 1 ;; \
    esac && \
    curl -fsSL \
      "https://github.com/cue-lang/cue/releases/download/${CUE_VERSION}/cue_${CUE_VERSION}_linux_${TARGETARCH}.tar.gz" \
      -o /tmp/cue.tar.gz && \
    tar -xzf /tmp/cue.tar.gz -C /tmp cue && \
    install -m 0755 /tmp/cue /usr/local/bin/cue && \
    rm -f /tmp/cue.tar.gz /tmp/cue

ENTRYPOINT ["cue"]
