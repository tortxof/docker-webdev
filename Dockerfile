FROM ruby
MAINTAINER Daniel Jones <tortxof@gmail.com>

RUN gem install jekyll therubyracer sass susy compass breakpoint

VOLUME ["/host"]

WORKDIR /host

CMD ["/bin/bash"]
