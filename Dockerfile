FROM raspios-lite-armhf:2022-04-04

SHELL ["/bin/bash", "-c"]

# Install dependencies
# refs: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN sudo apt-get update -y \
    && sudo apt-get install git cmake \
    build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    -y --no-install-recommends

# Install pyenv
RUN curl https://pyenv.run | bash \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc \
    && echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(pyenv init -)"' >> ~/.bashrc \
    && source ~/.bashrc

    # Python Install
RUN pyenv install

# Install dependencies
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install wheel setuptools

CMD ["/bin/bash"]
