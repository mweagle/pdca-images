FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /usr/local/bin/

WORKDIR /workspace

RUN pip install --no-cache-dir pytest pytest-cov

ENTRYPOINT ["pytest"]
