FROM ubuntu:20.04
LABEL maintainer="particledecay@users.noreply.github.com"

# non-interactive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# hadolint disable=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      bind9utils \
      build-essential \
      bzip2 \
      ca-certificates \
      coreutils \
      cpustat \
      curl \
      diffutils \
      dnsutils \
      elinks \
      ethtool \
      findutils \
      fish \
      git \
      gzip \
      htop \
      ifstat \
      iftop \
      iperf \
      iproute2 \
      iptables \
      iptraf-ng \
      iputils-ping \
      iputils-tracepath \
      jq \
      libxml2-dev \
      lsof \
      make \
      mongodb-clients \
      mongo-tools \
      mysql-client \
      neovim \
      net-tools \
      netcat-openbsd \
      netperf \
      nmap \
      openssh-client \
      openssl \
      postgresql-client \
      procps \
      redis-tools \
      siege \
      socat \
      sqlite3 \
      strace \
      sysstat \
      tcpdump \
      tshark \
      unzip \
      vim \
      wget \
      zsh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# create utility user
RUN adduser --disabled-password --gecos 'K8s Debugging' kubernaut \
    && adduser kubernaut sudo \
    && echo '%sudo ALL=(ALL:ALL) ALL' >> /etc/sudoers
USER kubernaut

# set up config dirs
RUN mkdir -p ~/.config/fish/completions \
    && mkdir -p ~/.kube

# install asdf (https://asdf-vm.com) for additional tooling support
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0 \
    && printf ". %s/.asdf/asdf.sh\n" "$HOME" >> ~/.bashrc \
    && printf ". %s/.asdf/completions/asdf.bash\n" "$HOME" >> ~/.bashrc \
    && printf ". %s/.asdf/asdf.sh\n" "$HOME" >> ~/.zshrc \
    && printf "fpath=(\${ASDF_DIR}/completions \$fpath)\n" >> ~/.zshrc \
    && printf "autoload -Uz compinit\ncompinit\n" >> ~/.zshrc \
    && printf "source %s/.asdf/asdf.fish\n" "$HOME" >> ~/.config/fish/config.fish \
    && ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions/

# can also execute with /bin/zsh or /usr/bin/fish
CMD [ "/bin/bash" ]
