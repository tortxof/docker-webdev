FROM tortxof/ruby-node
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN gem install jekyll therubyracer sass susy compass breakpoint mustache bourbon neat
RUN for i in jade; do npm install $i -g; done

VOLUME ["/host"]

WORKDIR /host

CMD ["/bin/bash"]
