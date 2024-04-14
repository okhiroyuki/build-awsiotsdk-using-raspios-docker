FROM raspios-lite-armhf:2022-04-04

ENV PYENV_ROOT=$HOME/.pyenv \
    PATH=$PYENV_ROOT/bin/:$PATH

# Install dependencies
# refs: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN sudo apt-get update -y \
    && sudo apt-get install git cmake \
    build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
    -y --no-install-recommends \
    && sudo apt-get clean \
    && sudo rm -rf /var/lib/apt/lists/*

# Install pyenv
# RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# RUN echo 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

RUN git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT \
    && pyenv install .python_version \
    && pyenv global `cat .python-version`

# # Python Install
# RUN eval "$(pyenv init -)" \
#     && pyenv install

# Install dependencies
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install wheel setuptools

CMD ["/bin/bash"]
