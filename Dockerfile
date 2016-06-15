FROM tortxof/ruby-node
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN gem install jekyll therubyracer sass susy compass breakpoint mustache bourbon neat
RUN npm install -g eslint nodemon node-inspector jade grunt gulp bower browser-sync foundation-cli ember-cli express-generator http-server harp

ENV TERM=linux

ENV HOME=/host

VOLUME ["/host", "/usr/local/lib/node_modules"]

WORKDIR /host

CMD ["/bin/bash"]
