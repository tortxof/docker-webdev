FROM tortxof/ruby-node
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN gem install jekyll therubyracer sass susy compass breakpoint mustache bourbon neat
RUN npm install -g jade gulp bower foundation-cli

ENV TERM=linux

ENV HOME=/host

VOLUME ["/host"]

WORKDIR /host

CMD ["/bin/bash"]
