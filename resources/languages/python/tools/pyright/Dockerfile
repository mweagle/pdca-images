FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

WORKDIR /workspace

RUN npm install -g pyright || (apt-get update && apt-get install -y nodejs npm && npm install -g pyright)

ENTRYPOINT ["pyright"]
