FROM ubuntu:latest

ENV TERM xterm-256color

ADD deps.sh .
RUN ./deps.sh

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
