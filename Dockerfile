FROM tortxof/ruby-node
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN mkdir -p /usr/local/heroku && \
    cd /usr/local/heroku && \
    wget -qO- https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz | tar xz && \
    mv heroku-client/* . && \
    rm -rf heroku-client

ENV PATH=/usr/local/heroku/bin:$PATH

RUN wget -qO /usr/local/bin/stout https://github.com/EagerIO/Stout/releases/download/v1.3.0/stout-linux && \
    chmod +x /usr/local/bin/stout

RUN apt-get update && \
    apt-get install -y sudo groff less && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awscli
RUN gem install jekyll therubyracer sass susy compass breakpoint mustache bourbon neat
RUN npm install -g eslint nodemon node-inspector babel-cli jade webpack grunt gulp bower browser-sync autoprefixer-cli foundation-cli ember-cli express-generator http-server harp brunch

ENV TERM=linux

ENV HOME=/host

VOLUME ["/host"]

WORKDIR /host

CMD ["/bin/bash"]
