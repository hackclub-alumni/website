ARG PYTHON_VERSION=3.14
FROM python:${PYTHON_VERSION}-bookworm

### COPIED FROM UPSTREAM: https://github.com/devcontainers/images/blob/main/src/python/.devcontainer/Dockerfile ###
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    # Remove imagemagick due to https://security-tracker.debian.org/tracker/CVE-2019-10131
    && apt-get purge -y imagemagick imagemagick-6-common

RUN python3 -m pip install --upgrade \
    setuptools==78.1.1 \
    gitpython==3.1.41

RUN curl -fsSL https://raw.githubusercontent.com/devcontainers/images/refs/heads/main/src/python/.devcontainer/scripts/install-subversion.sh \
    | bash
### COPIED FROM UPSTREAM: https://github.com/devcontainers/images/blob/main/src/python/.devcontainer/Dockerfile ###

# Install uv cli tool
RUN curl -LsSf https://astral.sh/uv/install.sh | sh