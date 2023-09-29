FROM debian:12-slim

# Use latest recommended version here
ARG HELM_VERSION=3.13.0

WORKDIR /usr/local/bin

# Install Helm, helm-gcs plugin, git and openssh-client
RUN apt-get update -y && apt-get install -y --no-install-recommends curl git openssh-client && \
  curl -sSL https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar xz \
  --strip=1 linux-amd64/helm && \
  helm plugin install https://github.com/hayorov/helm-gcs.git --version 0.3.6 && \
  apt-get purge -y curl && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* \
  rm -rf ~/.cache ~/.local/share/helm/plugins/helm-gcs.git/.git && \
  helm version && helm plugin list

ENV HELM_PLUGINS=/root/.local/share/helm/plugins

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
