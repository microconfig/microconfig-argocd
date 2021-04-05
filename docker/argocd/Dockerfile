FROM argoproj/argocd:latest

# Switch to root for the ability to perform install
USER root

# Install tools needed for your repo-server to retrieve & decrypt secrets, render manifests
# (e.g. curl, awscli, gpg, sops)
RUN apt-get update && \
    apt-get install -y curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    curl -o microctl.zip -sL https://github.com/microconfig/microconfig-server/releases/download/v0.5.0/microctl-alpine.zip && \
    unzip microctl.zip && mv microctl /usr/local/bin && rm microctl.zip && \
    chmod +x /usr/local/bin/microctl

# Switch back to non-root user
USER argocd