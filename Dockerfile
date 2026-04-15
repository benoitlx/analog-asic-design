FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:0.4.20 /uv /bin/uv
ENV UV_SYSTEM_PYTHON=1

RUN apt-get update && \
apt-get install -y --no-install-recommends libexpat1 libexpat1-dev && \
rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --link pyproject.toml .
COPY --link designs/nmos/nmos.py .

EXPOSE 8080

# RUN useradd -m app_user
# USER app_user

RUN uv venv
CMD ["uv", "run", "marimo", "run", "nmos.py", "--host", "0.0.0.0", "-p", "8080", "--include-code", "--no-sandbox"]
