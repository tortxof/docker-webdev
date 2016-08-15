FROM tortxof/ruby-node
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN mkdir -p /usr/local/heroku && \
    cd /usr/local/heroku && \
    wget -qO- https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz | tar xz && \
    mv heroku-client/* . && \
    rm -rf heroku-client

ENV PATH=/usr/local/heroku/bin:$PATH

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN gem install jekyll therubyracer sass susy compass breakpoint mustache bourbon neat
RUN npm install -g eslint nodemon node-inspector jade webpack grunt gulp bower browser-sync foundation-cli ember-cli express-generator http-server harp

ENV TERM=linux

ENV HOME=/host

VOLUME ["/host"]

WORKDIR /host

CMD ["/bin/bash"]
