FROM debian:stable

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt update && apt-get install -y curl

# Create a script file sourced by both interactive and non-interactive bash shells
ENV BASH_ENV /root/.bash_env
RUN touch "${BASH_ENV}"
RUN echo '. "${BASH_ENV}"' >> ~/.bashrc

# Download and install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | PROFILE="${BASH_ENV}" bash
RUN echo node > .nvmrc
