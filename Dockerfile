FROM tortxof/ruby-node
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN mkdir -p /usr/local/heroku && \
    cd /usr/local/heroku && \
    wget -qO- https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz | tar xz && \
    mv heroku-client/* . && \
    rm -rf heroku-client

ENV PATH=/usr/local/heroku/bin:$PATH

RUN wget -qO /usr/local/bin/stout https://github.com/EagerIO/Stout/releases/download/v1.3.1/stout-linux && \
    chmod +x /usr/local/bin/stout

RUN apt-get update && \
    apt-get install -y \
      apt-transport-https \
      ca-certificates \
      sudo \
      groff \
      less

ENV CLOUDSDK_PYTHON=/usr/bin/python2
ENV CLOUD_SDK_REPO=cloud-sdk-jessie
RUN echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

RUN apt-get update && \
    apt-get install -y \
      google-cloud-sdk \
      kubectl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awscli
RUN gem install -f jekyll therubyracer sass susy compass breakpoint mustache bourbon neat
RUN npm install -g eslint nodemon node-inspector babel-cli jade webpack grunt gulp bower browser-sync autoprefixer-cli foundation-cli ember-cli express-generator http-server harp brunch create-react-app

ENV TERM=linux

ENV HOME=/host

VOLUME ["/host"]

WORKDIR /host

CMD ["/bin/bash"]
