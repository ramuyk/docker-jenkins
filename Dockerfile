FROM jenkins/jenkins:lts

# Switch to root user for installing packages
USER root

# Update and upgrade packages
RUN apt-get update && apt-get -yq upgrade
RUN apt-get install -yq wget curl gnupg
RUN apt-get install -yq software-properties-common apt-utils tzdata moreutils

# Add Yarn's GPG key and repository, then install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn

# Switch to jenkins user
USER jenkins

# Install NVM as jenkins user
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Add NVM script to .bashrc of jenkins user
RUN echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.bashrc \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.bashrc \
    && echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $HOME/.bashrc

# Install Node.js, npm, and Ionic CLI using bash in one RUN command
RUN /bin/bash -c "source $HOME/.bashrc && \
    nvm install 16.20.1 && \
    npm install -g npm@8.19.4 && \
    npm install -g @ionic/cli@6.16.3"

# Add NVM directory to PATH permanently
ENV PATH="$PATH:$HOME/.nvm/versions/node/v16.20.1/bin"

# Source NVM when bash starts
RUN echo 'source $HOME/.nvm/nvm.sh' >> $HOME/.bashrc
