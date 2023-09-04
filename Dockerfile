FROM alpine:latest

RUN echo "Let's try not setting the token in the merge action"

CMD ["/bin/sh"]